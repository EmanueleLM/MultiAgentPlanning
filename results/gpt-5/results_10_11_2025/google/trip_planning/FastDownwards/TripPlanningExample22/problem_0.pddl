(define (problem trip-11-days)
  (:domain trip-planning)
  (:objects
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    ber_slot_1 ber_slot_2 ber_slot_3 ber_slot_4 ber_slot_5 ber_slot_6 ber_slot_7 - slot
    fra_slot_1 fra_slot_2 fra_slot_3 fra_slot_4 - slot
    buc_slot_1 buc_slot_2 - slot
  )
  (:init
    ; timeline
    (current-day day1)
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

    ; all days initially unassigned and can claim once
    (unassigned day1)
    (unassigned day2)
    (unassigned day3)
    (unassigned day4)
    (unassigned day5)
    (unassigned day6)
    (unassigned day7)
    (unassigned day8)
    (unassigned day9)
    (unassigned day10)
    (unassigned day11)

    (claim-open day1)
    (claim-open day2)
    (claim-open day3)
    (claim-open day4)
    (claim-open day5)
    (claim-open day6)
    (claim-open day7)
    (claim-open day8)
    (claim-open day9)
    (claim-open day10)
    (claim-open day11)

    ; show days (Berlin show)
    (show-day day1)
    (show-day day2)
    (show-day day3)
    (show-day day4)
    (show-day day5)
    (show-day day6)
    (show-day day7)

    ; direct flights (only)
    (flight berlin frankfurt)
    (flight frankfurt berlin)
    (flight frankfurt bucharest)
    (flight bucharest frankfurt)

    ; initially any start city is allowed
    (allowed berlin)
    (allowed frankfurt)
    (allowed bucharest)

    ; slot types
    (ber-slot ber_slot_1)
    (ber-slot ber_slot_2)
    (ber-slot ber_slot_3)
    (ber-slot ber_slot_4)
    (ber-slot ber_slot_5)
    (ber-slot ber_slot_6)
    (ber-slot ber_slot_7)

    (fra-slot fra_slot_1)
    (fra-slot fra_slot_2)
    (fra-slot fra_slot_3)
    (fra-slot fra_slot_4)

    (buc-slot buc_slot_1)
    (buc-slot buc_slot_2)

    (= (total-cost) 0)
  )
  (:goal
    (and
      ; all days assigned
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)
      (assigned day9)
      (assigned day10)
      (assigned day11)

      ; must visit all cities at least once
      (visited berlin)
      (visited frankfurt)
      (visited bucharest)

      ; each show day is either attended or waived (captured via show-covered)
      (show-covered day1)
      (show-covered day2)
      (show-covered day3)
      (show-covered day4)
      (show-covered day5)
      (show-covered day6)
      (show-covered day7)

      ; each requested city-day slot is either claimed or waived
      (slot-covered ber_slot_1)
      (slot-covered ber_slot_2)
      (slot-covered ber_slot_3)
      (slot-covered ber_slot_4)
      (slot-covered ber_slot_5)
      (slot-covered ber_slot_6)
      (slot-covered ber_slot_7)

      (slot-covered fra_slot_1)
      (slot-covered fra_slot_2)
      (slot-covered fra_slot_3)
      (slot-covered fra_slot_4)

      (slot-covered buc_slot_1)
      (slot-covered buc_slot_2)
    )
  )
  (:metric (minimize (total-cost)))
)