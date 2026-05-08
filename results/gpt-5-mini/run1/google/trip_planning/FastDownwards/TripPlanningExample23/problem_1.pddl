(define (problem trip_planning_instance)
  (:domain trip_planning)
  (:objects
    london bucharest riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    london_tok1 london_tok2 london_tok3
    bucharest_tok1 bucharest_tok2 bucharest_tok3
    riga_tok1 riga_tok2 riga_tok3 riga_tok4 - token
  )

  (:init
    ;; Flight connectivity (direct flights only as given)
    (flight london bucharest)
    (flight bucharest london)
    (flight bucharest riga)
    (flight riga bucharest)

    ;; Day ordering
    (first day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ;; Workshop window: days 5..8 inclusive
    (workshop_day day5)
    (workshop_day day6)
    (workshop_day day7)
    (workshop_day day8)

    ;; Tokens: one per required day of stay per city (these encode the hard stay-count requirements)
    ;; London: 3 tokens
    (token_for london_tok1 london)
    (token_for london_tok2 london)
    (token_for london_tok3 london)
    ;; Bucharest: 3 tokens
    (token_for bucharest_tok1 bucharest)
    (token_for bucharest_tok2 bucharest)
    (token_for bucharest_tok3 bucharest)
    ;; Riga: 4 tokens
    (token_for riga_tok1 riga)
    (token_for riga_tok2 riga)
    (token_for riga_tok3 riga)
    (token_for riga_tok4 riga)

    ;; All tokens start unused
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

  ;; Goal encodes the user's hard preferences exactly:
  ;; - all 8 calendar days must be assigned
  ;; - every stay-token must be consumed (3 London + 3 Bucharest + 4 Riga = 10 tokens)
  ;; - the Riga workshop must be attended sometime in days 5..8 (modeled via attended_workshop)
  ;; Note: These goals are jointly inconsistent because they require consuming 10 stay-tokens
  ;; while only 8 days exist; the planner should report no plan.
  (:goal
    (and
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)

      ;; all tokens consumed (hard stay-count requirements)
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

      ;; workshop attended between day5 and day8 (enforced by mark_workshop action)
      (attended_workshop)
    )
  )
)