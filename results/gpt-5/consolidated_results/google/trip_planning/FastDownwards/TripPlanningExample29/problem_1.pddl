(define (problem trip-planning-10days-instance)
  (:domain trip-planning-10days)
  (:objects
    krakow frankfurt dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  (:init
    ; start at day1 in Dubrovnik
    (current day1)
    (at dubrovnik)
    (in day1 dubrovnik)
    (assigned day1)
    (visited dubrovnik)

    ; day succession 1..10
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)

    ; direct flight network
    (direct frankfurt krakow)
    (direct krakow frankfurt)
    (direct dubrovnik frankfurt)
    (direct frankfurt dubrovnik)
  )
  (:goal (and
    ; progressed through all 10 days
    (current day10)

    ; wedding in Krakow on days 9 and 10 and end there
    (in day9 krakow)
    (in day10 krakow)
    (at krakow)

    ; enforce auditor-approved day allocations for preferences
    (in day1 dubrovnik)
    (in day2 dubrovnik)
    (in day3 dubrovnik)
    (in day4 dubrovnik)
    (in day5 dubrovnik)
    (in day6 dubrovnik)
    (in day7 dubrovnik)
    (in day8 frankfurt)

    ; visit all three cities at least once
    (visited dubrovnik)
    (visited frankfurt)
    (visited krakow)
  ))
)