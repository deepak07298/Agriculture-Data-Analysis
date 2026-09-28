use Agriculture_project;
select*from Agriculture_data;
describe agriculture_data;
-- 30 Bussiness Insights Queries --
-- Phase 1 Basic Business Insights --
-- 1. Production Category Distribution --
select
production_Categroy,
count(*) as Total_Records
from agriculture_data
group by Production_Categroy
order by Total_records desc;

-- 2. Production Category wise total Production --
select
production_categroy,
sum(production) as Total_production
from agriculture_data
group by Production_Categroy
order by Total_production desc;

-- 3. Production Category Wise Average Yield --
select
Production_categroy,
round(avg(yield),2) as Avg_Yield
from agriculture_data
group by Production_Categroy
order by Avg_Yield desc;

-- 4. State wise Average Yield --
select
state,
round(avg(yield),2) as Avg_Yield
from agriculture_data
group by state
order by Avg_Yield desc;

-- 5. district Wise Total production --
select
district,
sum(production) as Total_production
from Agriculture_Data
group by District
order by Total_production desc
limit 10;

-- 6. Top 10 District Wise Average Yield --
select
district,
round(avg(yield),2) as Avg_Yield
from Agriculture_data
group by district
order by Avg_Yield desc
limit 10;

-- 7. State wise total cultivated Area --
select
state,
round(sum(area),2) as Total_Area
from agriculture_data
group by state
order by Total_Area desc;

-- 8. Crop wise Total cultivated Area --
select
crop,
Round(sum(area),2) as Total_Area
from Agriculture_data
group by crop
order by Total_Area desc
limit 10;

-- 9. Crop Wise Average Yield --
select
crop,
round(avg(yield),2) as Total_Yield
from Agriculture_data
group by crop
order by total_yield desc
limit 10;

-- 10. Crop with Hightest total production --
select
crop,
sum(production) as Total_production
from Agriculture_data
group by crop
order by total_production desc
limit 1;

-- Phase 2 Multiple-Dimensional Analysis + window Function --
-- 11. State + Crop perfomace with Window Function --

with state_crop as (
select
State,Crop,
sum(production) as 
Total_production
from Agriculture_data
group by State, Crop ),
Ranked as (
select
State,Crop,Total_production,
rank() over (
partition by State
order by Total_production desc ) as Rank_no
from State_crop )
select
state, Crop, Total_production
from Ranked
where rank_no =1;

-- 12. State+Season Performance with Window Function --
With State_season as (
select
State,Season,
Sum(production) as total_production
from Agriculture_data
group by State,Season ),
ranked as (
select
State, Season, Total_production,
rank() over (
partition by State
order by total_production desc ) as rank_no
from State_season )
select
State, Season, total_production 
from ranked
where rank_no =1;

-- 13. Top 3 Crop in Each State --
With State_crop as (
select
State, Crop,
sum(production) as Total_production
from Agriculture_data
group by State, Crop ),
ranked as (
select 
State, Crop, Total_production,
rank() over (
partition by State
order by Total_production desc ) as Rank_no
from State_crop )
Select
State, Crop, Total_production
from Ranked
where rank_no <=3;

-- 14. Top 3 District in Each State --
With State_district as (
select
State, District,
sum(Production) as Total_production
from Agriculture_data
group by State, District ),
ranked as (
select State, District, total_production,
rank() over(
partition by State
order by total_production desc) as rank_no
from state_district )
select
State, District, Total_production
from ranked
where rank_no <=3;

-- 15. Best Crop + Season Combination --
select
Crop, Season,
sum(production) as total_production
from Agriculture_data
group by Crop, Season
order by Total_production desc
limit 1;

-- 16. Average Yield by State + Season --

select
State, Season,
Round(avg (yield),2) as Average_Yield
from Agriculture_data
group by State, Season;

-- 17. Production by State + Production Category --
select
State, Production_Categroy,
sum(production) as Total_Production
from Agriculture_data
group by State, Production_Categroy;

-- 18. Highest Average yield Crop in Each State --
-- CTE 1 --
With State_Crop as (
select
State, Crop,
Round(avg(Yield),2) as Average_Yield
from Agriculture_data
group by State, Crop ),
-- CTE 2 --
ranked as (
select
State, Crop, Average_Yield,
Rank() over (
partition by State
order by Average_Yield desc ) as Rank_no
from State_Crop )
-- CTE 1 + CTE 2 --
select
State, Crop, Average_Yield
from Ranked
where rank_no = 1;

