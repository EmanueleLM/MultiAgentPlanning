(define (problem itinerary_problem)
  (:domain itinerary_domain)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
    florence amsterdam riga - city
  )

  (:init
    ;; day ordering
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

    ;; mark the first day
    (first_day day1)

    ;; direct flight connectivity (only direct flights allowed)
    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

    ;; mark which city is Florence for workshop scheduling
    (is_florence florence)

    ;; allowed workshop window: days 1-4 inclusive
    (workshop_window day1)
    (workshop_window day2)
    (workshop_window day3)
    (workshop_window day4)
  )

  ;; Goal encodes the hard constraints and the stated "would like" day allocations.
  ;; NOTE: the stated desired stays (Florence 4, Amsterdam 6, Riga 5) together exceed the total trip length (13).
  ;; This problem intentionally encodes those hard/desired allocations exactly; the instance is therefore unsolvable.
  (:goal
    (and
      ;; Florence mandatory stay: days 1-4 (4 days)
      (in_day day1 florence)
      (in_day day2 florence)
      (in_day day3 florence)
      (in_day day4 florence)

      ;; Amsterdam desired: 6 days (encoded as days 5-10)
      (in_day day5 amsterdam)
      (in_day day6 amsterdam)
      (in_day day7 amsterdam)
      (in_day day8 amsterdam)
      (in_day day9 amsterdam)
      (in_day day10 amsterdam)

      ;; Riga desired: 5 days (encoded as days 9-13) — note overlap with Amsterdam on days 9-10,
      ;; reflecting the user's desires that make the instance infeasible within 13 days.
      (in_day day9 riga)
      (in_day day10 riga)
      (in_day day11 riga)
      (in_day day12 riga)
      (in_day day13 riga)

      ;; workshop must be scheduled within the allowed window while in Florence
      (workshop_held)
    )
  )
)