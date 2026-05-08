(define (problem tripplanningexample21)
  (:domain european_trip_10_days)

  (:objects
    mykonos vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (current_day day1)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)

    (direct_flight mykonos vienna)
    (direct_flight vienna mykonos)
    (direct_flight vienna venice)
    (direct_flight venice vienna)

    (workshop_day day5)
    (workshop_day day6)
    (workshop_day day7)
    (workshop_day day8)
    (workshop_day day9)
    (workshop_day day10)
  )

  (:goal
    (and
      (trip_finished)
      (workshop_attended)

      (visited mykonos day1)
      (visited mykonos day2)
      (not (visited mykonos day3))
      (not (visited mykonos day4))
      (not (visited mykonos day5))
      (not (visited mykonos day6))
      (not (visited mykonos day7))
      (not (visited mykonos day8))
      (not (visited mykonos day9))
      (not (visited mykonos day10))

      (not (visited vienna day1))
      (not (visited vienna day2))
      (visited vienna day3)
      (visited vienna day4)
      (visited vienna day5)
      (visited vienna day6)
      (not (visited vienna day7))
      (not (visited vienna day8))
      (not (visited vienna day9))
      (not (visited vienna day10))

      (not (visited venice day1))
      (not (visited venice day2))
      (not (visited venice day3))
      (not (visited venice day4))
      (not (visited venice day5))
      (visited venice day6)
      (visited venice day7)
      (visited venice day8)
      (visited venice day9)
      (visited venice day10)
    )
  )
)