(define (problem integrated-travel-problem)
  (:domain integrated-travel)
  (:objects
    traveler flight_agent - agent
    mykonos vienna venice - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; Initial current day
    (current day0)

    ;; Initial total-cost
    (= (total-cost) 0)

    ;; Starting location for the traveling agent
    (at traveler mykonos)

    ;; Direct flight connectivity (no direct Mykonos<->Venice)
    (direct mykonos vienna)
    (direct vienna mykonos)

    (direct vienna venice)
    (direct venice vienna)

    ;; advance2 relations (from -> to) where from+2 <= 10
    (advance2 day0 day2)
    (advance2 day1 day3)
    (advance2 day2 day4)
    (advance2 day3 day5)
    (advance2 day4 day6)
    (advance2 day5 day7)
    (advance2 day6 day8)
    (advance2 day7 day9)
    (advance2 day8 day10)

    ;; advance6 relations (from -> to) where from+6 <= 10
    (advance6 day0 day6)
    (advance6 day1 day7)
    (advance6 day2 day8)
    (advance6 day3 day9)
    (advance6 day4 day10)
  )

  (:goal
    (and
      (visited mykonos)
      (visited vienna)
      (visited venice)
      (workshop-attended)
      (current day10)
    )
  )

  (:metric minimize (total-cost))
)