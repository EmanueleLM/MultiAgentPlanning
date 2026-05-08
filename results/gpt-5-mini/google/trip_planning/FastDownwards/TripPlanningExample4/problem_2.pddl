(define (problem trip_planning_example4)
  (:domain direct_flight_itinerary)

  ; Assumptions encoded explicitly:
  ; - The traveler's hard preferences are encoded verbatim even though they are mutually inconsistent
  ;   with the total trip length (12 days). This encoding is deliberate: it preserves the hard
  ;   constraints rather than silently repairing them.
  ; - Days are discrete, consecutive objects day1..day12. Travel happens between successive days.
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    seville munich tallinn - city
  )

  (:init
    ; successor (consecutive days)
    (suc day1 day2) (suc day2 day3) (suc day3 day4) (suc day4 day5)
    (suc day5 day6) (suc day6 day7) (suc day7 day8) (suc day8 day9)
    (suc day9 day10) (suc day10 day11) (suc day11 day12)

    ; direct flight connectivity (bidirectional as stated)
    (edge seville munich)
    (edge munich seville)
    (edge munich tallinn)
    (edge tallinn munich)

    ; starting location: traveler begins in Seville on day1 (consistent with wanting 7 days in Seville)
    (at day1 seville)
  )

  ; Goal: encode the traveler's stated hard requirements exactly.
  ; The traveler requested: seville for 7 days, munich for 5 days, tallinn for 2 days,
  ; with a meeting in Tallinn between day11 and day12.
  ; To encode "Seville for 7 days" we require day1..day7 = seville.
  ; To encode "Munich for 5 days" we require day8..day12 = munich.
  ; To encode "Tallinn for 2 days" and the meeting window we require day11..day12 = tallinn.
  ; These goals are contradictory (day11 and day12 cannot be both munich and tallinn), so the
  ; resulting planning instance is unsolvable; this preserves the auditor's conservative approach.
  (:goal (and
    ; Seville 7 days
    (at day1 seville) (at day2 seville) (at day3 seville)
    (at day4 seville) (at day5 seville) (at day6 seville) (at day7 seville)

    ; Munich 5 days (days 8..12)
    (at day8 munich) (at day9 munich) (at day10 munich)
    (at day11 munich) (at day12 munich)

    ; Tallinn 2 days and meeting window (days 11..12)
    (at day11 tallinn) (at day12 tallinn)
  ))
)