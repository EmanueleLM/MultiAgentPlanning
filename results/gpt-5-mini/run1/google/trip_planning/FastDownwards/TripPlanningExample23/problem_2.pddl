(define (problem trip_planning_instance)
  (:domain trip_planning)

  (:objects
    ;; cities
    london bucharest riga - city

    ;; calendar days
    day1 day2 day3 day4 day5 day6 day7 day8 - day

    ;; tokens encoding requested stays:
    ;; London: 3 tokens
    london_tok1 london_tok2 london_tok3
    ;; Bucharest: 3 tokens
    bucharest_tok1 bucharest_tok2 bucharest_tok3
    ;; Riga: 4 tokens
    riga_tok1 riga_tok2 riga_tok3 riga_tok4 - token
  )

  (:init
    ;; direct flight connectivity (only direct flights allowed)
    (flight london bucharest)
    (flight bucharest london)
    (flight bucharest riga)
    (flight riga bucharest)

    ;; day ordering
    (first day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ;; Workshop window: days 5..8 inclusive are valid workshop days
    (workshop_day day5)
    (workshop_day day6)
    (workshop_day day7)
    (workshop_day day8)

    ;; token ownership: link each token to its city
    (token_for london_tok1 london)
    (token_for london_tok2 london)
    (token_for london_tok3 london)

    (token_for bucharest_tok1 bucharest)
    (token_for bucharest_tok2 bucharest)
    (token_for bucharest_tok3 bucharest)

    (token_for riga_tok1 riga)
    (token_for riga_tok2 riga)
    (token_for riga_tok3 riga)
    (token_for riga_tok4 riga)

    ;; all tokens start unused
    (token_unused london_tok1)
    (token_unused london_tok2)
    (token_unused london_tok3)
    (token_unused bucharest_tok1)
    (token_unused bucharest_tok2)
    (token_unused bucharest_tok3)
    (token_unused riga_tok1)
    (token_unused riga_tok2)
    (token_unused riga_tok3)
    (token_unused riga_tok4)
  )

  ;; Goal: encode the user's hard requirements exactly.
  ;; Note: This instance is intentionally inconsistent (requests 10 city-days while only 8 days exist).
  (:goal
    (and
      ;; every calendar day must be assigned a city
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)

      ;; all stay-tokens must be consumed (3 London + 3 Bucharest + 4 Riga = 10 tokens)
      (token_consumed london_tok1)
      (token_consumed london_tok2)
      (token_consumed london_tok3)
      (token_consumed bucharest_tok1)
      (token_consumed bucharest_tok2)
      (token_consumed bucharest_tok3)
      (token_consumed riga_tok1)
      (token_consumed riga_tok2)
      (token_consumed riga_tok3)
      (token_consumed riga_tok4)

      ;; workshop must be attended on some workshop_day (day5..day8) while in Riga
      (attended_workshop)
    )
  )
)