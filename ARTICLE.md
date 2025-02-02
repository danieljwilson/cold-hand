## Introduction
As a fan of both basketball and psychology I have often come across references to the 1985 paper "The hot hand in basketball: On the misperception of random sequences". Written by Thomas Gilovich, Robert Vallone and Amos Teversky, their goal was to test the common belief that shooting tends to be "streaky" -- that is to say that players should be more likely to hit a shot if they had made their previous shot, and vice versa.<sup>1</sup>

Many aspects of the NBA have developed in the past 36 years (which happens to be the same age as Lebron James) in terms of strategy, diet, an influx of foreign talent and social media. That said, overall shooting percentages have remained remarkably consistent.

<div id="vis0"><div class="flourish-embed flourish-chart" data-src="visualisation/5894229"><script src="https://public.flourish.studio/resources/embed.js"></script></div></div>

I was curious if a look at a more modern NBA season (2015-16) and looking at all players on all teams (instead of just 9 players on the Philadelphia 76ers, as in the original paper) would replicate the original finding.

The data from the original paper are suggestive of a **downward** trend in shooting percentage the more shots you have previously hit. In other words, the **hotter** your hand, the more likely you are to miss, as you can see below (choose "All Players" to get the team average).

<div id="vis1"><div class="flourish-embed flourish-chart" data-src="visualisation/5894910"><script src="https://public.flourish.studio/resources/embed.js"></script></div></div>

## Results
As someone who has played and watched a lot of basketball I have to admit I found our main finding surprising, even if it did simply confirm the original paper. Since the original paper did not find a statistically significant trend (due to having small sample size), it was possible that their results were a fluke. Something that just happened that season with that particular team. However our data showed a very similar pattern to the 1985 paper. If a player had made their previous shot attempt they were **less** likely to make their subsequent attempt. This was exacerbated the longer their streak was, prior to their current shot. You can see the overall percentages for all players in the plot below.

<div id="vis2"><div class="flourish-embed flourish-chart" data-src="visualisation/6096181"><script src="https://public.flourish.studio/resources/embed.js"></script></div></div>

A couple of things worth pointing out:
1. The data gets noisier as we increase the length of the streak preceeding a given shot. This is to be expected as while a 1 or 2 shot streak woud be very common, a 5 shot streak is much rarer. So there is less data to examine.
2. If you look closely you can see that there is a systemic difference between the make and miss sequences (though this easier to view in the dot plot below)

<div id="vis3"><div class="flourish-embed flourish-scatter" data-src="visualisation/6161021"><script src="https://public.flourish.studio/resources/embed.js"></script></div></div>

Noise based on number of shots (see Figure 3)


However, whereas the original paper did not find a significant effect with a sample size of 9 players, using data from all teams allowed for a much more highly powered dataset of 165 players.


## TO DO
- Weight by shots
    - now all players receive equal weights
- Subtract make from miss
    - Look at distribution
    - Look at players in the tails
- How to compare the two?
    - T-Test?
- Thinking about variance?
- Compare with other metrics? PER?



## Discussion
Become overconfident and take worse shots.
A lot of noise. 
There may be multiple reactions to missing a shot depending on the individual. Maybe some people get down on themselves and it shakes their confidence. Maybe some people decide to only take a shot if it is a "good" shot with a high percentage chance of going in. 

Miss a couple lose confidence and only take easy shots...
Heat check shot.


In my data from 2015 increasing the *n* from 9 to 200...

More to come...

Add data table?




---

However, Stanford students are not representative of the average college student. Our analysis of debt data helps contextualize what Biden’s loan forgiveness plan would mean for undergraduate students across the country.
 
## The current student debt picture

### How much student debt do undergraduates have?
 
In 2016, around two-thirds of Bachelor’s degree recipients took out federal loans, graduating with an average cumulative debt of $29,210 owed to the federal government. The vast majority of students with greater loan obligations attended for-profit universities.

A $10,000 loan forgiveness program would eliminate an additional 11% of college graduates’ debt entirely and make a significant impact on most students’ loans. A loan forgiveness plan for $50,000 would eliminate debt for nearly all Bachelor’s degree recipients.

