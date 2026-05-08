(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    milan reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    s0 s1 s2 s3 s4 s5 s6 s7 - step
  )
  (:init
    ;; Starting state: User begins in Split
    (at_city split)
    (current_day d1)

    ;; Initial stay counts for all cities
    (stay_count milan s0)
    (stay_count reykjavik s0)
    (stay_count split s0)

    ;; Timeline definition: 13 days of activities (d1 to d14)
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
    (next_day d13 d14)

    ;; Stay duration counters
    (next_step s0 s1)
    (next_step s1 s2)
    (next_step s2 s3)
    (next_step s3 s4)
    (next_step s4 s5)
    (next_step s5 s6)
    (next_step s6 s7)

    ;; Flight network
    (flight milan reykjavik)
    (flight reykjavik milan)
    (flight split milan)
    (flight milan split)

    ;; Relative visit constraints: Split visit required between Day 1 and Day 3
    (can_stay_at d1 split)
    (can_stay_at d2 split)
    (can_stay_at d3 split)
    
    ;; Allow travel to Milan starting on Day 3 to enable the overlap interpretation
    (can_stay_at d3 milan)

    ;; General feasibility for remaining days
    (can_stay_at d4 milan) (can_stay_at d4 reykjavik) (can_stay_at d4 split)
    (can_stay_at d5 milan) (can_stay_at d5 reykjavik) (can_stay_at d5 split)
    (can_stay_at d6 milan) (can_stay_at d6 reykjavik) (can_stay_at d6 split)
    (can_stay_at d7 milan) (can_stay_at d7 reykjavik) (can_stay_at d7 split)
    (can_stay_at d8 milan) (can_stay_at d8 reykjavik) (can_stay_at d8 split)
    (can_stay_at d9 milan) (can_stay_at d9 reykjavik) (can_stay_at d9 split)
    (can_stay_at d10 milan) (can_stay_at d10 reykjavik) (can_stay_at d10 split)
    (can_stay_at d11 milan) (can_stay_at d11 reykjavik) (can_stay_at d11 split)
    (can_stay_at d12 milan) (can_stay_at d12 reykjavik) (can_stay_at d12 split)
    (can_stay_at d13 milan) (can_stay_at d13 reykjavik) (can_stay_at d13 split)
  )
  (:goal
    (and
      ;; Total trip duration reached after 13 days
      (current_day d14)
      ;; Requirement: visit Split for 3 days
      (stay_count split s3)
      ;; Requirement: visit Milan for 7 days
      (stay_count milan s7)
      ;; Requirement: visit Reykjavik for 5 days
      (stay_count reykjavik s5)
    )
  )
)