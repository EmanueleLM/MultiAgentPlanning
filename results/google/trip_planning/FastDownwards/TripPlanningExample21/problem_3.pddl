(define (problem ten-day-europe-trip)
  (:domain trip-planning-multiagent)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    venice-slot1 venice-slot2 venice-slot3 venice-slot4 venice-slot5 venice-slot6 - venice_slot
    mykonos-slot1 mykonos-slot2 - mykonos_slot
    vienna-slot1 vienna-slot2 vienna-slot3 vienna-slot4 - vienna_slot
  )

  (:init
    ;; first day marker
    (first-day day1)

    ;; linear ordering of days
    (previous day2 day1)
    (previous day3 day2)
    (previous day4 day3)
    (previous day5 day4)
    (previous day6 day5)
    (previous day7 day6)
    (previous day8 day7)
    (previous day9 day8)
    (previous day10 day9)

    ;; workshop time window in Venice: between day5 and day10 inclusive
    (workshop-window day5)
    (workshop-window day6)
    (workshop-window day7)
    (workshop-window day8)
    (workshop-window day9)
    (workshop-window day10)

    ;; direct flight connectivity (only direct flights allowed for commuting)
    (direct-flight mykonos vienna)
    (direct-flight vienna mykonos)
    (direct-flight vienna venice)
    (direct-flight venice vienna)
    ;; No direct flight between Mykonos and Venice is not listed, reflecting the private info

    ;; vacant slots: the traveler requires exactly these many days in each city
    ;; Venice: 6 days (venice-slot1..venice-slot6)
    (vacant-venice venice-slot1)
    (vacant-venice venice-slot2)
    (vacant-venice venice-slot3)
    (vacant-venice venice-slot4)
    (vacant-venice venice-slot5)
    (vacant-venice venice-slot6)

    ;; Mykonos: 2 days
    (vacant-mykonos mykonos-slot1)
    (vacant-mykonos mykonos-slot2)

    ;; Vienna: 4 days
    (vacant-vienna vienna-slot1)
    (vacant-vienna vienna-slot2)
    (vacant-vienna vienna-slot3)
    (vacant-vienna vienna-slot4)
  )

  (:goal (and
    ;; all 10 calendar days must be assigned
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

    ;; the workshop must be attended while in Venice during the allowed window
    (workshop-attended)

    ;; all city-specific day requirements must be satisfied exactly by consuming all slots
    (visited-venice)
    (visited-mykonos)
    (visited-vienna)

    ;; ensure every city slot has been consumed (enforces exact number of days per city)
    (not (vacant-venice venice-slot1))
    (not (vacant-venice venice-slot2))
    (not (vacant-venice venice-slot3))
    (not (vacant-venice venice-slot4))
    (not (vacant-venice venice-slot5))
    (not (vacant-venice venice-slot6))

    (not (vacant-mykonos mykonos-slot1))
    (not (vacant-mykonos mykonos-slot2))

    (not (vacant-vienna vienna-slot1))
    (not (vacant-vienna vienna-slot2))
    (not (vacant-vienna vienna-slot3))
    (not (vacant-vienna vienna-slot4))
  ))