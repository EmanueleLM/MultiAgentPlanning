(define (problem tripplanningexample17)
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

  ;; Goals encoding the user's original hard requirements exactly:
  ;; - Copenhagen for 5 days (modeled as days 1-5), including conferences on day1 and day5
  ;; - Vienna for 4 days (modeled as days 6-9)
  ;; - Lyon for 4 days (modeled as days 8-11)
  ;; - Total trip length is 11 days (days 1..11 exist as discrete steps)
  ;;
  ;; Note: these goals faithfully encode the human's stated hard constraints.
  ;; They are mutually inconsistent under the single-traveler / single-location-per-day
  ;; model because the requested city blocks overlap (vienna: days6-9, lyon: days8-11),
  ;; and the total requested city-days (5+4+4 = 13) exceeds the available 11 distinct days.
  ;; The instance is therefore unsolvable; the encoding preserves that fact instead of
  ;; silently altering the user's requirements.
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

    ;; Lyon days 8-11 (four days requested)
    (at traveler lyon day8)
    (at traveler lyon day9)
    (at traveler lyon day10)
    (at traveler lyon day11)

    ;; ensure every day of the trip exists (domain provides days 1..11)
    ;; (assigned predicates will be established by actions during a valid plan)
    ;; Note: we do not relax or change the user's requested stays; this goal set
    ;; intentionally reflects the original (inconsistent) requirements.
  ))
)