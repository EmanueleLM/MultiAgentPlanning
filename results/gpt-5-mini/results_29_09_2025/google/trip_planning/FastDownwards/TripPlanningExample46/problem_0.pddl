(define (problem travel-problem)
  (:domain travel-domain)

  (:objects
    traveler - person
    stockholm - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  ;; Initial state:
  ;; - Traveler is in Stockholm on day1 (enforces presence in Stockholm on day1).
  ;; - daynext links define the discrete time steps (1->2, 2->3, ..., 10->11).
  ;; No direct flights are asserted here (planner will therefore only be able to use 'stay'
  ;; unless direct facts are added). Per instructions, do not invent flight availability.
  (:init
    (at traveler stockholm day1)

    (daynext day1 day2)
    (daynext day2 day3)
    (daynext day3 day4)
    (daynext day4 day5)
    (daynext day5 day6)
    (daynext day6 day7)
    (daynext day7 day8)
    (daynext day8 day9)
    (daynext day9 day10)
    (daynext day10 day11)
  )

  ;; Goals:
  ;; - The traveler must be assigned to a city for each of the 11 days.
  ;; - The problem statement requires the traveler to be in Stockholm on day1 and day3.
  ;;   Treating natural-language preferences as hard constraints, we require Stockholm for all days
  ;;   (this guarantees an 11-day assignment and respects the Stockholm constraints).
  (:goal
    (and
      (at traveler stockholm day1)
      (at traveler stockholm day2)
      (at traveler stockholm day3)
      (at traveler stockholm day4)
      (at traveler stockholm day5)
      (at traveler stockholm day6)
      (at traveler stockholm day7)
      (at traveler stockholm day8)
      (at traveler stockholm day9)
      (at traveler stockholm day10)
      (at traveler stockholm day11)
    )
  )
)