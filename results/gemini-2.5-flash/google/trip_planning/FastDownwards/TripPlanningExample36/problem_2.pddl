(define (problem TripPlanningExample36)
  (:domain trip-planning)
  (:objects
    florence munich warsaw - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )
  (:init
    (at florence)
    (current_day d0)
    (next_day d0 d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)

    ;; Direct flight connections (strictly from human specification)
    (connected florence munich)
    (connected florence warsaw)

    (= (total-cost) 0)
  )
  (:goal (and
    (current_day d13) ; Total trip duration is 13 days
    (florence_day_completed_2)
    (warsaw_day_completed_7)
    (munich_day_day_completed_6) ; Fixed predicate name here
  ))
  (:metric minimize (total-cost))
)