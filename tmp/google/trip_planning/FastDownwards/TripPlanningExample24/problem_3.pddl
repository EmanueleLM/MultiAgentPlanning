(define (problem integrated-itinerary-problem)
  (:domain integrated-itinerary)
  (:objects
    florence amsterdam riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day

    tf1 tf2 tf3 tf4 - tokenf
    ta1 ta2 ta3 ta4 ta5 ta6 - tokena
    tr1 tr2 tr3 tr4 tr5 - tokenr
  )

  (:init
    (is-day day1) (is-day day2) (is-day day3) (is-day day4) (is-day day5) (is-day day6) (is-day day7)
    (is-day day8) (is-day day9) (is-day day10) (is-day day11) (is-day day12) (is-day day13)

    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10) (next day10 day11)
    (next day11 day12) (next day12 day13)

    (free day1) (free day2) (free day3) (free day4) (free day5) (free day6) (free day7)
    (free day8) (free day9) (free day10) (free day11) (free day12) (free day13)

    (flight florence amsterdam) (flight amsterdam florence)
    (flight amsterdam riga) (flight riga amsterdam)

    (is-token tf1) (is-token tf2) (is-token tf3) (is-token tf4)
    (is-token ta1) (is-token ta2) (is-token ta3) (is-token ta4) (is-token ta5) (is-token ta6)
    (is-token tr1) (is-token tr2) (is-token tr3) (is-token tr4) (is-token tr5)

    (in-workshop-range day1) (in-workshop-range day2) (in-workshop-range day3) (in-workshop-range day4)
  )

  (:goal (and
    (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
    (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)
    (assigned day11) (assigned day12) (assigned day13)

    (consumed tf1) (consumed tf2) (consumed tf3) (consumed tf4)
    (consumed ta1) (consumed ta2) (consumed ta3) (consumed ta4) (consumed ta5) (consumed ta6)
    (consumed tr1) (consumed tr2) (consumed tr3) (consumed tr4) (consumed tr5)

    (workshop-done)

    (visited florence)
    (visited amsterdam)
    (visited riga)
  ))
)