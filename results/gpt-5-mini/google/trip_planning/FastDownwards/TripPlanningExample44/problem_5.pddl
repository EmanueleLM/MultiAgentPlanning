(define (problem trip17_compact)
  (:domain trip_planning_compact)

  (:objects
    rome lyon zurich - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day

    ;; slots encode the desired counts: 6 lyon, 7 zurich, 6 rome (total 19 slots)
    lyon_slot1 lyon_slot2 lyon_slot3 lyon_slot4 lyon_slot5 lyon_slot6
    zurich_slot1 zurich_slot2 zurich_slot3 zurich_slot4 zurich_slot5 zurich_slot6 zurich_slot7
    rome_slot1 rome_slot2 rome_slot3 rome_slot4 rome_slot5 rome_slot6 - slot
  )

  (:init
    ;; day ordering
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
    (next_day day11 day12)
    (next_day day12 day13)
    (next_day day13 day14)
    (next_day day14 day15)
    (next_day day15 day16)
    (next_day day16 day17)

    (day_is_first day1)

    ;; available direct flights (bidirectional where given)
    (flight rome lyon)
    (flight lyon rome)
    (flight rome zurich)
    (flight zurich rome)

    ;; map slots to their target cities (captures the user's requested counts)
    (slot_for_city lyon_slot1 lyon)
    (slot_for_city lyon_slot2 lyon)
    (slot_for_city lyon_slot3 lyon)
    (slot_for_city lyon_slot4 lyon)
    (slot_for_city lyon_slot5 lyon)
    (slot_for_city lyon_slot6 lyon)

    (slot_for_city zurich_slot1 zurich)
    (slot_for_city zurich_slot2 zurich)
    (slot_for_city zurich_slot3 zurich)
    (slot_for_city zurich_slot4 zurich)
    (slot_for_city zurich_slot5 zurich)
    (slot_for_city zurich_slot6 zurich)
    (slot_for_city zurich_slot7 zurich)

    (slot_for_city rome_slot1 rome)
    (slot_for_city rome_slot2 rome)
    (slot_for_city rome_slot3 rome)
    (slot_for_city rome_slot4 rome)
    (slot_for_city rome_slot5 rome)
    (slot_for_city rome_slot6 rome)

    ;; wedding must be attended on one day between day1 and day7 inclusive
    (wedding_day_window day1)
    (wedding_day_window day2)
    (wedding_day_window day3)
    (wedding_day_window day4)
    (wedding_day_window day5)
    (wedding_day_window day6)
    (wedding_day_window day7)
  )

  ;; NOTE: The user's requirements request 6 days in Lyon, 7 days in Zurich, and 6 days in Rome
  ;; which sum to 19 days, but only 17 day objects are available. This problem encoding preserves
  ;; that hard constraint: the goal asks for all 19 slots to be filled and for the wedding to be attended.
  ;; The instance is therefore contradictory/unsolvable as specified.
  (:goal (and
    ;; require all requested slots be filled (this enforces the user's day-count requests exactly)
    (slot_filled lyon_slot1)
    (slot_filled lyon_slot2)
    (slot_filled lyon_slot3)
    (slot_filled lyon_slot4)
    (slot_filled lyon_slot5)
    (slot_filled lyon_slot6)

    (slot_filled zurich_slot1)
    (slot_filled zurich_slot2)
    (slot_filled zurich_slot3)
    (slot_filled zurich_slot4)
    (slot_filled zurich_slot5)
    (slot_filled zurich_slot6)
    (slot_filled zurich_slot7)

    (slot_filled rome_slot1)
    (slot_filled rome_slot2)
    (slot_filled rome_slot3)
    (slot_filled rome_slot4)
    (slot_filled rome_slot5)
    (slot_filled rome_slot6)

    ;; wedding must be attended in the allowed window
    (wedding_attended)
  ))
)