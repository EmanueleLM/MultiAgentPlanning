(define (problem ten-day-europe-trip)
  (:domain trip-planning-multiagent)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    venice-slot1 venice-slot2 venice-slot3 venice-slot4 venice-slot5 venice-slot6 - venice_slot
    mykonos-slot1 mykonos-slot2 - mykonos_slot
    vienna-slot1 vienna-slot2 vienna-slot3 vienna-slot4 - vienna_slot
  )

  (:init
    (first-day day1)

    (previous day2 day1)
    (previous day3 day2)
    (previous day4 day3)
    (previous day5 day4)
    (previous day6 day5)
    (previous day7 day6)
    (previous day8 day7)
    (previous day9 day8)
    (previous day10 day9)

    (workshop-window day5)
    (workshop-window day6)
    (workshop-window day7)
    (workshop-window day8)
    (workshop-window day9)
    (workshop-window day10)

    (direct-flight mykonos vienna)
    (direct-flight vienna mykonos)
    (direct-flight vienna venice)
    (direct-flight venice vienna)

    (vacant-venice venice-slot1)
    (vacant-venice venice-slot2)
    (vacant-venice venice-slot3)
    (vacant-venice venice-slot4)
    (vacant-venice venice-slot5)
    (vacant-venice venice-slot6)

    (vacant-mykonos mykonos-slot1)
    (vacant-mykonos mykonos-slot2)

    (vacant-vienna vienna-slot1)
    (vacant-vienna vienna-slot2)
    (vacant-vienna vienna-slot3)
    (vacant-vienna vienna-slot4)
  )

  (:goal (and
    (assigned day1)
    (assigned day2)
    (assigned day3)
    (assigned day4)
    (assigned day5)
    (assigned day6)
    (assigned day7)
    (assigned day8)
    (assigned day9)
    (assigned day10)
    (workshop-attended)
    (visited-venice)
    (visited-mykonos)
    (visited-vienna)
  ))
)