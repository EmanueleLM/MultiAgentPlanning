(define (problem trip_planning_example_24)
  (:domain trip_planning)
  (:objects
    florence amsterdam riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    s0 s1 s2 s3 s4 s5 s6 - step
  )
  (:init
    ;; Starting position and day
    (at_city florence)
    (current_day d1)

    ;; Initialize all stay counts to zero
    (stay_count florence s0)
    (stay_count amsterdam s0)
    (stay_count riga s0)

    ;; Day progression
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

    ;; Step progression for counts
    (next_step s0 s1)
    (next_step s1 s2)
    (next_step s2 s3)
    (next_step s3 s4)
    (next_step s4 s5)
    (next_step s5 s6)

    ;; Direct flights
    (can_fly florence amsterdam)
    (can_fly amsterdam florence)
    (can_fly amsterdam riga)
    (can_fly riga amsterdam)
  )
  (:goal
    (and
      ;; Total trip duration processed (13 days)
      (current_day d14)

      ;; City stay requirements
      (stay_count florence s4)
      (stay_count amsterdam s6)
      (stay_count riga s5)

      ;; Workshop in Florence constraint (Days 1 to 4)
      (visited_at florence d1)
      (visited_at florence d2)
      (visited_at florence d3)
      (visited_at florence d4)
    )
  )
)