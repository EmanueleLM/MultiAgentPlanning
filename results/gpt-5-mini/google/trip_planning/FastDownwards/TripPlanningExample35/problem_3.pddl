(define (problem trip_planning_example35)
  (:domain trip_planning_specific)

  (:objects
    bucharest zurich dubrovnik - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day

    ; slots represent required visit-days per city (hard constraints from the specification)
    buch_slot1 buch_slot2 buch_slot3 - slot
    zur_slot1 zur_slot2 - slot
    dub_slot_rel dub_slot1 dub_slot2 dub_slot3 dub_slot4 dub_slot5 dub_slot6 - slot
  )

  (:init
    ;; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)

    ;; slot ownership encodes required counts per city:
    ;; bucharest: 3 slots (must be used)
    (slot_for buch_slot1 bucharest) (slot_for buch_slot2 bucharest) (slot_for buch_slot3 bucharest)
    ;; zurich: 2 slots
    (slot_for zur_slot1 zurich) (slot_for zur_slot2 zurich)
    ;; dubrovnik: 7 slots (one is a relative-visit slot)
    (slot_for dub_slot_rel dubrovnik) (slot_for dub_slot1 dubrovnik) (slot_for dub_slot2 dubrovnik)
    (slot_for dub_slot3 dubrovnik) (slot_for dub_slot4 dubrovnik) (slot_for dub_slot5 dubrovnik)
    (slot_for dub_slot6 dubrovnik)

    ;; all slots initially available
    (slot_available buch_slot1) (slot_available buch_slot2) (slot_available buch_slot3)
    (slot_available zur_slot1) (slot_available zur_slot2)
    (slot_available dub_slot_rel) (slot_available dub_slot1) (slot_available dub_slot2)
    (slot_available dub_slot3) (slot_available dub_slot4) (slot_available dub_slot5)
    (slot_available dub_slot6)

    ;; mark the relative slot for Dubrovnik and allowed days for visiting relatives (day 4..day10)
    (is_rel_slot dub_slot_rel)
    (rel_slot_allowed day4) (rel_slot_allowed day5) (rel_slot_allowed day6)
    (rel_slot_allowed day7) (rel_slot_allowed day8) (rel_slot_allowed day9) (rel_slot_allowed day10)

    ;; day ordering
    (day_succ day1 day2) (day_succ day2 day3) (day_succ day3 day4) (day_succ day4 day5)
    (day_succ day5 day6) (day_succ day6 day7) (day_succ day7 day8) (day_succ day8 day9)
    (day_succ day9 day10)

    (day_is_first day1)

    ;; direct flights available (bidirectional as specified)
    (direct_flight bucharest zurich) (direct_flight zurich bucharest)
    (direct_flight zurich dubrovnik) (direct_flight dubrovnik zurich)
  )

  (:goal
    (and
      ;; all 10 days must be assigned (10-day trip)
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)

      ;; hard requirements from the specification: use all slots corresponding to requested city-day counts
      ;; bucharest 3 days:
      (used_slot buch_slot1) (used_slot buch_slot2) (used_slot buch_slot3)
      ;; zurich 2 days:
      (used_slot zur_slot1) (used_slot zur_slot2)
      ;; dubrovnik 7 days (including the relative slot which must occur between day4 and day10)
      (used_slot dub_slot_rel) (used_slot dub_slot1) (used_slot dub_slot2) (used_slot dub_slot3)
      (used_slot dub_slot4) (used_slot dub_slot5) (used_slot dub_slot6)
    )
  )
)