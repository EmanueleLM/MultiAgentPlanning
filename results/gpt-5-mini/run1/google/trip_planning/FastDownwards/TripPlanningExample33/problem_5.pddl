(define (problem trip13)
  (:domain trip_planning)

  (:objects
    krakow rome barcelona - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day

    krakow_tok1 krakow_tok2 krakow_tok3 krakow_tok4
    rome_tok1 rome_tok2 rome_tok3 rome_tok4
    barcelona_tok1 barcelona_tok2 barcelona_tok3 barcelona_tok4 barcelona_tok5 barcelona_tok6 barcelona_tok7
    - token
  )

  (:init
    ; successor (ordered) days
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)

    ; direct flights (bidirectional where specified)
    (flight barcelona krakow)
    (flight krakow barcelona)
    (flight rome barcelona)
    (flight barcelona rome)

    ; associate tokens to their cities (reflects requested day counts per city)
    (token_city krakow_tok1 krakow)
    (token_city krakow_tok2 krakow)
    (token_city krakow_tok3 krakow)
    (token_city krakow_tok4 krakow)

    (token_city rome_tok1 rome)
    (token_city rome_tok2 rome)
    (token_city rome_tok3 rome)
    (token_city rome_tok4 rome)

    (token_city barcelona_tok1 barcelona)
    (token_city barcelona_tok2 barcelona)
    (token_city barcelona_tok3 barcelona)
    (token_city barcelona_tok4 barcelona)
    (token_city barcelona_tok5 barcelona)
    (token_city barcelona_tok6 barcelona)
    (token_city barcelona_tok7 barcelona)

    ; meeting window: friend must be met in krakow between day10 and day13 (inclusive)
    (meet_window day10) (meet_window day11) (meet_window day12) (meet_window day13)
  )

  ; Goal preserves the hard constraints from the specification:
  ; - consume all city-day tokens (krakow:4, rome:4, barcelona:7)
  ; - meet the friend during the allowed window
  ; Note: the token totals sum to 15 while the trip has only 13 days; this instance is inconsistent.
  (:goal (and
    (token_used krakow_tok1) (token_used krakow_tok2) (token_used krakow_tok3) (token_used krakow_tok4)
    (token_used rome_tok1) (token_used rome_tok2) (token_used rome_tok3) (token_used rome_tok4)
    (token_used barcelona_tok1) (token_used barcelona_tok2) (token_used barcelona_tok3)
    (token_used barcelona_tok4) (token_used barcelona_tok5) (token_used barcelona_tok6) (token_used barcelona_tok7)
    (met_friend)
  ))
)