-- 19. Lowest Average Yield Crop in Each State --
-- CTE 1 --
with State_Crop as (
select
State, Crop,
round(avg (Yield),2) as Average_Yield
from Agriculture_data
group by State, Crop ),
-- CTE 2 --
ranked as (
select
State, Crop, Average_Yield,
rank() over (
partition by State
order by Average_Yield asc ) as Rank_no
from State_Crop )
-- CTE 1 + CTE 2 --
select
State, Crop, Average_Yield
from ranked 
where rank_no =1;

-- 20. State + Crop + season Performance --
-- CTE 1 --
With State_Crop_Season as (
select
State, Crop, Season,
sum(production) as Total_Production
from Agriculture_data
group by State, Crop, Season),
-- CTE 2 --
ranked as (
select
State, Crop, Season, Total_Production,
rank() over (
partition by State
order by Total_Production desc ) as Rank_no
from State_Crop_Season )
select
State, Crop, Season, Total_Production
from Ranked
where rank_no =1;

-- Phase 3 Analytical Decision-Making --
-- 21. Crop Production Growth Analysis --
with Production_data as(
select
Crop,
Crop_Year,
sum(production) as Total_Production,
lag(sum(production))over (
partition by crop
order by Crop_year ) as Previous_Year_Production
from Agriculture_data
group by Crop, Crop_Year )
select
crop, Crop_Year, Total_Production, Previous_Year_Production,
((Total_production-Previous_Year_Production)/Previous_Year_production)*100 as YOY_Growth_Percentage
from Production_Data
order by Crop, Crop_Year;

-- 22. Production Stability Analysis --
With Production_data as (
select Crop, Crop_Year,
sum(production) as Total_Production,
lag(sum(production)) over(
partition by Crop order by Crop_Year ) as Previous_Year_Production
from Agriculture_data
group by Crop, Crop_Year),
Production_Status as (
select crop, Crop_Year,
case when Previous_Year_Production
Is null then 'No Previous Year'
when Total_Production >
Previous_Year_Production then 'Increased'
when Total_Production <
Previous_Year_Production then 'Decreased'
else 'No Change' end as Production_Status
from production_data )
select Crop,
Sum(case when Production_Status = 'Increased' then 1 else 0 end ) as Increased_Years,
sum(case when Production_Status = 'Decreased' then 1 else 0 end) as Decreased_Years,
sum(Case when Production_Status = 'No Change' then 1 else 0 end) as No_Change_Year
from Production_Status group by Crop order by Crop;

-- 23. Crop Production volatility Analysis --
with Crop_Yearly_Production as (
select
crop, Crop_Year,
sum(production) as Total_Production
from Agriculture_data
group by Crop, Crop_Year )
select
Crop,
Round(avg(Total_Production),2) as Average_Production,
round(stddev_pop(Total_Production),2) as Production_Std_dev,
round( Stddev_pop(Total_production)/nullif(Avg(Total_Production),0)*100, 2) as CV_Percentage
from Crop_Yearly_Production
group by Crop
Having stddev_pop(Total_Production)/nullif(avg(total_production),0)*100>50
order by CV_Percentage desc;

-- 24. State + Crop Production --
With State_Crop_Production as (
select
State, Crop,
sum(production) as Total_Production
from Agriculture_data
group by State, Crop ),
state_Crop_Share as (
select
State, Crop, Total_Production,
sum(Total_Production) over(
partition by State ) as State_Total_Production
from State_Crop_Production ),
ranked_Crops as (
select
State, Crop, Total_Production, State_total_production,
round(total_production/nullif(State_Total_Production,0)*100,2 ) as Production_Contribution_Percentage,
Row_number() over(
partition by State order by Total_production desc ) as rn 
from State_Crop_Share )
Select 
State, Crop, Total_Production, State_total_production, Production_contribution_Percentage
from ranked_crops where rn =1 order by State;

