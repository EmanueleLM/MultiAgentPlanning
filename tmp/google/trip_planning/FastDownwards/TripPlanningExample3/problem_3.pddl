(define (problem integrated-trip-problem)
  (:domain integrated-trip)
  (:objects
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )
  (:init
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (at berlin day1)
  )
  (:goal (and
    ;; Traveler's stated desires encoded explicitly (these goals reflect the human/json specification).
    ;; Berlin for 3 days:
    (at berlin day1)
    (at berlin day2)
    (at berlin day3)
    ;; Warsaw for 3 days:
    (at warsaw day4)
    (at warsaw day5)
    (at warsaw day6)
    ;; Bucharest for 2 days (and meeting friend between day5 and day6):
    (at bucharest day5)
    (at bucharest day6)
    (met-friend)
  ))
)