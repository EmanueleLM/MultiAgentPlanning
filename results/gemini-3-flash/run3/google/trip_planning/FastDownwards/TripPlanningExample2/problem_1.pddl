(define (problem trip_planning_example_2_problem)
  (:domain trip_planning_example_2)
  (:objects
    reykjavik vienna venice - city
    day_01 day_02 day_03 day_04 day_05 day_06 day_07 day_08 day_09 day_10 day_11 - day
    count_00 count_01 count_02 count_03 count_04 count_05 count_06 count_07 count_08 count_09 count_10 count_11 - count
  )

  (:init
    ;; Timeline
    (next_day day_01 day_02)
    (next_day day_02 day_03)
    (next_day day_03 day_04)
    (next_day day_04 day_05)
    (next_day day_05 day_06)
    (next_day day_06 day_07)
    (next_day day_07 day_08)
    (next_day day_08 day_09)
    (next_day day_09 day_10)
    (next_day day_10 day_11)

    ;; Counts
    (successor count_00 count_01)
    (successor count_01 count_02)
    (successor count_02 count_03)
    (successor count_03 count_04)
    (successor count_04 count_05)
    (successor count_05 count_06)
    (successor count_06 count_07)
    (successor count_07 count_08)
    (successor count_08 count_09)
    (successor count_09 count_10)
    (successor count_10 count_11)

    ;; Initialize counts
    (day_count reykjavik count_00)
    (day_count vienna count_00)
    (day_count venice count_00)

    ;; Flight routes
    (can_fly reykjavik vienna)
    (can_fly vienna reykjavik)
    (can_fly vienna venice)
    (can_fly venice vienna)
  )

  (:goal
    (and
      ;; Total trip duration requirement
      (trip_started)
      (exists (?c - city) (at ?c day_11))

      ;; Visit duration requirements
      (day_count reykjavik count_02)
      (day_count vienna count_07)
      (day_count venice count_04)

      ;; Temporal wedding constraint
      (at venice day_08)
      (at venice day_09)
      (at venice day_10)
      (at venice day_11)
    )
  )
)