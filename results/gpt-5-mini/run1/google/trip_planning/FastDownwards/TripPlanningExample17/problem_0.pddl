(define (problem itinerary-option-A)
  (:domain travel-domain)
  (:objects
    traveler - person
    copenhagen vienna lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ; temporal ordering
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

    ; direct-flight connectivity (bidirectional links provided)
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

    ; initial assignment: day1 is already assigned and traveler is in Copenhagen on day1
    (assigned day1)
    (at traveler copenhagen day1)
  )

  (:goal (and
    ; conference attendance requirements and full 11-day assignment per Option A:
    ; Days 1-5: Copenhagen (conference on day1 and day5 satisfied)
    (at traveler copenhagen day1)
    (at traveler copenhagen day2)
    (at traveler copenhagen day3)
    (at traveler copenhagen day4)
    (at traveler copenhagen day5)

    ; Days 6-8: Vienna
    (at traveler vienna day6)
    (at traveler vienna day7)
    (at traveler vienna day8)

    ; Days 9-11: Lyon
    (at traveler lyon day9)
    (at traveler lyon day10)
    (at traveler lyon day11)
  ))
)