### How often do Americans default on student loans?

While the prospect of student debt may be a stressful experience for college graduates, debt is not inherently bad. In the U.S., college remains one of the best ways to increase future earnings; according to the Bureau of Labor Statistics, in 2019, the median weekly earnings among workers with a bachelor’s degree was $1,248, compared to $746 for those with just a high school diploma.<sup>3</sup> Over the course of a lifetime, this can mean an additional $1 million of earnings. Taking out some loans to achieve greater future financial stability is a system that can work when students are able to pay off their investment. As a result, a more illuminating statistic may be the default rates for college graduate cohorts, calculated as the percentage of students who fail to make payments for nine months in the first three years of loan repayment. 





Default rates hovered around 5% throughout the 2000s, jumped up during the Great Recession, and have slowly declined since. The most recent cohort of graduates, from 2017, had a 9.7% default rate, still above pre-recession levels. A one-time loan forgiveness program may help default rates return to pre-recession levels. Notably, this statistic focuses on loan repayment immediately after graduating college but does not account for those who spend decades struggling to make minimums on student loans or may default later in their careers. Thus, while a debt forgiveness program may benefit those who have defaulted on their loans the most, it would lift a significant burden for all debt holders.

### College cost and student debt repayment across different colleges and income groups

Although these aggregate metrics tell part of the story, students at different institutions face different debt scenarios. While students at Stanford may not need a $10,000 loan forgiveness program to eliminate their student debt, students across the country all face different employment situations after graduation. Some schools give more generous aid to low-income students; others tend to place students in higher-paying jobs after graduation. The below visualization though, which plots the seven-year student loan repayment rate against the average net price of the university (sticker price minus scholarships) for different income ranges shows a consistent trend: low-income students find it more difficult to pay off their debt, despite tending to pay a lower net price for college.




## Would cancelling student debt help eliminate the wealth gap?

Biden’s student loan forgiveness plan is not only an investment in education, but it has also become a fight about racial justice. Many see cancelling student debt as the first step to eliminate wealth gaps between Black and white Americans. 

### Racial inequities in amount of student loan debt

Data on student loan debt gathered since 2000 indicate that Black students consistently take out the largest federal student loans. In 2015-16, for example, data from the Department of Education’s Digest of Education Statistics show that Black students took out an average of $32,370 in loans, far more than any other racial or ethnic group. Black students also have the fastest growing average federal student loan debt, taking out an additional $848 every year in federal student loans (for comparison: White: $632 , Hispanic: $566, Asian: $547).


<div id="vis4"><div class="flourish-embed flourish-chart" data-src="visualisation/5821145"><script src="https://public.flourish.studio/resources/embed.js"></script></div></div>


A debt forgiveness plan would benefit Black students the most, followed by White and Hispanic individuals, and finally Asian students, who consistently take out the smallest amounts in federal loans. However, the average student loan debt for all racial groups exceeds $10,000 dollars, so Biden’s policy would not completely eliminate debt for the majority of students with federal loans. Even if this policy had been implemented in 2000, it would not have completely cancelled debt for any of the groups shown here.

Besides this inequity in the amounts of federal loans by race, the amounts of federal loans taken out over time are increasing for all racial groups. As college students become more reliant on the federal government to pay for their education, taking out larger and larger amounts of money, the student debt crisis continues to accelerate. Even if all of these groups were granted $10,000 relief in federal student loan debt, future students would likely still need to take out these amounts in federal loans without broader education reform.

In addition to considering racial disparities in federal student loan amounts, it is important to understand how family incomes contribute to which students hold student loan debt. The below chart, based on data from the U.S. Department of Education, displays the proportion of college students in 2008 who owed some amount of college debt disaggregated by income and by race/ethnicity. 


<div id="vis5"><div class="flourish-embed flourish-chart" data-src="visualisation/5820737"><script src="https://public.flourish.studio/resources/embed.js"></script></div></div>


