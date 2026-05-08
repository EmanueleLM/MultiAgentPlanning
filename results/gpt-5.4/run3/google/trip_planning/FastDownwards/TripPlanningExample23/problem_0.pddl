(define (problem european_trip_8_days_instance_problem)
  (:domain european_trip_8_days_instance)

  (:objects
    london bucharest riga - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 - timepoint

    day1 day2 day3 day4 day5 day6 day7 day8 - dayslot

    c0 c1 c2 c3 c4 - count
  )

  (:init
    (at london)
    (current_tp d1)

    (next_tp d1 d2)
    (next_tp d2 d3)
    (next_tp d3 d4)
    (next_tp d4 d5)
    (next_tp d5 d6)
    (next_tp d6 d7)
    (next_tp d7 d8)
    (next_tp d8 d9)

    (tp_slot d1 day1)
    (tp_slot d2 day2)
    (tp_slot d3 day3)
    (tp_slot d4 day4)
    (tp_slot d5 day5)
    (tp_slot d6 day6)
    (tp_slot d7 day7)
    (tp_slot d8 day8)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (slot_free day1)
    (slot_free day2)
    (slot_free day3)
    (slot_free day4)
    (slot_free day5)
    (slot_free day6)
    (slot_free day7)
    (slot_free day8)

    (workshop_day day5)
    (workshop_day day6)
    (workshop_day day7)
    (workshop_day day8)

    (next_count_london c0 c1)
    (next_count_london c1 c2)
    (next_count_london c2 c3)

    (next_count_bucharest c0 c1)
    (next_count_bucharest c1 c2)
    (next_count_bucharest c2 c3)

    (next_count_riga c0 c1)
    (next_count_riga c1 c2)
    (next_count_riga c2 c3)
    (next_count_riga c3 c4)

    (london_count c0)
    (bucharest_count c0)
    (riga_count c0)
  )

  (:goal
    (and
      (current_tp d9)
      (london_count c3)
      (bucharest_count c3)
      (riga_count c4)
      (workshop_satisfied)
    )
  )
)