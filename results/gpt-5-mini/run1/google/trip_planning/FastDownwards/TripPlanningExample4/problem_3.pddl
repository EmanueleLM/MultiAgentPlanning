(define (problem trip_planning_example4)
  (:domain direct_flight_itinerary)

  ; Assumptions (explicit):
  ; - Days are discrete objects day1..day12. Travel happens between successive days.
  ; - Direct flights are only those given in the connectivity list below.
  ; - The traveler's hard preferences from the human specification are encoded verbatim
  ;   in the goal. The resulting instance is intentionally left as given (it contains
  ;   contradictory requirements) to preserve the hard constraints for auditing.

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
  )

  ; Goal: encode the traveler's stated hard requirements exactly.
  ; - Seville for 7 days: days 1..7 = seville
  ; - Munich for 5 days: days 8..12 = munich
  ; - Tallinn for 2 days (and meeting window): days 11..12 = tallinn
  ; Note: these combined constraints are inconsistent (they require contradictory
  ; assignments for days 11 and 12). The instance preserves that contradiction
  ; for auditing purposes instead of silently repairing it.
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