(define (problem orchestrated-trip)
  (:domain orchestrator_combined)

  (:objects
    tallinn munich seville - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ; flights (direct only as given)
    (flight seville munich)
    (flight munich seville)
    (flight munich tallinn)
    (flight tallinn munich)

    ; day succession
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

    ; allowed meet window
    (allowed-meet day11)
    (allowed-meet day12)

    ; starting location and counts
    (at munich day1)

    ; counts initial: munich already counted for day1
    (seville_count_0)
    (munich_count_1)
    (tallinn_count_0)
  )

  (:goal (and
    (seville_count_7)
    (munich_count_5)
    (tallinn_count_2)
    (or (met day11) (met day12))
  ))

  (:metric minimize (total-cost))
)