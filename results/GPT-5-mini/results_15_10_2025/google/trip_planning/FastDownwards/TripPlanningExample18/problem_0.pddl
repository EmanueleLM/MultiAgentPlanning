(define (problem travel_problem_multiagent)
  (:domain travel_multiagent)
  (:objects
    amsterdam vilnius bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    ;; Direct flight connections (only those explicitly provided)
    (connected amsterdam bucharest)
    (connected bucharest amsterdam)
    (connected vilnius amsterdam)
    (connected amsterdam vilnius)

    ;; Day succession (11-day horizon)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; Starting condition: traveler begins in Amsterdam on day1 (consistent with requested Amsterdam stay)
    (at amsterdam day1)
    (occupied day1)
  )

  ;; Goals encode the hard constraints supplied by agents:
  ;; - Entire trip must occupy days 1..11 (total trip duration constraint)
  ;; - Requested stays per city are encoded as presence on specific days (treated as strict requirements)
  ;; - Meeting in Bucharest is required between day6 and day11 (earliest feasible day is day6)
  ;;
  ;; NOTE: The requested stays sum to 13 days (5 + 2 + 6) while the horizon is 11 days;
  ;; the goal below intentionally encodes the conflicting hard constraints (no silent shortening).
  (:goal (and
    ;; total-trip occupancy
    (occupied day1) (occupied day2) (occupied day3) (occupied day4) (occupied day5)
    (occupied day6) (occupied day7) (occupied day8) (occupied day9) (occupied day10)
    (occupied day11)

    ;; Requested stays (encoded as presence on fixed days to enforce counts)
    ;; Amsterdam: 5 days -> encode days 1-5
    (at amsterdam day1)
    (at amsterdam day2)
    (at amsterdam day3)
    (at amsterdam day4)
    (at amsterdam day5)

    ;; Vilnius: 2 days -> encode days 6-7
    (at vilnius day6)
    (at vilnius day7)

    ;; Bucharest: 6 days -> encode days 6-11 (this overlaps with Vilnius day6-7 and thus causes the conflict)
    ;; Also satisfies "meet friends in Bucharest between day6 and day11" (day6 earliest)
    (at bucharest day6)
    (at bucharest day7)
    (at bucharest day8)
    (at bucharest day9)
    (at bucharest day10)
    (at bucharest day11)
  ))
)