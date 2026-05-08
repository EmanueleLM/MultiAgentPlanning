(define (problem trip_planning_instance)
  (:domain trip_planning)

  (:objects
    london bucharest riga - city

    day1 day2 day3 day4 day5 day6 day7 day8 - day

    london_tok1 london_tok2 london_tok3
    bucharest_tok1 bucharest_tok2 bucharest_tok3
    riga_tok1 riga_tok2 - token
  )

  (:init
    (flight london bucharest)
    (flight bucharest london)
    (flight bucharest riga)
    (flight riga bucharest)

    (first day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    (workshop_day day5)
    (workshop_day day6)
    (workshop_day day7)
    (workshop_day day8)

    (token_for london_tok1 london)
    (token_for london_tok2 london)
    (token_for london_tok3 london)

    (token_for bucharest_tok1 bucharest)
    (token_for bucharest_tok2 bucharest)
    (token_for bucharest_tok3 bucharest)

    (token_for riga_tok1 riga)
    (token_for riga_tok2 riga)

    (token_unused london_tok1)
    (token_unused london_tok2)
    (token_unused london_tok3)
    (token_unused bucharest_tok1)
    (token_unused bucharest_tok2)
    (token_unused bucharest_tok3)
    (token_unused riga_tok1)
    (token_unused riga_tok2)
  )

  (:goal
    (and
      (assigned day1) (assigned day2) (assigned day3) (assigned day4)
      (assigned day5) (assigned day6) (assigned day7) (assigned day8)

      (token_consumed london_tok1)
      (token_consumed london_tok2)
      (token_consumed london_tok3)

      (token_consumed bucharest_tok1)
      (token_consumed bucharest_tok2)
      (token_consumed bucharest_tok3)

      (token_consumed riga_tok1)
      (token_consumed riga_tok2)

      (attended_workshop)
    )
  )
)