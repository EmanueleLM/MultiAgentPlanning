(define (problem trip-problem)
  (:domain multiagent-travel)

  (:objects
    traveler flight_planner - agent
    copenhagen vienna lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Direct flights available (symmetric where specified)
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

    ;; Day successor chain up to available days (11 days)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; Traveler starts in Copenhagen on day1 (implied by the conference requirement on day1)
    (at traveler copenhagen day1)

    ;; Conference attendance requirements (public information)
    (need-attend day1)
    (need-attend day5)
  )

  ;; Global goal: visit all three cities and attend required conference days
  (:goal (and
           (visited copenhagen)
           (visited vienna)
           (visited lyon)
           (attended day1)
           (attended day5)
         ))
)