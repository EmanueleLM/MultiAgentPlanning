(define (problem itinerary_problem)
  (:domain itinerary_domain)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
    florence amsterdam riga - city
  )

  (:init
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
    (next day11 day12)
    (next day12 day13)

    (direct florence amsterdam)
    (direct amsterdam riga)

    ;; mark which city is Florence for the workshop action
    (is_florence florence)

    ;; allowed workshop window: days 1-4 inclusive
    (workshop_window day1)
    (workshop_window day2)
    (workshop_window day3)
    (workshop_window day4)
  )

  (:goal
    (and
      ;; enforce the hard constraints and the chosen itinerary:
      ;; Florence: days 1-4 (workshop must occur within these days)
      (in_day day1 florence)
      (in_day day2 florence)
      (in_day day3 florence)
      (in_day day4 florence)

      ;; Amsterdam: 6 days (days 5-10)
      (in_day day5 amsterdam)
      (in_day day6 amsterdam)
      (in_day day7 amsterdam)
      (in_day day8 amsterdam)
      (in_day day9 amsterdam)
      (in_day day10 amsterdam)

      ;; Riga: remaining days (days 11-13)
      (in_day day11 riga)
      (in_day day12 riga)
      (in_day day13 riga)

      ;; workshop must be scheduled within the allowed window while in Florence
      (workshop_held)
    )
  )
)