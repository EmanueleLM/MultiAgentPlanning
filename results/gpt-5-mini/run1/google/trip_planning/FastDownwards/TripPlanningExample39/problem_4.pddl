(define (problem trip_porto_barcelona_florence)
  (:domain trip_planning_instance)

  (:objects
    porto barcelona florence - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day

    porto_token_1 porto_token_2 porto_token_3
    barcelona_token_1 barcelona_token_2 barcelona_token_3 barcelona_token_4 barcelona_token_5 barcelona_token_6 barcelona_token_7
    florence_token_1 florence_token_2 florence_token_3 florence_token_4 - token
  )

  (:init
    ; all days start unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)

    ; day order (static)
    (day_succ day1 day2)
    (day_succ day2 day3)
    (day_succ day3 day4)
    (day_succ day4 day5)
    (day_succ day5 day6)
    (day_succ day6 day7)
    (day_succ day7 day8)
    (day_succ day8 day9)
    (day_succ day9 day10)
    (day_succ day10 day11)
    (day_succ day11 day12)

    ; mark the first day
    (first_day day1)

    ; early-window marker for days 1..3 (relatives must be visited between day1 and day3)
    (day_is_early day1)
    (day_is_early day2)
    (day_is_early day3)

    ; direct flights (as provided; modelled symmetric)
    (flight porto barcelona)
    (flight barcelona porto)
    (flight barcelona florence)
    (flight florence barcelona)

    ; tokens available to enforce per-city day counts from the specification
    ; NOTE: specification requests porto=3, barcelona=7, florence=4 (total 14) while trip length is 12 days.
    ; This creates a contradictory specification; the encoding preserves the contradiction so the solver
    ; will correctly report no plan exists.
    (token_available porto_token_1)
    (token_available porto_token_2)
    (token_available porto_token_3)

    (token_available barcelona_token_1)
    (token_available barcelona_token_2)
    (token_available barcelona_token_3)
    (token_available barcelona_token_4)
    (token_available barcelona_token_5)
    (token_available barcelona_token_6)
    (token_available barcelona_token_7)

    (token_available florence_token_1)
    (token_available florence_token_2)
    (token_available florence_token_3)
    (token_available florence_token_4)

    ; token ownership (which city each token represents)
    (token_of porto_token_1 porto)
    (token_of porto_token_2 porto)
    (token_of porto_token_3 porto)

    (token_of barcelona_token_1 barcelona)
    (token_of barcelona_token_2 barcelona)
    (token_of barcelona_token_3 barcelona)
    (token_of barcelona_token_4 barcelona)
    (token_of barcelona_token_5 barcelona)
    (token_of barcelona_token_6 barcelona)
    (token_of barcelona_token_7 barcelona)

    (token_of florence_token_1 florence)
    (token_of florence_token_2 florence)
    (token_of florence_token_3 florence)
    (token_of florence_token_4 florence)
  )

  (:goal
    (and
      ; require consumption of all per-city tokens to enforce the requested day counts
      (token_used porto_token_1)
      (token_used porto_token_2)
      (token_used porto_token_3)

      (token_used barcelona_token_1)
      (token_used barcelona_token_2)
      (token_used barcelona_token_3)
      (token_used barcelona_token_4)
      (token_used barcelona_token_5)
      (token_used barcelona_token_6)
      (token_used barcelona_token_7)

      (token_used florence_token_1)
      (token_used florence_token_2)
      (token_used florence_token_3)
      (token_used florence_token_4)

      ; relatives must be visited between day1 and day3
      (relatives_visited)
    )
  )
)