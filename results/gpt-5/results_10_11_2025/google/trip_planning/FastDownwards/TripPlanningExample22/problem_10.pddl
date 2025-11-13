(define (problem trip-11-days-feasible)
  (:domain trip-planning)
  (:objects
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    bel_slot_1 bel_slot_2 bel_slot_3 bel_slot_4 bel_slot_5 bel_slot_6 bel_slot_7 - slot
    fra_slot_1 fra_slot_2 fra_slot_3 fra_slot_4 - slot
    buc_slot_1 buc_slot_2 - slot
  )
  (:init
    (= (total-cost) 0)

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

    (flight berlin frankfurt)
    (flight frankfurt berlin)
    (flight frankfurt bucharest)
    (flight bucharest frankfurt)

    (show-city berlin)

    (show-day day1)
    (show-day day2)
    (show-day day3)
    (show-day day4)
    (show-day day5)
    (show-day day6)
    (show-day day7)

    (unclaimed-slot bel_slot_1)
    (unclaimed-slot bel_slot_2)
    (unclaimed-slot bel_slot_3)
    (unclaimed-slot bel_slot_4)
    (unclaimed-slot bel_slot_5)
    (unclaimed-slot bel_slot_6)
    (unclaimed-slot bel_slot_7)

    (unclaimed-slot fra_slot_1)
    (unclaimed-slot fra_slot_2)
    (unclaimed-slot fra_slot_3)
    (unclaimed-slot fra_slot_4)

    (unclaimed-slot buc_slot_1)
    (unclaimed-slot buc_slot_2)

    (slot-city bel_slot_1 berlin)
    (slot-city bel_slot_2 berlin)
    (slot-city bel_slot_3 berlin)
    (slot-city bel_slot_4 berlin)
    (slot-city bel_slot_5 berlin)
    (slot-city bel_slot_6 berlin)
    (slot-city bel_slot_7 berlin)

    (slot-city fra_slot_1 frankfurt)
    (slot-city fra_slot_2 frankfurt)
    (slot-city fra_slot_3 frankfurt)
    (slot-city fra_slot_4 frankfurt)

    (slot-city buc_slot_1 bucharest)
    (slot-city buc_slot_2 bucharest)
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

      (satisfied-show day1)
      (satisfied-show day2)
      (satisfied-show day3)
      (satisfied-show day4)
      (satisfied-show day5)
      (satisfied-show day6)
      (satisfied-show day7)

      (slot-closed bel_slot_1)
      (slot-closed bel_slot_2)
      (slot-closed bel_slot_3)
      (slot-closed bel_slot_4)
      (slot-closed bel_slot_5)
      (slot-closed bel_slot_6)
      (slot-closed bel_slot_7)

      (slot-closed fra_slot_1)
      (slot-closed fra_slot_2)
      (slot-closed fra_slot_3)
      (slot-closed fra_slot_4)

      (slot-closed buc_slot_1)
      (slot-closed buc_slot_2)
    )
  )
  (:metric minimize (total-cost))
)