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

    ;; conference occurrences (informational; attendance enforced via goals)
    ( ; no-op: kept here for clarity of requirements
    )
  )

  ;; Goals: these exactly encode the user's stated hard requirements.
  ;; Note: they are mutually inconsistent (overlap and total requested city-days > 11).
  ;; The encoding preserves the original requirements (unsolvable) rather than changing them.
  (:goal (and
    ;; Copenhagen for 5 days (conference on day1 and day5 included)
    (at traveler copenhagen day1)
    (at traveler copenhagen day2)
    (at traveler copenhagen day3)
    (at traveler copenhagen day4)
    (at traveler copenhagen day5)

    ;; Vienna for 4 days (days 6-9)
    (at traveler vienna day6)
    (at traveler vienna day7)
    (at traveler vienna day8)
    (at traveler vienna day9)

    ;; Lyon for 4 days (days 8-11) -- overlaps days 8-9 with Vienna, causing inconsistency
    (at traveler lyon day8)
    (at traveler lyon day9)
    (at traveler lyon day10)
    (at traveler lyon day11)
  ))
)