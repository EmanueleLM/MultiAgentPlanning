(define (problem orchestrated-trip)
  (:domain orchestrator_combined)

  (:objects
    tallinn munich seville - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    (flight seville munich)
    (flight munich seville)
    (flight munich tallinn)
    (flight tallinn munich)

    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)
    (succ day10 day11)
    (succ day11 day12)

    (allowed-meet day11)
    (allowed-meet day12)

    (at munich day1)

    (= (seville-days) 0)
    (= (tallinn-days) 0)
    (= (munich-days) 1)

    (= (total-cost) 0)
  )

  (:goal (and
    (= (seville-days) 7)
    (= (munich-days) 5)
    (= (tallinn-days) 2)
    (or (met day11) (met day12))
  ))

  (:metric minimize (total-cost))
)