(define (problem trip_plan_instance)
  (:domain jack_of_all_trades_trip)
  (:objects
    seville manchester stockholm - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    seville_s1 seville_s2 seville_s3 seville_s4 seville_s5
    manchester_s1 manchester_s2 manchester_s3 manchester_s4 manchester_s5
    stockholm_s1 stockholm_s2 stockholm_s3 - slot
  )

  (:init
    ;; next_day chain
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

    ;; flights (only explicitly provided direct flights)
    (flight manchester seville)
    (flight seville manchester)
    (flight stockholm manchester)
    (flight manchester stockholm)

    ;; initial location fixed for conference days (structural constraints)
    (at stockholm day1)
    (at stockholm day3)

    ;; free_day for all days except those fixed to stockholm (day1 and day3)
    (free_day day2)
    (free_day day4)
    (free_day day5)
    (free_day day6)
    (free_day day7)
    (free_day day8)
    (free_day day9)
    (free_day day10)
    (free_day day11)

    ;; day_unallocated true for every day (including day1 and day3)
    (day_unallocated day1)
    (day_unallocated day2)
    (day_unallocated day3)
    (day_unallocated day4)
    (day_unallocated day5)
    (day_unallocated day6)
    (day_unallocated day7)
    (day_unallocated day8)
    (day_unallocated day9)
    (day_unallocated day10)
    (day_unallocated day11)

    ;; all slots initially free
    (slot_free seville_s1)
    (slot_free seville_s2)
    (slot_free seville_s3)
    (slot_free seville_s4)
    (slot_free seville_s5)

    (slot_free manchester_s1)
    (slot_free manchester_s2)
    (slot_free manchester_s3)
    (slot_free manchester_s4)
    (slot_free manchester_s5)

    (slot_free stockholm_s1)
    (slot_free stockholm_s2)
    (slot_free stockholm_s3)

    ;; static slot_of mappings
    (slot_of seville_s1 seville)
    (slot_of seville_s2 seville)
    (slot_of seville_s3 seville)
    (slot_of seville_s4 seville)
    (slot_of seville_s5 seville)

    (slot_of manchester_s1 manchester)
    (slot_of manchester_s2 manchester)
    (slot_of manchester_s3 manchester)
    (slot_of manchester_s4 manchester)
    (slot_of manchester_s5 manchester)

    (slot_of stockholm_s1 stockholm)
    (slot_of stockholm_s2 stockholm)
    (slot_of stockholm_s3 stockholm)
  )

  (:goal
    (and
      ;; every day must be assigned (free_day must be consumed for every day)
      (not (free_day day1))
      (not (free_day day2))
      (not (free_day day3))
      (not (free_day day4))
      (not (free_day day5))
      (not (free_day day6))
      (not (free_day day7))
      (not (free_day day8))
      (not (free_day day9))
      (not (free_day day10))
      (not (free_day day11))

      ;; all city quota slots must be filled (hard requirements)
      (filled seville_s1)
      (filled seville_s2)
      (filled seville_s3)
      (filled seville_s4)
      (filled seville_s5)

      (filled manchester_s1)
      (filled manchester_s2)
      (filled manchester_s3)
      (filled manchester_s4)
      (filled manchester_s5)

      (filled stockholm_s1)
      (filled stockholm_s2)
      (filled stockholm_s3)
    )
  )
)