At all income levels, Black students are the most likely to owe some college debt. For both Black and White students, the proportion of students owing some college debt decreases as income increases. Asian students tend to have the lowest chance of having student debt, but the decreasing trend with income is much less consistent. These data show that, for Black and White students, Biden’s $10,000 would likely most benefit students from poorer families, while for Asian students, it would most benefit students from families making $30,000-$59,999 per year, and for Hispanic/Latino students, it would have a fairly even effect across income levels.

### Debt repayment across racial groups

Inequality in the amount of student loans taken out by race is evident. However, it is also important to consider how different racial/ethnic groups tend to pay off their debts over time, and which racial/ethnic groups tend to default most on their loans, to determine who would most benefit from Biden’s plan.


<div id="vis6"><div class="flourish-embed flourish-table" data-src="visualisation/5820751"><script src="https://public.flourish.studio/resources/embed.js"></script></div></div>


Black students not only take out the largest amounts in overall student loans but also struggle the most with repayment -- they are the only racial/ethnic group whose mean amount owed after four years exceeds the mean amount borrowed. Asian students pay off the largest percentage of their debt in 4 years (19.4%), followed by White students (10.7%), then Hispanic/Latino students (6.9%). Black students see their student loan debt grow by 5.8%. Furthermore, Black students had the highest default rate (7.6%), followed by Hispanic students (5.7%), White students (2.4%), and Asian students (1.2%). Overall, federal debt relief would most benefit Black and Hispanic students, who tend to have the lowest rates of repayment and default most on their loans. 

That Black students, on average, are moving backwards when it comes to paying off their student loan debt is an indication that the college, which is often portrayed as a ticket out of poverty, is not working for Black students. Even after debt cancellation, the disproportionate difficulty Black students face financing their college education would likely not reverse.

## Student Loan Forgiveness in Perspective

A proposal to cancel student debt up to $50,000 would cost $1 trillion<sup>4</sup>, more than doubling the current $905 billion spent on education by federal, state, and local governments.<sup>5</sup> Even a more scaled back cancellation of $10,000 would cost $373 billion, comparable to the amount of money spent by the federal government on all safety net programs in 2019, including low-income housing assistance, Earned Income Tax Credit, and SNAP.

Debt forgiveness would give immediate relief to millions of students, significantly reducing the debt burden for the 70% of students who take out federal loans to finance college. At the same time, it would do little to address the institutional barriers in college access. College costs continue to rise, and financing a college education continues to be more difficult for Black students and students from less wealthy families. Even more students choose not to enroll in college at all due to inaccessible costs. Questions of college affordability, debt repayment, and racial wealth gaps are complex, and regardless of whether Biden pursues a loan forgiveness program of $10,000 or $50,000, broader reforms are necessary to make education equitable and accessible for all Americans.



---

**Cited Sources**

[1] Gilovich, T., Vallone, R., & Tversky, A. (1985). The hot hand in basketball: On the misperception of random sequences. Cognitive psychology, 17(3), 295-314.

[2] 

**Data Sources, by visualization (cleaned data sources are all accessible in [GitHub data folder](https://github.com/apandit42/datathon2021/tree/main/data) )**

(1) U.S. Department of Education, Digest of Education Statistics, Table Table 330.10

(2) U.S. Department of Education, National Center for Education Statistics, 2007–08 National Postsecondary Student Aid Studies

(3) U.S. Department of Education annual official cohort default rates

(4) U.S. Department of Education College Scorecard data

(5) U.S. Department of Education, Digest of Education Statistics, Table Table 331.95

(6) U.S. Department of Education, National Center for Education Statistics, 2007–08 National Postsecondary Student Aid Studies

(7) Brookings Institution, (2016). https://www.brookings.edu/research/black-white-disparity-in-student-loan-debt-more-than-triples-after-graduation/

**Methodological notes**

Institutional-level data was only included for Bachelor’s degree-granting universities with at least 200 enrolled undergraduates. A minimum of 30 responses are necessary for a data point to exist; colleges without sufficient data were excluded. The average was calculated by averaging across the 2061 institutions included in the dataset.
