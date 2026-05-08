(define (problem trip_porto_barcelona_florence)
  (:domain jack_of_all_trades_trip)
  (:objects
    porto barcelona florence - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day

    porto_token_1 porto_token_2 porto_token_3
    barcelona_token_1 barcelona_token_2 barcelona_token_3 barcelona_token_4 barcelona_token_5 barcelona_token_6 barcelona_token_7
    florence_token_1 florence_token_2 florence_token_3 florence_token_4 - token
  )

  (:init
    ; current day
    (current_day day1)

    ; day successor chain (static)
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

    ; flights (direct)
    (flight porto barcelona)
    (flight barcelona porto)
    (flight barcelona florence)
    (flight florence barcelona)

    ; tokens available initially
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

    ; token ownership
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
      ; require all tokens to have been used (enforces exact city-day counts)
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

      ; relatives visit must occur between day1 and day3 (modeled by making assignments on day1..day3 to porto produce this flag)
      (relatives_visited)
    )
  )
)