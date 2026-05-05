For my third project, I attempted something different. Kaggle seemed too 'classroom' for me with already cleaned datasets (I loved it! It was a great starting point). The only way to start something new is to just start it. So that's what I did. I wanted to do sports data, as that field is pretty data-heavy and messy. 

Method:
Data Extraction (file: Data_extraction_v2_2024): 
I found the git repository for the pybaseball and used the Statcast package. Initially, using FanGraphs gave me a 403 error. I started with the 2023 data. I got the dates for the 2023 season from Claude. It was a decent-sized dataset with ~700,000 rows and ~120 columns.

The first thing I noticed was that the player names were missing, but there were columns for batter and pitcher with numbers. I realized it might have been batter and pitcher IDs. In the docs, I saw a playerid_reverse_lookup command that returns the batter and pitcher names. Getting that data and merging it with the main dataset made some sense to me. 
Finally, I downloaded the dataset as a CSV so that I can use it every time, rather than running the script. 

Exploring the data a bit with value_counts, I found many null values. Claude suggested using 2024 data instead, as columns like the bat_speed and swing_length are populated.
...So I did the whole process again for the 2024 data. Now I have two datasets, 2023 season data and 2024 season data!

Data Analysis:
Answering questions related to the team statistics, player statistics, and different events. Exploring the possibility of implementing an ML model. The data is sufficient for training and testing…

Visualization:
Exploring the possibility of having a Streamlit dashboard to present the analysis and ML model results

Technical Details:
Lots of Python! (data extraction from the pybaseball package, data merging on the player IDs)

Credits:
Dataset: pybaseball Python package 
Documentation: https://github.com/jldbc/pybaseball
...and my best friend Claude AI

 
