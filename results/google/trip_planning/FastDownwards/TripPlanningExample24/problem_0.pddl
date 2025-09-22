(define (problem integrated-itinerary-problem)
  (:domain integrated-itinerary)
  (:objects
    florence amsterdam riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day

    ;; Tokens: Florence 4, Amsterdam 4 (adjusted to make total 13), Riga 5
    tf1 tf2 tf3 tf4 - tokenf
    ta1 ta2 ta3 ta4 - tokena
    tr1 tr2 tr3 tr4 tr5 - tokenr
  )

  (:init
    ;; Days
    (day day1) (day day2) (day day3) (day day4) (day day5) (day day6) (day day7)
    (day day8) (day day9) (day day10) (day day11) (day day12) (day day13)

    ;; Sequential next relation (traveler forward relation)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10) (next day10 day11)
    (next day11 day12) (next day12 day13)

    ;; earlier-of relation (flight planner day bookkeeping: prev is earlier than next)
    (earlier-of day1 day2) (earlier-of day2 day3) (earlier-of day3 day4) (earlier-of day4 day5)
    (earlier-of day5 day6) (earlier-of day6 day7) (earlier-of day7 day8) (earlier-of day8 day9)
    (earlier-of day9 day10) (earlier-of day10 day11) (earlier-of day11 day12) (earlier-of day12 day13)

    ;; Initially, all traveler days are free (unassigned)
    (free day1) (free day2) (free day3) (free day4) (free day5) (free day6) (free day7)
    (free day8) (free day9) (free day10) (free day11) (free day12) (free day13)

    ;; Flights / Direct connections (both predicates included so traveler and flight planners see them)
    (flight florence amsterdam) (flight amsterdam florence)
    (flight amsterdam riga) (flight riga amsterdam)

    (direct florence amsterdam) (direct amsterdam florence)
    (direct amsterdam riga) (direct riga amsterdam)

    ;; Tokens available (represent desired stays per city)
    (token tf1) (token tf2) (token tf3) (token tf4)
    (token ta1) (token ta2) (token ta3) (token ta4)
    (token tr1) (token tr2) (token tr3) (token tr4) (token tr5)

    ;; Flight-planner initial location and visited status
    (at florence)
    (visited florence)

    ;; Day bookkeeping for flight planner: start with day13 available
    (day-now day13)

    ;; Days eligible for the Florence workshop (day1..day4)
    (in-workshop-range day1) (in-workshop-range day2) (in-workshop-range day3) (in-workshop-range day4)
  )

  (:goal (and
    ;; Traveler goals: all days assigned
    (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
    (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)
    (assigned day11) (assigned day12) (assigned day13)

    ;; All tokens must be consumed to match requested per-city stays
    (consumed tf1) (consumed tf2) (consumed tf3) (consumed tf4)
    (consumed ta1) (consumed ta2) (consumed ta3) (consumed ta4)
    (consumed tr1) (consumed tr2) (consumed tr3) (consumed tr4) (consumed tr5)

    ;; Workshop must be attended in Florence between day1 and day4 (action effects set workshop-done)
    (workshop-done)

    ;; Flight planner goals: all three cities visited via direct flights
    (visited florence)
    (visited amsterdam)
    (visited riga)
  ))
)