{
  # Task 1: output the array for last week's data
  last_week: (nth(length | . - 2)),

  # Task 2: output count for yesterday in this week's data
  yesterday: (last | nth(length | . - 2)),

  # Task 3: output sum of counts for this week's data
  total: (last | add),

  # Task 4: output number of days with 5 or more birds in this week's data
  busy_days: (last | map(select(. >= 5)) | length),

  # Task 5: output true if any day this week has zero birds
  has_day_without_birds: (last | any(. == 0))
}
