(define (problem jack_trip_problem)
  (:domain jackofalltrades_trip)

  (:objects
    ; cities
    bucharest zurich dubrovnik - city

    ; days (10 days)
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day

    ; slots: requested counts per city encoded as individual slot objects
    ; bucharest: 3 slots
    buch_slot1 buch_slot2 buch_slot3
    ; zurich: 2 slots
    zur_slot1 zur_slot2
    ; dubrovnik: 7 slots (one of them is the relatives slot)
    dub_slot_rel dub_slot1 dub_slot2 dub_slot3 dub_slot4 dub_slot5 dub_slot6 - slot
  )

  (:init
    ; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10)

    ; slot membership (which city each slot corresponds to)
    (slot_for buch_slot1 bucharest) (slot_for buch_slot2 bucharest) (slot_for buch_slot3 bucharest)
    (slot_for zur_slot1 zurich) (slot_for zur_slot2 zurich)
    (slot_for dub_slot_rel dubrovnik) (slot_for dub_slot1 dubrovnik) (slot_for dub_slot2 dubrovnik)
    (slot_for dub_slot3 dubrovnik) (slot_for dub_slot4 dubrovnik) (slot_for dub_slot5 dubrovnik)
    (slot_for dub_slot6 dubrovnik)

    ; all slots available at start
    (slot_available buch_slot1) (slot_available buch_slot2) (slot_available buch_slot3)
    (slot_available zur_slot1) (slot_available zur_slot2)
    (slot_available dub_slot_rel) (slot_available dub_slot1) (slot_available dub_slot2)
    (slot_available dub_slot3) (slot_available dub_slot4) (slot_available dub_slot5)
    (slot_available dub_slot6)

    ; mark the relatives slot
    (is_rel_slot dub_slot_rel)

    ; relatives slot allowed only on days 4..10
    (rel_slot_allowed day4) (rel_slot_allowed day5) (rel_slot_allowed day6)
    (rel_slot_allowed day7) (rel_slot_allowed day8) (rel_slot_allowed day9) (rel_slot_allowed day10)

    ; day succession ordering
    (day_succ day1 day2) (day_succ day2 day3) (day_succ day3 day4) (day_succ day4 day5)
    (day_succ day5 day6) (day_succ day6 day7) (day_succ day7 day8) (day_succ day8 day9)
    (day_succ day9 day10)

    ; mark the first day
    (day_is_first day1)

    ; direct flights (only the connections given; bidirectional)
    (direct_flight bucharest zurich) (direct_flight zurich bucharest)
    (direct_flight zurich dubrovnik) (direct_flight dubrovnik zurich)
  )

  (:goal
    (and
      ; require all 10 days to be assigned to some city
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)

      ; enforce the requested per-city day counts by requiring all per-city slots to be used
      ; Note: the requested counts sum to 12 (bucharest 3 + zurich 2 + dubrovnik 7) while there are only 10 days.
      ; This models the user's stated preferences exactly; the instance is therefore unsatisfiable.
      (used_slot buch_slot1) (used_slot buch_slot2) (used_slot buch_slot3)
      (used_slot zur_slot1) (used_slot zur_slot2)
      (used_slot dub_slot_rel) (used_slot dub_slot1) (used_slot dub_slot2) (used_slot dub_slot3)
      (used_slot dub_slot4) (used_slot dub_slot5) (used_slot dub_slot6)
    )
  )
)