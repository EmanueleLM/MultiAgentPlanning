(define (problem trip_planning_example_18_problem)
  (:domain trip_planning_example_18)
  (:objects
    amsterdam vilnius bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    (not_started)
    (stay_count amsterdam c0)
    (stay_count vilnius c0)
    (stay_count bucharest c0)
    
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
    
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    
    (flight amsterdam bucharest)
    (flight bucharest amsterdam)
    (flight vilnius amsterdam)
    (flight amsterdam vilnius)
  )
  (:goal
    (and
      (stay_count amsterdam c5)
      (stay_count vilnius c2)
      (stay_count bucharest c6)
      (at_city bucharest d6)
      (at_city bucharest d7)
      (at_city bucharest d8)
      (at_city bucharest d9)
      (at_city bucharest d10)
      (at_city bucharest d11)
    )
  )
)