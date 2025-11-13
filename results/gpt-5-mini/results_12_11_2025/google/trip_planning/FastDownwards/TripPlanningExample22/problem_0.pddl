(define (problem trip-11days)
  (:domain trip-planning)
  (:objects
    ;; days
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day

    ;; cities
    berlin frankfurt bucharest - city

    ;; berlin slots (7), frankfurt slots (4), bucharest slots (2)
    ber_slot1 ber_slot2 ber_slot3 ber_slot4 ber_slot5 ber_slot6 ber_slot7 - slot
    fra_slot1 fra_slot2 fra_slot3 fra_slot4 - slot
    buc_slot1 buc_slot2 - slot
  )

  (:init
    ;; current pointer at day1
    (current day1)
    (first day1)

    ;; successor relation (explicit)
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

    ;; all days initially unassigned and day-slot-available
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10) (unassigned day11)

    (day-slot-available day1) (day-slot-available day2) (day-slot-available day3)
    (day-slot-available day4) (day-slot-available day5) (day-slot-available day6)
    (day-slot-available day7) (day-slot-available day8) (day-slot-available day9)
    (day-slot-available day10) (day-slot-available day11)

    ;; show days day1..day7
    (show-day day1) (show-day day2) (show-day day3) (show-day day4)
    (show-day day5) (show-day day6) (show-day day7)

    ;; flights (direct, undirected pairs explicitly given)
    (flight berlin frankfurt)
    (flight frankfurt berlin)
    (flight frankfurt bucharest)
    (flight bucharest frankfurt)

    ;; slots belong to cities and are initially unclaimed
    (slot ber_slot1 berlin) (slot ber_slot2 berlin) (slot ber_slot3 berlin)
    (slot ber_slot4 berlin) (slot ber_slot5 berlin) (slot ber_slot6 berlin) (slot ber_slot7 berlin)
    (slot fra_slot1 frankfurt) (slot fra_slot2 frankfurt) (slot fra_slot3 frankfurt) (slot fra_slot4 frankfurt)
    (slot buc_slot1 bucharest) (slot buc_slot2 bucharest)

    (slot-unclaimed ber_slot1) (slot-unclaimed ber_slot2) (slot-unclaimed ber_slot3)
    (slot-unclaimed ber_slot4) (slot-unclaimed ber_slot5) (slot-unclaimed ber_slot6) (slot-unclaimed ber_slot7)
    (slot-unclaimed fra_slot1) (slot-unclaimed fra_slot2) (slot-unclaimed fra_slot3) (slot-unclaimed fra_slot4)
    (slot-unclaimed buc_slot1) (slot-unclaimed buc_slot2)

    ;; total-cost starts at 0
    (= (total-cost) 0)
  )

  ;; Goal: all days have been assigned (i.e., no day remains unassigned),
  ;; each city visited at least once, every show day handled (attended or waived),
  ;; and every slot handled (claimed or waived). Minimize total-cost.
  (:goal (and
    ;; all 11 days assigned -> represented by not unassigned(day)
    (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3))
    (not (unassigned day4)) (not (unassigned day5)) (not (unassigned day6))
    (not (unassigned day7)) (not (unassigned day8)) (not (unassigned day9))
    (not (unassigned day10)) (not (unassigned day11))

    ;; visit all cities at least once
    (visited berlin) (visited frankfurt) (visited bucharest)

    ;; every show day must be handled (either attended or waived) -> show-handled facts
    (show-handled day1) (show-handled day2) (show-handled day3) (show-handled day4)
    (show-handled day5) (show-handled day6) (show-handled day7)

    ;; every slot must be handled (claimed or waived) -> slot-handled facts
    (slot-handled ber_slot1) (slot-handled ber_slot2) (slot-handled ber_slot3)
    (slot-handled ber_slot4) (slot-handled ber_slot5) (slot-handled ber_slot6) (slot-handled ber_slot7)
    (slot-handled fra_slot1) (slot-handled fra_slot2) (slot-handled fra_slot3) (slot-handled fra_slot4)
    (slot-handled buc_slot1) (slot-handled buc_slot2)
  ))

  (:metric minimize (total-cost))
)