-- 25. Production Growth vs Yield Performance --
with Crop_Year_Performance as (
select
Crop, Crop_Year,
sum(production) as Total_Production,
Avg(yield) as Average_Yield
from Agriculture_data
group by Crop, Crop_Year ),
Previous_Performance as (
select
Crop, Crop_Year, Total_Production, Average_Yield,
lag(total_Production) over(
partition by crop
order by crop_Year ) as Previous_production,
lag(Average_Yield) over(
partition by Crop
order by crop_year ) as Previous_Yield
from Crop_year_performance ),
final_performance as(
select
Crop, Crop_year, total_production, Average_yield, Previous_production, Previous_yield,
case
when previous_production is null
then 'no previous year'
when total_production >Previous_production and Average_yield >Previous_yield
then 'Production up & Yield up'
when total_production >Previous_production and Average_yield <Previous_yield
then 'Production up & Yield down'
when total_production<Previous_production and Average_yield >Previous_yield
then 'Production down & Yield up'
when total_production <Previous_production and Average_yield <Previous_yield
then 'Production down & Yield down'
else 'no change' end as Performance_Status
from Previous_performance )
select* from Final_performance
where performance_Status = 'production up & Yield down' order by crop, crop_year;

-- 26. State Wise Production Consistency Analysis --
select
State,
Round(avg(production),2) as Avg_Production,
round(stddev(production),2) as Production_Stddev
from Agriculture_data
group by State
having production_stddev >10000
order by production_stddev;

-- 27. State Wise Production Risk/Variability Analysis --
with State_Stats as (
select
State,
round(avg(production),2) as AVG_Production,
round(stddev(Production),2) as PRoduction_Stddev
from Agriculture_data
group by State ),
State_CV as(
select
State,
Round(AVG_production,2) as AVG_Production,
Round(production_Stddev,2) as Production_Stddev,
Round((production_Stddev/nullif(Avg_production,0))*100,2 ) as CV_Percentage
From State_Stats )
select
State, Avg_Production, Production_Stddev, CV_Percentage
from State_CV Where CV_Percentage >100
order by CV_percentage desc;

-- 28. Crop Production Share Shift Analysis --
with year_crop as (
select
Crop, Crop_year,
sum(production) as Crop_production
from Agriculture_data
group by Crop, Crop_year ),
year_total as (
select
Crop_year,
sum(Crop_production) as total_production
from year_crop 
group by crop_year ),
crop_share as (
select
yc.crop, yc.crop_year, yc.crop_production, yt.total_production,
round((yc.crop_production/nullif(yt.total_production,0))*100,6 ) as Production_share
from year_crop yc
join year_total yt
on yc.crop_year = yt.crop_year ),
share_change as (
select
crop, crop_year,production_share,
round(production_share-lag (production_share) over 
(partition by crop
order by crop_year ),2 ) as share_change
from Crop_share )
select
crop, crop_year, Production_share, share_change
from share_change
order by crop, Crop_year;

-- 29. Crop Dominance Across States --
with State_crop as (
select
State,
Crop,
Sum(production) as Total_Production
from Agriculture_data
group by State, Crop ),
ranked_Crop as(
select
State, Crop, Total_Production,
rank() over (
partition by State
order by total_production desc ) as Crop_rank
from State_crop )
select
Crop, Count(*) as Dominant_State_Count
from ranked_Crop
where crop_rank =1 group by Crop 
having Dominant_State_Count >=3 order by Dominant_State_Count desc;

-- Final Query --
-- 30. State - Year Production Anomaly Detection --
with State_year as (
select
State, Crop_year,
Sum(production) as Total_production
from Agriculture_data
group by State, Crop_year ),
State_Stats as (
select
State,
Avg(total_production) as AVG_production,
STDDEV(total_production) as Stddev_production
from State_year group by State ),
Classified_data as(
Select
sy.State, sy.Crop_year, sy.total_production,
round(ss.avg_production, 2) as AVG_production,
round(stddev_production, 2) as Stddev_production,
case
when sy.total_production > ss.AVG_production + ss.Stddev_production
then 'High Anomaly'
when sy.total_production < ss.AVG_production - ss.Stddev_production
then 'Low Anomaly' else 'normal'
end as production_Status
from State_year sy join State_Stats ss
on sy.State = ss.State order by sy.State, sy.Crop_year )
select* from Classified_Data
where production_Status in ('High Anomaly','low anamoly') order by State, Crop_year;