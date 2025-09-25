(define (problem integrated-trip)
  (:domain integrated-travel)
  (:objects
    istanbul budapest dubrovnik - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )
  (:init
    ;; Flight connectivity (public information)
    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

    (flight istanbul budapest)
    (flight budapest istanbul)
    (flight dubrovnik istanbul)

    ;; Initial days token: 12 days available
    (has-days day12)

    ;; Precomputed decrement relations for visit durations
    ;; decrement5: allows transitions dayN -> dayN-5 for N>=5
    (decrement5 day5 day0)
    (decrement5 day6 day1)
    (decrement5 day7 day2)
    (decrement5 day8 day3)
    (decrement5 day9 day4)
    (decrement5 day10 day5)
    (decrement5 day11 day6)
    (decrement5 day12 day7)

    ;; decrement6: allows transitions dayN -> dayN-6 for N>=6
    (decrement6 day6 day0)
    (decrement6 day7 day1)
    (decrement6 day8 day2)
    (decrement6 day9 day3)
    (decrement6 day10 day4)
    (decrement6 day11 day5)
    (decrement6 day12 day6)

    ;; decrement3: allows transitions dayN -> dayN-3 for N>=3
    (decrement3 day3 day0)
    (decrement3 day4 day1)
    (decrement3 day5 day2)
    (decrement3 day6 day3)
    (decrement3 day7 day4)
    (decrement3 day8 day5)
    (decrement3 day9 day6)
    (decrement3 day10 day7)
    (decrement3 day11 day8)
    (decrement3 day12 day9)
  )

  (:goal (and
           (visited istanbul)
           (visited budapest)
           (visited dubrovnik)
         ))
)