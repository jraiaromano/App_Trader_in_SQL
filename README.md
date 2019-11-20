# App_Trader_in_SQL
## Overview
This is the repo for a team project in SQL to analyze data on the App and Play store apps and provide purchase recommendations as well as future purchase guildlines for a fictional company (App Trader) in a brief presentation.
## Project Takeaways
This was a really great dataset to work with while learning to clean data in Postgres SQL. Mostly it was numerical data categorized as text that had to be dealt with, with a little VarChar thrown in for taste. A pretty tricky join got me worked up for a while but I think I came up with a satisfactory solution. 
![title slide](https://user-images.githubusercontent.com/52726447/69202570-ae968c80-0b07-11ea-8235-9f80c0f3f428.png)
You can see the entire presentation [here](https://docs.google.com/presentation/d/10m9EMR5GmpJo3i1XpZSK9fqdQdf18LxYG6TcYbMmouU/edit?usp=sharing).

## The Pitch
You have been hired by a new company called App Trader to help them explore and gain insights from apps that are made available through the Apple App Store and Android Play Store. App Trader will serve as a broker buying apps from developers then deploying and marketing them.

Based on research done before launching App Trader as a company, you can assume the following:

  - App Trader will purchase apps for 10,000 times the price of the app. For apps that are priced from free up to $1.00, the purchase price is $10,000
 - Apps earn $5000 per month on average from in-app advertising and in-app purchases regardless of the price of the app
 - App Trader will spend an average of $1000 per month to market an app regardless of the price of the app
 - For every half point that an app gains in rating, its projected lifespan increases by one year, in other words, an app with a rating of 0 can be expected to be in use for 1 year, an app with a rating of 1.0 can be expected to last 3 years, and an app with a rating of 4.0 can be expected to last 9 years. Ratings should be rounded to the nearest 0.5 to evaluated its likely longevity.
 - App Trader would prefer to work with apps that are available in both the App Store and the Play Store.

Deliverables:

 - Develop some general recommendations as to price range, genre, content_rating for apps that the company should target.
 - Develop a Top 10 List of the apps that App Trader should buy next week for its Black Friday debut.

Prepare a 5-10 minute presentation for the leadership team of App Trader.
## The Data
This was not a massive database but it was quirky in it's own little way. There were some issues with null fields in the Play Store; it appears that the Play store has no way to deal with apps with a zero rating so tha rating appears null. 
Further, several fields containing numbers were categorized as text. This obviously presented difficulties so there was a great deal of casting and trimming to successfully query within those columns. 
## My Approach to the Problem
My team determined that, based on the assumptions for the project, the apps with the most value to App Trader were apps that cost no more than $10k to acquire and last as long as possible. Further, we were able to determine that (within certain diminishing returns parameters) cross-platform apps (CPAs) were indeed preferable to single-platform apps (SPAs).
![DR on cross-platform apps](https://user-images.githubusercontent.com/52726447/69201677-b99bed80-0b04-11ea-8e11-16fc830473ab.png)
At the end of the day, our presentation included the requisite 10 apps as well as an appendix showing off our tables for SPAs. 


Team (the FitBits)

[Doug](https://github.com/Djtvdoug)

[Peter](https://github.com/PBusienei)

[Terry](https://github.com/Terrymain2019)

