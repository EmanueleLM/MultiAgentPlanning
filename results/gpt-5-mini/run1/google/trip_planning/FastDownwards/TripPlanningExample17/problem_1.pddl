(define (problem itinerary-inconsistent-instance)
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

  ;; Goals encode the user's stated hard constraints:
  ;; - attend conference in Copenhagen on day1 and day5
  ;; - be in Copenhagen for 5 days total (modeled here as days 1-5)
  ;; - be in Vienna for 4 days (modeled here as days 6-9)
  ;; - be in Lyon for 4 days (modeled here as days 8-11)
  ;; - ensure the trip assigns all 11 days (total trip length = 11)
  ;; Note: these goals are mutually inconsistent for this instance (5 + 4 + 4 = 13 > 11,
  ;; and days 8-9 are required simultaneously for Vienna and Lyon), which makes the problem unsolvable.
  (:goal (and
    ;; Copenhagen 5-day requirement and conference days
    (at traveler copenhagen day1)
    (at traveler copenhagen day2)
    (at traveler copenhagen day3)
    (at traveler copenhagen day4)
    (at traveler copenhagen day5)

    ;; Vienna 4-day requirement (days 6-9)
    (at traveler vienna day6)
    (at traveler vienna day7)
    (at traveler vienna day8)
    (at traveler vienna day9)

    ;; Lyon 4-day requirement (days 8-11) -- overlaps with Vienna on days 8 and 9
    (at traveler lyon day8)
    (at traveler lyon day9)
    (at traveler lyon day10)
    (at traveler lyon day11)

    ;; Total trip length: every day must be assigned (day1 already assigned in init)
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