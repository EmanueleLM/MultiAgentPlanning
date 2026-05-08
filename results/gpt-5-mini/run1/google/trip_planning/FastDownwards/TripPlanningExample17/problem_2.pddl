(define (problem itinerary-inconsistent-instance-fixed)
  (:domain travel-domain)
  (:objects
    traveler - person
    copenhagen vienna lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; temporal ordering of the 11 discrete days
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

    ;; available direct flights (bidirectional)
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

    ;; initial condition: traveler is in Copenhagen on day1 and day1 is assigned
    (at traveler copenhagen day1)
    (assigned day1)
  )

  ;; Goals:
  ;; - Attend the conference in Copenhagen on day1 and day5.
  ;; - Stay in Copenhagen for 5 days total (modeled as days 1-5).
  ;; - Stay in Vienna for 4 days (modeled as days 6-9).
  ;; - Stay in Lyon for 2 days (modeled as days 10-11).
  ;; The original user requirements requested Lyon for 4 days, which together with the other
  ;; requests sums to 13 days > 11 and is infeasible. To produce a feasible itinerary that
  ;; respects the conference constraints and the direct-flight-only commuting constraint,
  ;; the stay in Lyon is reduced to 2 days so the total equals 11 days (5 + 4 + 2 = 11).
  (:goal (and
    ;; Copenhagen days 1-5 (conference on day1 and day5 included)
    (at traveler copenhagen day1)
    (at traveler copenhagen day2)
    (at traveler copenhagen day3)
    (at traveler copenhagen day4)
    (at traveler copenhagen day5)

    ;; Vienna days 6-9
    (at traveler vienna day6)
    (at traveler vienna day7)
    (at traveler vienna day8)
    (at traveler vienna day9)

    ;; Lyon days 10-11 (adjusted to make the instance feasible)
    (at traveler lyon day10)
    (at traveler lyon day11)

    ;; ensure every day of the trip is assigned (total trip length = 11)
    (assigned day1)
    (assigned day2)
    (assigned day3)
    (assigned day4)
    (assigned day5)
    (assigned day6)
    (assigned day7)
    (assigned day8)
    (assigned day9)
    (assigned day10)
    (assigned day11)
  ))
)