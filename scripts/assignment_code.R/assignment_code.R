# Q3: Top Players and Their Behaviour

top_10_players <- full_data %>%
  group_by(player_id) %>%
  summarise(total_play_time = sum(play_time_minutes, na.rm = TRUE)) %>%
  arrange(desc(total_play_time)) %>%
  slice_head(n = 10)

q3_data <- full_data %>%
  filter(player_id %in% top_10_players$player_id)

q3_summary <- q3_data %>%
  group_by(player_id) %>%
  summarise(
    total_sessions = n(),
    average_play_time = mean(play_time_minutes, na.rm = TRUE),
    average_score = mean(score, na.rm = TRUE)
  )

# Table
kable(q3_summary)

# Boxplot
ggplot(q3_data, aes(x = as.factor(player_id), y = score)) +
  geom_boxplot() +
  labs(
    title = "Score Distribution of Top 10 Players",
    x = "Player ID",
    y = "Score"
  )
# Q4: Age Group Behaviour Comparison

q4_data <- full_data %>%
  mutate(age_group = case_when(
    age >= 16 & age <= 25 ~ "16-25",
    age >= 26 & age <= 35 ~ "26-35",
    age >= 36 & age <= 45 ~ "36-45",
    age >= 46 ~ "46+"
  ))

q4_summary <- q4_data %>%
  group_by(age_group) %>%
  summarise(
    average_play_time = mean(play_time_minutes, na.rm = TRUE),
    average_score = mean(score, na.rm = TRUE),
    number_sessions = n()
  )

# Table
kable(q4_summary)

# Plot
ggplot(q4_summary, aes(x = age_group, y = average_play_time)) +
  geom_col() +
  labs(
    title = "Average Play Time by Age Group",
    x = "Age Group",
    y = "Average Play Time"
  )