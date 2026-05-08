(define (problem trip_plan_instance)
  (:domain jack_of_all_trades_instance)
  (:objects
    frankfurt florence valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    frankfurt_tok_1 frankfurt_tok_2 frankfurt_tok_3 frankfurt_tok_4 frankfurt_tok_5
    florence_tok_1 florence_tok_2 florence_tok_3 florence_tok_4
    valencia_tok_1 valencia_tok_2 - token
  )

  (:init
    ;; direct flights (both directions as given)
    (direct_flight frankfurt florence)
    (direct_flight florence frankfurt)
    (direct_flight valencia frankfurt)
    (direct_flight frankfurt valencia)

    ;; day order chain
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; tokens available and token_for associations
    (has_token frankfurt_tok_1) (token_for frankfurt_tok_1 frankfurt)
    (has_token frankfurt_tok_2) (token_for frankfurt_tok_2 frankfurt)
    (has_token frankfurt_tok_3) (token_for frankfurt_tok_3 frankfurt)
    (has_token frankfurt_tok_4) (token_for frankfurt_tok_4 frankfurt)
    (has_token frankfurt_tok_5) (token_for frankfurt_tok_5 frankfurt)

    (has_token florence_tok_1) (token_for florence_tok_1 florence)
    (has_token florence_tok_2) (token_for florence_tok_2 florence)
    (has_token florence_tok_3) (token_for florence_tok_3 florence)
    (has_token florence_tok_4) (token_for florence_tok_4 florence)

    (has_token valencia_tok_1) (token_for valencia_tok_1 valencia)
    (has_token valencia_tok_2) (token_for valencia_tok_2 valencia)
  )

  (:goal
    (and
      ;; every day must be assigned
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9)

      ;; visit relatives: occupy valencia on day1 and day2 (hard requirement)
      (at valencia day1)
      (at valencia day2)

      ;; all tokens must be consumed (no has_token facts remain)
      (not (has_token frankfurt_tok_1))
      (not (has_token frankfurt_tok_2))
      (not (has_token frankfurt_tok_3))
      (not (has_token frankfurt_tok_4))
      (not (has_token frankfurt_tok_5))
      (not (has_token florence_tok_1))
      (not (has_token florence_tok_2))
      (not (has_token florence_tok_3))
      (not (has_token florence_tok_4))
      (not (has_token valencia_tok_1))
      (not (has_token valencia_tok_2))
    )
  )
)