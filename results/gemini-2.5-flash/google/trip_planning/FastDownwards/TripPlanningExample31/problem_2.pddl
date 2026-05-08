(define (problem TripPlanningExample31)
  (:domain trip-planning)
  (:objects
    traveler - traveler
    day-0 day-1 day-2 day-3 day-4 day-5 day-6 day-7 day-8 day-9 day-10 - day
    f0 f1 f2 - f_day_count_token
    r0 r1 r2 r3 - r_day_count_token
    s0 s1 s2 s3 s4 s5 s6 s7 - s_day_count_token
  )
  (:init
    ; Initial traveler location (assuming starting in Frankfurt)
    (at traveler frankfurt)
    (visited frankfurt) ; Starting city is already visited

    ; Initial day
    (current_day day-0)

    ; Day sequence
    (next_day day-0 day-1)
    (next_day day-1 day-2)
    (next_day day-2 day-3)
    (next_day day-3 day-4)
    (next_day day-4 day-5)
    (next_day day-5 day-6)
    (next_day day-6 day-7)
    (next_day day-7 day-8)
    (next_day day-8 day-9)
    (next_day day-9 day-10)

    ; City connections
    (connected frankfurt reykjavik)
    (connected reykjavik frankfurt)
    (connected split frankfurt)
    (connected frankfurt split)

    ; Initial stay counts
    (frankfurt_stay_current f0)
    (reykjavik_stay_current r0)
    (split_stay_current s0)

    ; Stay count transitions for Frankfurt
    (next_f_stay_token f0 f1)
    (next_f_stay_token f1 f2)
    (next_f_stay_token f2 f2) ; Max stay reached, no further increment

    ; Stay count transitions for Reykjavik
    (next_r_stay_token r0 r1)
    (next_r_stay_token r1 r2)
    (next_r_stay_token r2 r3)
    (next_r_stay_token r3 r3) ; Max stay reached, no further increment

    ; Stay count transitions for Split
    (next_s_stay_token s0 s1)
    (next_s_stay_token s1 s2)
    (next_s_stay_token s2 s3)
    (next_s_stay_token s3 s4)
    (next_s_stay_token s4 s5)
    (next_s_stay_token s5 s6)
    (next_s_stay_token s6 s7)
    (next_s_stay_token s7 s7) ; Max stay reached, no further increment

    ; Workshop days (day 8, 9, 10)
    (workshop_day day-8)
    (workshop_day day-9)
    (workshop_day day-10)

    ; Initial cost
    (= (total-cost) 0)
  )
  (:goal (and
    (current_day day-10) ; Trip completes by day 10
    (frankfurt_stay_current f2) ; Spend 2 days in Frankfurt
    (reykjavik_stay_current r3) ; Spend 3 days in Reykjavik
    (split_stay_current s7)     ; Spend 7 days in Split
    (visited frankfurt)
    (visited reykjavik)
    (visited split)
    ; Workshop constraint (being in Reykjavik on day 8, 9, 10) is enforced by action preconditions.
    ; If a plan exists, this constraint will be satisfied.
  ))
  (:metric minimize (total-cost))
)