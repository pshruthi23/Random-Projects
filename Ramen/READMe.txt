I've been wanting to improve my Python skills for a long, long time. I finally got started! 
The source of this dataset is Kaggle, which provided only the Review number, Brand, Product Name, Packaging Style, Country, and the rating the blogger gave the ramen product. 
To make it more challenging, I went to the website and scraped the review pages to see whether the product is vegetarian. I think I managed to do it, but I will definitely have a eureka moment later!
Overall, this mini-project felt quite rewarding. 
I used AI as a buddy while writing most of the code myself (I used Claude AI)

Method:
I first imported the original dataset from Kaggle and renamed the 'Review#' column to 'Review' as I was worried that any code after the '#' would comment out (Google assured me that it would not happen, but I changed it anyways)
I used a function for the web scraping. This is the heart and soul of the code, and I wrote most of it with help from the YouTube tutorial. I started from the search pages. Using the review numbers in the URL, I was able to find most of the reviews. Obviously, there were some variations in how the search results appear, which I handled in the atag for loop. 
I found some reviews on page 2 of the search results. I then added the while loop for the page numbers (Thanks to Claude, who helped figure out the tweaks I needed to do)
In the search pages, I searched for the bookmark anchor tags (<a>) and then ran the atag for loop. This loop looks for the review number in its description. I found this effective because some review numbers returned search results that did not exactly point me to that particular review. For example, if I am looking at #151, in my search results, I got #5151, which is obviously not the review I am looking for. 
My logic for finding out whether the food product is vegetarian or not is to do a string search. Once I get to the review page, I extract the paragraph tags (<p>), and search for the words 'vegan', 'vegetarian', or 'meat free' (one review uses the term 'meat free'). 
Based on the return value in the loop, I finally insert that value into my data frame into a new column called 'veg' (I am not very creative with names)
To further inspect the loop and make sure that nothing crashes, I print the output with the row number the function has already run on and the 'Veg/Non-Veg' status. I started running this because, a few times, the code completely skipped the if clause and went straight to the else clause. 

After the final dataset was ready (yaay!), I started on the fun part - the analysis. I was curious to see which countries the blogger ate ramen in and which they rated highest. Surprisingly, it was Brazil - although with just five products :/.

I was also super curious to see how the vegetarian products were rated against the non-vegetarian ones, and how many vegetarian products are actually available. 
Again, this caught me by surprise, as both were actually very close in number and had comparable ratings. (This taught me that I need to look more for ramen, and not just cry in the supermarket aisle because I cannot find vegetarian ramen) 
I know there is a whole science behind packaging, so I looked at the data from that aspect as well- which packaging has been rated the best and how many products came in each packaging type. I also included a cute pie chart as the visual :)
Apparently most Ramen come in packs (I knew this)
I also wanted to see which brand came on top for their ramen. I realized that 'Nissin', a Japanese brand, came out on top, for both vegetarian and non-vegetarian products, with around 320 products; however, the rating was around 3.9.
Makes sense because Ramen is a Japanese dish. 
I plotted a bar chart with that data. 
Finally, the thing that concerns me the most. Comparing ratings and the number of products, which is best for a vegetarian? I filtered out brands with only 1 product because I felt the data would be slightly biased. There was an Indian company, Patanjali, with only 1 product and a 5-star rating. Nissin came out on top, but the rating was slightly lower - a 3.6 rating for 74 products. The next highest was Nongshim, with 33 products, but a slightly higher rating - 3.79.
This answers my question, try both!
 
Technical Details:
I used the following libraries: Pandas, Requests, Beautiful Soup (bs4), and Matplotlib. Usually, as a reflex, I import the Pandas and NumPy libraries together when writing Python code – I never know when I might need them.  
The web scraping took a good few hours to run, around 3 hours. This may be because of my computer's specifications. 

Credits:
Dataset: Kaggle by Aleksey Bilogur(https://www.kaggle.com/datasets/residentmario/ramen-ratings)
Beautiful Soup tutorial: Alex the Analyst (Link to the tutorial part 1/3: https://www.youtube.com/watch?v=bargNl2WeN4)
Web scraped source: https://www.theramenrater.com/
...and my best friend Claude AI
