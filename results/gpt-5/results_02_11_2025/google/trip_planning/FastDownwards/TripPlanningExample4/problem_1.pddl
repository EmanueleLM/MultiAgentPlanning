(define (problem trip12-seville-munich-tallinn)
  (:domain trip-scheduling)
  (:objects
    seville munich tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    f1 f2 - token
  )
  (:init
    ; linear 12-day horizon
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
    (next day11 day12)

    ; direct flight graph (bidirectional)
    (connected seville munich)
    (connected munich seville)
    (connected munich tallinn)
    (connected tallinn munich)

    ; start conditions
    (at seville day1)
    (decided day1)

    ; two available flights total
    (unused f1)
    (unused f2)
  )
  (:goal (and
    ; every day must be assigned (ensures a 12-day complete itinerary)
    (decided day1)
    (decided day2)
    (decided day3)
    (decided day4)
    (decided day5)
    (decided day6)
    (decided day7)
    (decided day8)
    (decided day9)
    (decided day10)
    (decided day11)
    (decided day12)

    ; start in Seville on day 1 (also in init)
    (at seville day1)

    ; Tallinn must occupy days 11-12; disallow Tallinn earlier to enforce meeting window and finale
    (not (at tallinn day1))
    (not (at tallinn day2))
    (not (at tallinn day3))
    (not (at tallinn day4))
    (not (at tallinn day5))
    (not (at tallinn day6))
    (not (at tallinn day7))
    (not (at tallinn day8))
    (not (at tallinn day9))
    (not (at tallinn day10))
    (at tallinn day11)
    (at tallinn day12)

    ; Keep Munich as a 5-day segment immediately before Tallinn:
    ; ensure Munich starts on day 6 and is not present before day 6 nor during Tallinn days
    (not (at munich day1))
    (not (at munich day2))
    (not (at munich day3))
    (not (at munich day4))
    (not (at munich day5))
    (at munich day6)
    (not (at munich day11))
    (not (at munich day12))
  ))
)