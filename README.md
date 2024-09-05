# Iowa-liquor-sales-review

## Objective
Analyze liquor sales in Iowa over the last three years to identify key regions and time periods generating the highest revenue, and provide actionable insights for optimizing marketing strategies and resource allocation.

[Link to dataset](https://data.iowa.gov/Sales-Distribution/Iowa-Liquor-Sales/m3tr-qhgy/data)

## Tools Used
- **SQL (pgAdmin)**: To query and narrow down the dataset from approximately 26 million rows to a more manageable size.
- **Python (pandas, matplotlib, seaborn)**: For data cleaning, analysis, and visualization.

## Approach
1. **Data Preparation**:
   - Used **SQL** to filter and aggregate the dataset, reducing it to a focused subset.
   - Imported the refined data into **Python**, where it was further cleaned, with inconsistencies corrected and relevant columns converted to appropriate data types.

2. **Revenue & Volume Analysis**:
   - Leveraged **Python** to identify Polk, Linn, and Scott counties as the top revenue generators.
   - Used **Python** to analyze the top cities within these counties and calculate order volumes.

3. **Seasonal & Temporal Analysis**:
   - In **Python**, categorized sales data by season and analyzed sales distribution across days of the week and months.
   - Calculated key financial metrics, including gross margin and profit ratios, across cities and counties.

## Insights
1. **Top Revenue Regions**:
   - Polk County, led by Des Moines, had the highest revenue and order volume, followed by Linn and Scott counties.

2. **Seasonal Trends**:
   - Winter sales were lower, while December and summer months showed peak sales, driven by holidays and warm weather.

3. **Sales Patterns**:
   - Sales peaked on Mondays and Wednesdays, with weekends showing fewer orders.

## Recommendations
- Focus marketing in Polk County.
- Target promotions during winter and strengthen campaigns in December and summer.
- Adjust inventory and staffing during peak periods to meet demand.
