(define (problem trip_problem)
  (:domain trip_domain)

  (:objects
    traveller - person
    riga manchester split - loc
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  ;; Initial state:
  ;; - Traveler begins in Riga (we start in Riga to use the direct Riga->Manchester leg).
  ;; - Global available days is 15 (days day15). No city has been visited yet.
  (:init
    (at traveller riga)
    (days day15)
  )

  ;; Global goal:
  ;; - Use only direct flights (modeled above)
  ;; - End the trip with zero days remaining (sum of stay durations equals 15)
  ;; - The plan finishes in Split (Split has no provided departure leg in the proposals).
  (:goal
    (and
      (at traveller split)
      (days day0)
    )
  )
)