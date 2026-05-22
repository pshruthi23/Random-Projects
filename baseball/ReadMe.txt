For my third project, I attempted something different. Kaggle seemed too 'classroom' for me with already cleaned datasets (I loved it! It was a great starting point). The only way to start something new is to just start it. So that's what I did. I wanted to do sports data, as that field is pretty data-heavy and messy. 

Method:
Data Extraction (file: Data_extraction_v2_2024): 
I found the git repository for the pybaseball and used the Statcast package. Initially, using FanGraphs gave me a 403 error. I started with the 2023 data. I got the dates for the 2023 season from Claude. It was a decent-sized dataset with ~700,000 rows and ~120 columns.

The first thing I noticed was that the player names were missing, but there were columns for batter and pitcher with numbers. I realized it might have been batter and pitcher IDs. In the docs, I saw a playerid_reverse_lookup command that returns the batter and pitcher names. Getting that data and merging it with the main dataset made some sense to me. 
Finally, I downloaded the dataset as a CSV so that I can use it every time, rather than running the script. 

Exploring the data a bit with value_counts, I found many null values. Claude suggested using 2024 data instead, as columns like the bat_speed and swing_length are populated.
...So I did the whole process again for the 2024 data. Now I have two datasets, 2023 season data and 2024 season data!

Data Analysis:
 
I started by importing the cleaned 2024 season dataset. Here's a summary of each analysis:
Player Strength — Barrels
I mapped the launch_speed_angle values to their Statcast descriptions and identified "Barrels" as the strongest contact type. In the 2024 season, Shohei Ohtani led with 112 Barrels. The second strongest contact type, Flares, was led by Luis Arraez with 210.
Pitcher Pitch Preferences
I looked at which pitchers threw each pitch type most frequently. For example, Carlos Rodón threw the most 4-seam fastballs, Garrett Stubbs threw the most Eephuses, Brent Honeywell threw the most screwballs, and Tanner Houck threw the most Sweepers.
Batter & Pitcher Handedness
Most batters preferred the right side of the plate, and right-handed pitchers were more common as well.
Batter vs. Pitcher Matchup Events
I analyzed the events that occur across all batter-pitcher handedness combinations (e.g., right-handed pitcher vs. left-handed batter). Field-outs were the most common outcome across all combinations — which didn't feel particularly insightful. I then filtered to a few key events — home runs, strikeouts, singles, doubles, and triples — and normalized the data to remove bias. Strikeouts had the highest occurrence rate overall, with the L-L combination (left-handed pitcher vs. left-handed batter) producing the most strikeouts.
Contact Type & Field Zone
I went on a small tangent here — I learned that the field is divided into zones and wanted to find a pattern between contact type and landing zone. After normalizing the data, I found that Barrels, Flares, Solid Contact, and Under Shots tended to land in zone 5, Topped Shots in zone 8, and Weak Shots in zone 11. That surprised me — I expected the opposite!
Individual & Team Leaders
Aaron Judge hit the most home runs, Tarik Skubal pitched the most strikeouts, and the New York Yankees led the league in Barrels as a team.
Release Speed vs. Event Outcome
I bucketed release speeds into 10 mph ranges and normalized the data. Except for pitches over 100 mph — where strikeouts were most common — field-outs dominated every other bucket. Excluding field-outs, singles occurred most frequently at lower speeds (30–70 mph), while strikeouts dominated at higher speeds (70–100+ mph).
wOBA Analysis
I filtered to records where woba_denom = 1 to ensure complete data. Eephuses had the highest mean wOBA score by pitch type, and zone 5 had the highest mean wOBA by landing zone. This connects back to the earlier finding — Barrels and Flares, the most powerful contact types, also tend to land in zone 5. High-power contact may be the underlying driver of high wOBA scores.

Next up: Exploring the possibility of implementing an ML model. The data is sufficient for training and testing…

Visualization:
Exploring the possibility of having a Streamlit dashboard to present the analysis and ML model results

Technical Details:
Lots of Python! (data extraction from the pybaseball package, data merging on the player IDs)

Credits:
Dataset: pybaseball Python package 
Documentation: https://github.com/jldbc/pybaseball
	         https://baseballsavant.mlb.com/csv-docs  
...and my best friend Claude AI
