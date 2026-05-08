(define (problem trip13)
  (:domain jack_of_all_trades_trip)

  (:objects
    krakow rome barcelona - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day

    krakow_token1 krakow_token2 krakow_token3 krakow_token4
    rome_token1 rome_token2 rome_token3 rome_token4
    barcelona_token1 barcelona_token2 barcelona_token3 barcelona_token4 barcelona_token5 barcelona_token6 barcelona_token7
    - token
  )

  (:init
    ;; successor relations
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)

    ;; flights (only direct flights provided)
    (flight barcelona krakow)
    (flight krakow barcelona)
    (flight rome barcelona)
    (flight barcelona rome)

    ;; all days start unassigned
    (day_unassigned day1) (day_unassigned day2) (day_unassigned day3)
    (day_unassigned day4) (day_unassigned day5) (day_unassigned day6)
    (day_unassigned day7) (day_unassigned day8) (day_unassigned day9)
    (day_unassigned day10) (day_unassigned day11) (day_unassigned day12)
    (day_unassigned day13)

    ;; krakow tokens (4 days planned in krakow)
    (token_city krakow_token1 krakow) (token_available krakow_token1)
    (token_city krakow_token2 krakow) (token_available krakow_token2)
    (token_city krakow_token3 krakow) (token_available krakow_token3)
    (token_city krakow_token4 krakow) (token_available krakow_token4)

    ;; rome tokens (4 days planned in rome)
    (token_city rome_token1 rome) (token_available rome_token1)
    (token_city rome_token2 rome) (token_available rome_token2)
    (token_city rome_token3 rome) (token_available rome_token3)
    (token_city rome_token4 rome) (token_available rome_token4)

    ;; barcelona tokens (7 days planned in barcelona)
    (token_city barcelona_token1 barcelona) (token_available barcelona_token1)
    (token_city barcelona_token2 barcelona) (token_available barcelona_token2)
    (token_city barcelona_token3 barcelona) (token_available barcelona_token3)
    (token_city barcelona_token4 barcelona) (token_available barcelona_token4)
    (token_city barcelona_token5 barcelona) (token_available barcelona_token5)
    (token_city barcelona_token6 barcelona) (token_available barcelona_token6)
    (token_city barcelona_token7 barcelona) (token_available barcelona_token7)
  )

  ;; Goal: enforce the exact per-city day counts (as hard constraints) and that the meeting in krakow
  ;; occurs between day10 and day13. Note: the specified per-city days sum to 15 while total days are 13;
  ;; this encodes the original (inconsistent) specification faithfully. The problem is therefore
  ;; expected to be unsolvable, but the model preserves the stated hard constraints.
  (:goal (and
    ;; require that every stay token has been used (enforces exact per-city day counts)
    (token_used krakow_token1) (token_used krakow_token2) (token_used krakow_token3) (token_used krakow_token4)
    (token_used rome_token1) (token_used rome_token2) (token_used rome_token3) (token_used rome_token4)
    (token_used barcelona_token1) (token_used barcelona_token2) (token_used barcelona_token3)
    (token_used barcelona_token4) (token_used barcelona_token5) (token_used barcelona_token6) (token_used barcelona_token7)

    ;; require meeting with the friend in krakow between day10 and day13
    (met_friend)
  ))
)