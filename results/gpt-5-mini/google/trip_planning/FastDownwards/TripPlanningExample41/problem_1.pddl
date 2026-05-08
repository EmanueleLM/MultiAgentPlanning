(define (problem trip_13_days)
  (:domain trip_planning)
  (:objects
    stockholm athens mykonos - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day

    stockholm_slot1 stockholm_slot2 stockholm_slot3 stockholm_slot4 stockholm_slot5 stockholm_slot6 - slot
    athens_slot1 athens_slot2 athens_slot3 athens_slot4 athens_slot5 - slot
    mykonos_slot1 mykonos_slot2 mykonos_slot3 mykonos_slot4 - slot
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

    ;; direct flights (bidirectional where provided)
    (flight athens mykonos)
    (flight mykonos athens)
    (flight stockholm athens)
    (flight athens stockholm)

    ;; initial presence: conference on day1 in stockholm is fixed
    (at stockholm day1)

    ;; other days initially unassigned (available)
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

    ;; slot ownership (static): number of slots encodes desired total days per city
    (slot_belongs stockholm_slot1 stockholm)
    (slot_belongs stockholm_slot2 stockholm)
    (slot_belongs stockholm_slot3 stockholm)
    (slot_belongs stockholm_slot4 stockholm)
    (slot_belongs stockholm_slot5 stockholm)
    (slot_belongs stockholm_slot6 stockholm)

    (slot_belongs athens_slot1 athens)
    (slot_belongs athens_slot2 athens)
    (slot_belongs athens_slot3 athens)
    (slot_belongs athens_slot4 athens)
    (slot_belongs athens_slot5 athens)

    (slot_belongs mykonos_slot1 mykonos)
    (slot_belongs mykonos_slot2 mykonos)
    (slot_belongs mykonos_slot3 mykonos)
    (slot_belongs mykonos_slot4 mykonos)

    ;; slots initially unassigned except the one used for day1
    (slot_unassigned stockholm_slot2)
    (slot_unassigned stockholm_slot3)
    (slot_unassigned stockholm_slot4)
    (slot_unassigned stockholm_slot5)
    (slot_unassigned stockholm_slot6)

    (slot_unassigned athens_slot1)
    (slot_unassigned athens_slot2)
    (slot_unassigned athens_slot3)
    (slot_unassigned athens_slot4)
    (slot_unassigned athens_slot5)

    (slot_unassigned mykonos_slot1)
    (slot_unassigned mykonos_slot2)
    (slot_unassigned mykonos_slot3)
    (slot_unassigned mykonos_slot4)

    ;; bookkeeping: day1 already assigned to stockholm_slot1
    (slot_assigned stockholm_slot1 day1)
  )

  (:goal (and
    ;; conference constraint: must be in stockholm on day6
    (at stockholm day6)

    ;; quotas (hard constraints): require all slots to be filled
    ;; Stockholm: 6 days total (6 slots)
    (slot_assigned stockholm_slot1 day1)
    (slot_assigned stockholm_slot2 ?d)  ;; universally require these slots be assigned (planner must fill them)
    (slot_assigned stockholm_slot3 ?d)
    (slot_assigned stockholm_slot4 ?d)
    (slot_assigned stockholm_slot5 ?d)
    (slot_assigned stockholm_slot6 ?d)

    ;; Athens: 5 days total
    (slot_assigned athens_slot1 ?d)
    (slot_assigned athens_slot2 ?d)
    (slot_assigned athens_slot3 ?d)
    (slot_assigned athens_slot4 ?d)
    (slot_assigned athens_slot5 ?d)

    ;; Mykonos: 4 days total
    (slot_assigned mykonos_slot1 ?d)
    (slot_assigned mykonos_slot2 ?d)
    (slot_assigned mykonos_slot3 ?d)
    (slot_assigned mykonos_slot4 ?d)
  )))