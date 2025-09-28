(define (problem trip-11-days)
  (:domain travel-multicity)
  (:objects
    amsterdam vilnius bucharest - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    (at amsterdam)
    (at-day day0)
    ;; No done_* predicates initially; staying actions will produce them.
  )
  (:goal (and
    done_amsterdam_1
    done_amsterdam_2
    done_amsterdam_3
    done_amsterdam_4
    done_amsterdam_5
    done_vilnius_1
    done_vilnius_2
    done_bucharest_1
    done_bucharest_2
    done_bucharest_3
    done_bucharest_4
    met
    (at-day day11)
  ))
)