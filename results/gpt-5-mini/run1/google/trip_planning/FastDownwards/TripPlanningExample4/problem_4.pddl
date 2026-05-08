(define (problem trip_planning_example4)
  (:domain direct_flight_itinerary)

  ; Assumptions (explicit):
  ; - Days are discrete objects day1..day12. Travel happens between successive days.
  ; - Direct flights are only those given in the connectivity list below (bidirectional edges listed).
  ; - "free" marks days that have not yet been assigned a city; day1 is initially assigned (not free).
  ; - The traveler's stated hard requirements are encoded exactly in the goal (they are contradictory).
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    seville munich tallinn - city
  )

  (:init
    ; successor (consecutive days)
    (suc day1 day2) (suc day2 day3) (suc day3 day4) (suc day4 day5)
    (suc day5 day6) (suc day6 day7) (suc day7 day8) (suc day8 day9)
    (suc day9 day10) (suc day10 day11) (suc day11 day12)

    ; direct flight connectivity (bidirectional)
    (edge seville munich)
    (edge munich seville)
    (edge munich tallinn)
    (edge tallinn munich)

    ; starting location: traveler begins in Seville on day1
    (at day1 seville)

    ; days available to assign (day1 already assigned above; remaining days are free)
    (free day2) (free day3) (free day4) (free day5) (free day6)
    (free day7) (free day8) (free day9) (free day10) (free day11) (free day12)
  )

  ; Goal: encode the traveler's stated hard requirements exactly.
  ; - Seville for 7 days: days 1..7 = seville
  ; - Munich for 5 days: days 8..12 = munich
  ; - Tallinn for 2 days (and meeting window): days 11..12 = tallinn
  ; These constraints are contradictory (days 11..12 cannot be both munich and tallinn).
  (:goal (and
    ; Seville days 1..7
    (at day1 seville) (at day2 seville) (at day3 seville)
    (at day4 seville) (at day5 seville) (at day6 seville) (at day7 seville)

    ; Munich days 8..12
    (at day8 munich) (at day9 munich) (at day10 munich)
    (at day11 munich) (at day12 munich)

    ; Tallinn meeting window / Tallinn 2 days (days 11..12)
    (at day11 tallinn) (at day12 tallinn)
  ))
)