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
    (start)
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

    (show-day day1)
    (show-day day2)
    (show-day day3)
    (show-day day4)
    (show-day day5)
    (show-day day6)
    (show-day day7)

    (flight berlin frankfurt)
    (flight frankfurt berlin)
    (flight frankfurt bucharest)
    (flight bucharest frankfurt)

    (slot-for ber_slot_1 berlin)
    (slot-for ber_slot_2 berlin)
    (slot-for ber_slot_3 berlin)
    (slot-for ber_slot_4 berlin)
    (slot-for ber_slot_5 berlin)
    (slot-for ber_slot_6 berlin)
    (slot-for ber_slot_7 berlin)

    (slot-for fra_slot_1 frankfurt)
    (slot-for fra_slot_2 frankfurt)
    (slot-for fra_slot_3 frankfurt)
    (slot-for fra_slot_4 frankfurt)

    (slot-for buc_slot_1 bucharest)
    (slot-for buc_slot_2 bucharest)

    (is-berlin berlin)

    (= (total-cost) 0)
  )
  (:goal
    (and
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

      (visited berlin)
      (visited frankfurt)
      (visited bucharest)

      (show-satisfied day1)
      (show-satisfied day2)
      (show-satisfied day3)
      (show-satisfied day4)
      (show-satisfied day5)
      (show-satisfied day6)
      (show-satisfied day7)

      (slot-satisfied ber_slot_1)
      (slot-satisfied ber_slot_2)
      (slot-satisfied ber_slot_3)
      (slot-satisfied ber_slot_4)
      (slot-satisfied ber_slot_5)
      (slot-satisfied ber_slot_6)
      (slot-satisfied ber_slot_7)

      (slot-satisfied fra_slot_1)
      (slot-satisfied fra_slot_2)
      (slot-satisfied fra_slot_3)
      (slot-satisfied fra_slot_4)

      (slot-satisfied buc_slot_1)
      (slot-satisfied buc_slot_2)
    )
  )
  (:metric minimize (total-cost))
)