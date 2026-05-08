(define (problem trip_planning_example_34_problem)
  (:domain trip_planning_example_34)
  (:objects
    frankfurt florence valencia - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day ; d0 is start, d11 is end after 11 days
    fd0 fd1 fd2 fd3 fd4 fd5 - num_days_frankfurt
    fld0 fld1 fld2 fld3 fld4 - num_days_florence
    vd0 vd1 vd2 - num_days_valencia
  )
  (:init
    ; Initial location (arbitrary, picking Frankfurt as it's a major hub and first mentioned)
    (at frankfurt)

    ; Current day (start of the trip)
    (current_day d0)

    ; Day sequence for 11 days of activities
    (next_day d0 d1) (next_day d1 d2) (next_day d2 d3) (next_day d3 d4)
    (next_day d4 d5) (next_day d5 d6) (next_day d6 d7) (next_day d7 d8)
    (next_day d8 d9) (next_day d9 d10) (next_day d10 d11)

    ; Day markers for Valencia relatives constraint (absolute days of the trip)
    ; 'day 1' of the trip refers to the time period from d1 to d2 (after d0).
    (is_trip_day_1 d1)
    (is_trip_day_2 d2)

    ; City connectivity (direct flights)
    (connected frankfurt florence)
    (connected florence frankfurt)
    (connected valencia frankfurt)
    (connected frankfurt valencia)

    ; Initial duration counters (0 days spent in each city)
    (frankfurt_days_spent fd0)
    (florence_days_spent fld0)
    (valencia_days_spent vd0)

    ; Sequences for incrementing duration counters
    (next_num_frankfurt fd0 fd1)
    (next_num_frankfurt fd1 fd2)
    (next_num_frankfurt fd2 fd3)
    (next_num_frankfurt fd3 fd4)
    (next_num_frankfurt fd4 fd5)

    (next_num_florence fld0 fld1)
    (next_num_florence fld1 fld2)
    (next_num_florence fld2 fld3)
    (next_num_florence fld3 fld4)

    (next_num_valencia vd0 vd1)
    (next_num_valencia vd1 vd2)

    ; Initial total cost
    (= (total-cost) 0)
  )
  (:goal (and
    (frankfurt_days_spent fd5) ; Ensure 5 days are spent in Frankfurt
    (florence_days_spent fld4) ; Ensure 4 days are spent in Florence
    (valencia_days_spent vd2)  ; Ensure 2 days are spent in Valencia
    (visited_valencia_relatives) ; Ensure relatives in Valencia are visited
    (visited_city frankfurt)    ; Ensure all specified cities are visited at least once
    (visited_city florence)
    (visited_city valencia)
    (current_day d11) ; The plan must conclude after all 11 days of activities
  ))
  (:metric minimize (total-cost))
)