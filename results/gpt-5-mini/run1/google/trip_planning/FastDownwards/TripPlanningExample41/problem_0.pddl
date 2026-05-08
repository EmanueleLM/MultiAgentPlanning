(define (problem trip_13_days)
  (:domain jack_of_all_trades_trip)
  (:objects
    stockholm athens mykonos - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day

    stockholm_slot1 stockholm_slot2 stockholm_slot3 stockholm_slot4 stockholm_slot5 stockholm_slot6 - slot_stockholm
    athens_slot1 athens_slot2 athens_slot3 athens_slot4 athens_slot5 - slot_athens
    mykonos_slot1 mykonos_slot2 mykonos_slot3 mykonos_slot4 - slot_mykonos
  )

  (:init
    ;; temporal ordering
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

    ;; flights (bidirectional where specified)
    (flight athens mykonos)
    (flight mykonos athens)
    (flight stockholm athens)
    (flight athens stockholm)

    ;; initial occupancy: conference on day1 in stockholm is fixed
    (at stockholm day1)

    ;; bookkeeping for day1 assigned to stockholm_slot1
    (slot_filled_stockholm stockholm_slot1)
    (filled_by_stockholm stockholm_slot1 day1)
    ;; stockholm_slot1 is therefore not free (omit slot_free_stockholm stockholm_slot1)

    ;; free days: day2..day13 are free; day1 is already assigned so not listed as free
    (free_day day2)
    (free_day day3)
    (free_day day4)
    (free_day day5)
    (free_day day6)
    (free_day day7)
    (free_day day8)
    (free_day day9)
    (free_day day10)
    (free_day day11)
    (free_day day12)
    (free_day day13)

    ;; other stockholm slots free
    (slot_free_stockholm stockholm_slot2)
    (slot_free_stockholm stockholm_slot3)
    (slot_free_stockholm stockholm_slot4)
    (slot_free_stockholm stockholm_slot5)
    (slot_free_stockholm stockholm_slot6)

    ;; all athens slots free initially
    (slot_free_athens athens_slot1)
    (slot_free_athens athens_slot2)
    (slot_free_athens athens_slot3)
    (slot_free_athens athens_slot4)
    (slot_free_athens athens_slot5)

    ;; all mykonos slots free initially
    (slot_free_mykonos mykonos_slot1)
    (slot_free_mykonos mykonos_slot2)
    (slot_free_mykonos mykonos_slot3)
    (slot_free_mykonos mykonos_slot4)
  )

  (:goal (and
    ;; conference constraint: must be in stockholm on day6
    (at stockholm day6)

    ;; All stockholm slots must be filled (6 total)
    (slot_filled_stockholm stockholm_slot1)
    (slot_filled_stockholm stockholm_slot2)
    (slot_filled_stockholm stockholm_slot3)
    (slot_filled_stockholm stockholm_slot4)
    (slot_filled_stockholm stockholm_slot5)
    (slot_filled_stockholm stockholm_slot6)

    ;; All athens slots must be filled (5 total)
    (slot_filled_athens athens_slot1)
    (slot_filled_athens athens_slot2)
    (slot_filled_athens athens_slot3)
    (slot_filled_athens athens_slot4)
    (slot_filled_athens athens_slot5)

    ;; All mykonos slots must be filled (4 total)
    (slot_filled_mykonos mykonos_slot1)
    (slot_filled_mykonos mykonos_slot2)
    (slot_filled_mykonos mykonos_slot3)
    (slot_filled_mykonos mykonos_slot4)
  ))
)