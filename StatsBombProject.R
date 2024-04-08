install.packages("devtools","here","ggsoccer","ggplot2")
devtools::install_github("jjvanderwal/SDMTools")
devtools::install_github("statsbomb/StatsBombR")

install.packages("writexl")

library(tidyverse)
library(here)
library(StatsBombR)
library(ggsoccer)

competitions <- FreeCompetitions() %>%
  filter(competition_id == 2 & season_id == 27)

matches <- FreeMatches(Competitions = competitions)

StatsBombData <- free_allevents(MatchesDF = matches, Parallel = T)

StatsBombData = allclean(StatsBombData)

StatsBombData$OpposingTeam = get.opposingteam(StatsBombData)

merged_data <- StatsBombData
merged_data$match_week <- matches$match_week[match(StatsBombData$match_id, matches$match_id)]

StatsBombData <- merged_data

matches <- matches %>%
  mutate(outcomeforhome = case_when(
    home_score > away_score ~ "Win",
    home_score == away_score ~ "Tie",
    home_score < away_score ~ "Loss"
  ))

matches <- matches %>%
  mutate(outcomeforaway = case_when(
    away_score > home_score ~ "Win",
    away_score == home_score ~ "Tie",
    away_score < home_score ~ "Loss"
  ))

StatsBombData$home_team = matches$home_team.home_team_name[match(StatsBombData$match_id, matches$match_id)]

StatsBombData$away_team = matches$away_team.away_team_name[match(StatsBombData$match_id, matches$match_id)]

StatsBombData$outcomeforhome = matches$outcomeforhome[match(StatsBombData$match_id, matches$match_id)]

StatsBombData$outcomeforaway = matches$outcomeforaway[match(StatsBombData$match_id, matches$match_id)]


shots_goals <- StatsBombData %>%
  filter(OpposingTeam$OpposingTeam == "Manchester United" & match_week<35) %>%
  group_by(team.name) %>%
  summarise(shots = sum(type.name == "Shot", na.rm = TRUE),
            goals = sum(shot.outcome.name == "Goal", na.rm = TRUE))

ManU_homeschedule <- matches %>%
  filter(home_team.home_team_name == "Manchester United") %>%
  group_by(match_week) %>%
  summarise(away_team.away_team_name)

ManU_awayschedule <- matches %>%
  filter(away_team.away_team_name == "Manchester United") %>%
  group_by(match_week) %>%
  summarise(home_team.home_team_name)

ManU_homedata <- StatsBombData %>%
  filter(home_team == "Manchester United" & match_week < 29) %>%
  group_by(match_week, Team = team.name, OppTeam = OpposingTeam$OpposingTeam) %>%
  summarise(
    Shots = sum(type.name == "Shot", na.rm = TRUE),
    Goals = sum(shot.outcome.name == "Goal", na.rm = TRUE),
    Formation = as.integer(str_extract(first(tactics.formation), "\\d+")),
    Passes = sum(type.name == "Pass"),
    Inc_Passes = sum(ball_receipt.outcome.name == "Incomplete", na.rm = TRUE),
    Pass_Pct = Passes / (Passes + Inc_Passes),
    Yellow_Card = sum(foul_committed.card.name == "Yellow Card", na.rm = TRUE),
    Red_Card = sum(foul_committed.card.name == "Red Card", na.rm = TRUE),
    Fouls = sum(!is.na(foul_committed.type.name)),
    Assists = sum(pass.goal_assist == "TRUE", na.rm = TRUE),
    Unassisted = Goals - Assists,
    Duels_Won = sum(duel.outcome.name %in% c("Won", "Success", "Success in Play", "Success Out"), na.rm = TRUE),
    Dist_Goal = mean(DistToGoal, na.rm = TRUE),
    Dist_Keeper = mean(DistToKeeper, na.rm = TRUE),
    Dist_D1 = mean(distance.ToD1, na.rm = TRUE),
    Home_Result = 
  )

ManU_awaydata <- StatsBombData %>%
  filter(away_team == "Manchester United" & match_week < 29) %>%
  group_by(match_week, Team = team.name, OppTeam = OpposingTeam$OpposingTeam) %>%
  summarise(
    Shots = sum(type.name == "Shot", na.rm = TRUE),
    Goals = sum(shot.outcome.name == "Goal", na.rm = TRUE),
    Formation = as.integer(str_extract(first(tactics.formation), "\\d+")),
    Passes = sum(type.name == "Pass"),
    Inc_Passes = sum(ball_receipt.outcome.name == "Incomplete", na.rm = TRUE),
    Pass_Pct = Passes / (Passes + Inc_Passes),
    Yellow_Card = sum(foul_committed.card.name == "Yellow Card", na.rm = TRUE),
    Red_Card = sum(foul_committed.card.name == "Red Card", na.rm = TRUE),
    Fouls = sum(!is.na(foul_committed.type.name)),
    Assists = sum(pass.goal_assist == "TRUE", na.rm = TRUE),
    Unassisted = Goals - Assists,
    Duels_Won = sum(duel.outcome.name %in% c("Won", "Success", "Success in Play", "Success Out"), na.rm = TRUE),
    Dist_Goal = mean(DistToGoal, na.rm = TRUE),
    Dist_Keeper = mean(DistToKeeper, na.rm = TRUE),
    Dist_D1 = mean(distance.ToD1, na.rm = TRUE)
  )

library(writexl)
write_xlsx(ManU_homedata, "ManU_homedata.xlsx")
write_xlsx(ManU_awaydata, "ManU_awaydata.xlsx")

  
    