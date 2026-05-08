(define (problem jack_of_all_trades_problem)
  (:domain jack_of_all_trades_trip)

  (:objects
    paris nice mykonos - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day

    paris_slot1 paris_slot2 paris_slot3 paris_slot4
    mykonos_slot1 mykonos_slot2 mykonos_slot3 mykonos_slot4
    nice_slot1 nice_slot2 nice_slot3 nice_slot4 nice_slot5
    - slot
  )

  (:init
    ;; temporal chain
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; flight connectivity (bidirectional where present)
    (flight paris nice)
    (flight nice paris)
    (flight nice mykonos)
    (flight mykonos nice)

    ;; slot ownership
    (slot_for paris_slot1 paris)
    (slot_for paris_slot2 paris)
    (slot_for paris_slot3 paris)
    (slot_for paris_slot4 paris)

    (slot_for mykonos_slot1 mykonos)
    (slot_for mykonos_slot2 mykonos)
    (slot_for mykonos_slot3 mykonos)
    (slot_for mykonos_slot4 mykonos)

    (slot_for nice_slot1 nice)
    (slot_for nice_slot2 nice)
    (slot_for nice_slot3 nice)
    (slot_for nice_slot4 nice)
    (slot_for nice_slot5 nice)

    ;; meeting allowed days (window day1..day4)
    (meet_allowed day1)
    (meet_allowed day2)
    (meet_allowed day3)
    (meet_allowed day4)
  )

  (:goal (and
    ;; every day must be assigned
    (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
    (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)
    (assigned day11)

    ;; all city slots must be consumed (hard stay-length requirements)
    (used paris_slot1) (used paris_slot2) (used paris_slot3) (used paris_slot4)
    (used mykonos_slot1) (used mykonos_slot2) (used mykonos_slot3) (used mykonos_slot4)
    (used nice_slot1) (used nice_slot2) (used nice_slot3) (used nice_slot4) (used nice_slot5)

    ;; meeting must occur in the allowed window while in paris
    (met)
  ))
)