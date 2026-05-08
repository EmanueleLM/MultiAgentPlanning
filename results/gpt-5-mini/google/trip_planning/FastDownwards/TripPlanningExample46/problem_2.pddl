(define (problem trip_plan_instance)
  (:domain trip_planning_instance)
  (:objects
    seville manchester stockholm - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day

    ; slots encode requested per-city day quotas (one slot per requested day)
    seville_s1 seville_s2 seville_s3 seville_s4 seville_s5 - slot
    manchester_s1 manchester_s2 manchester_s3 manchester_s4 manchester_s5 - slot
    stockholm_s1 stockholm_s2 stockholm_s3 - slot
  )

  (:init
    ;; day ordering (discrete consecutive days 1..11)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)

    ;; direct flights (only direct flights allowed; bidirectional where provided)
    (flight manchester seville)
    (flight seville manchester)
    (flight stockholm manchester)
    (flight manchester stockholm)

    ;; initial conference constraints: day1 and day3 must be in stockholm
    (assigned day1 stockholm)
    (day_assigned day1)
    (assigned day3 stockholm)
    (day_assigned day3)

    ;; slot -> city mapping (slots represent requested per-city day quotas)
    (slot_of seville_s1 seville)
    (slot_of seville_s2 seville)
    (slot_of seville_s3 seville)
    (slot_of seville_s4 seville)
    (slot_of seville_s5 seville)

    (slot_of manchester_s1 manchester)
    (slot_of manchester_s2 manchester)
    (slot_of manchester_s3 manchester)
    (slot_of manchester_s4 manchester)
    (slot_of manchester_s5 manchester)

    (slot_of stockholm_s1 stockholm)
    (slot_of stockholm_s2 stockholm)
    (slot_of stockholm_s3 stockholm)

    ;; pre-consume two stockholm slots because day1 and day3 are pre-assigned to stockholm (conference days)
    (filled stockholm_s1)
    (filled stockholm_s2)
  )

  (:goal
    (and
      ;; every day must be assigned to some city
      (day_assigned day1)
      (day_assigned day2)
      (day_assigned day3)
      (day_assigned day4)
      (day_assigned day5)
      (day_assigned day6)
      (day_assigned day7)
      (day_assigned day8)
      (day_assigned day9)
      (day_assigned day10)
      (day_assigned day11)

      ;; hard per-city day quotas encoded as slots (user requests):
      ;; seville 5 days, manchester 5 days, stockholm 3 days
      ;; Note: these quotas sum to 13 while only 11 days exist. This makes the instance infeasible;
      ;; the model preserves the user's hard requests exactly (so a planner will correctly report no solution).
      (filled seville_s1)
      (filled seville_s2)
      (filled seville_s3)
      (filled seville_s4)
      (filled seville_s5)

      (filled manchester_s1)
      (filled manchester_s2)
      (filled manchester_s3)
      (filled manchester_s4)
      (filled manchester_s5)

      (filled stockholm_s1)
      (filled stockholm_s2)
      (filled stockholm_s3)
    )
  )
)