Matt Kirkman
8 April 2024

Creating a Scouting Report for West Brom vs Manchester United

In 2016, West Bromwich Albion's was set to play Manchester United on March 6th. I undertook the task of creating a comprehensive 
scouting report for that match in matchweek 28 of the English Premier League. Leveraging modern data analytics techniques, I aimed 
to gather insights that could provide a competitive edge for our team.

The first step in this process was acquiring relevant match data. Utilizing data packages from StatsBomb, I imported the necessary 
data into RStudio. Much of the work involved in data cleaning and organization was executed manually. With the moderate coding skill 
gaps that I had, I utilized StatsBomb R tutorials and ChatGPT. All in all, the cleaning and organization entailed parsing through 
raw data, removing inconsistencies, and structuring it into a format conducive to analysis.

Once the data was cleaned and organized, it was essential to identify key variables that could inform our scouting report. Given 
the dynamic nature of football, a multitude of variables could influence match outcomes. Therefore, careful consideration was given 
to selecting metrics that encapsulated both offensive and defensive aspects of play. Metrics such as shots, goals, passes, fouls, 
and duels won were prioritized for their significance in evaluating team performance.

With the data curated and key variables identified, the next step was to conduct preliminary analyses. This involved comparing Manchester 
United's performance metrics against those of their opponents to discern patterns and tendencies. By exporting the data to Excel, I 
performed additional cleaning and sorting to create separate datasets for Manchester United and their opponents when facing Manchester 
United. This way, the scouting report was able to decipher if Manchester’s success was a result of their play or the opponents.

Once the datasets were prepared, they were imported into Minitab, a statistical analysis software, for deeper analysis. The primary 
objective was to identify statistically significant differences between Manchester United's performance in matches they won or tied 
versus matches they lost. P-values for the means of various performance metrics were calculated for both conditions, providing 
insights into which metrics were most indicative of success.

Following the initial analysis, variables with low p-values were further scrutinized to ascertain their impact on match outcomes. A 
sigmoid curve was created for each of those variables to determine the threshold at which a given metric increased the odds of winning. 
This approach enabled the report to identify actionable insights that could potentially tilt the odds in our favor.

Key takeaways and conclusions were found from the analysis and put into the final scouting report. Insights regarding Manchester United's 
strengths and weaknesses were outlined. By leveraging data-driven decision-making, this scouting report aimed to capitalize on Manchester 
United's vulnerabilities while maximizing West Brom’s strengths on the pitch.

The process of creating a scouting report for the West Brom vs Manchester United match in 2016 was a meticulous and data-intensive endeavor. 
The collaboration with StatsBomb, R, ChatGPT, Excel, and Minitab led to a comprehensive report that highlights potential exploitations of 
Manchester United. Although this report does not unlock the winning recipe to winning every soccer match or the entire league, it shows 
the value of matchup analysis, as much of a given match is dictated by the knowledge of the opponent.
