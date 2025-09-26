(define (problem trip-problem)
  (:domain trip)
  (:objects
    berlin munich dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )
  (:init
    ;; direct flight connectivity (bidirectional where applicable)
    (connected munich berlin)
    (connected berlin munich)
    (connected munich dubrovnik)
    (connected dubrovnik munich)
    ;; day succession
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    ;; initial location and unassigned future days
    (at berlin day1)
    (unassigned day2)
    (unassigned day3)
    (unassigned day4)
    (unassigned day5)
    (unassigned day6)
    (unassigned day7)
    (unassigned day8)
  )
  (:goal (and
    ;; mandatory conference attendance and feasible allocation for 8 days
    (at berlin day1)
    (at berlin day4)
    ;; chosen allocation that respects direct-flight-only commutes:
    ;; day2,day3,day5 in Munich; day6,day7,day8 in Dubrovnik
    (at munich day2)
    (at munich day3)
    (at munich day5)
    (at dubrovnik day6)
    (at dubrovnik day7)
    (at dubrovnik day8)
  ))
)