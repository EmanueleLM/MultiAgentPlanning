(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    amsterdam istanbul santorini - city
    a1 a2 a3 a4 a5 a6 a7 - amstoken
  )

  (:init
    ;; direct flight network (directed edges)
    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct amsterdam istanbul)
    (direct istanbul amsterdam)

    ;; available Amsterdam assignment tokens (limit Amsterdam to 7 days)
    (available_amsterdam_token a1)
    (available_amsterdam_token a2)
    (available_amsterdam_token a3)
    (available_amsterdam_token a4)
    (available_amsterdam_token a5)
    (available_amsterdam_token a6)
    (available_amsterdam_token a7)
  )

  ;; Goals enforce hard constraints:
  ;; - every day is assigned
  ;; - Santorini specifically on days 12-14 (hard)
  ;; - all 7 Amsterdam tokens must be consumed (forcing exactly 7 Amsterdam assignments)
  (:goal
    (and
      ;; each day must be assigned
      (assigned day1) (assigned day2) (assigned day3) (assigned day4)
      (assigned day5) (assigned day6) (assigned day7) (assigned day8)
      (assigned day9) (assigned day10) (assigned day11) (assigned day12)
      (assigned day13) (assigned day14)

      ;; Santorini must be on days 12-14 (hard constraint)
      (at day12 santorini)
      (at day13 santorini)
      (at day14 santorini)

      ;; All Amsterdam tokens must be consumed, enforcing exactly 7 Amsterdam-day assignments
      (consumed_amsterdam_token a1)
      (consumed_amsterdam_token a2)
      (consumed_amsterdam_token a3)
      (consumed_amsterdam_token a4)
      (consumed_amsterdam_token a5)
      (consumed_amsterdam_token a6)
      (consumed_amsterdam_token a7)
    )
  )
)