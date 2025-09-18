(define (problem orchestrated-trip)
  (:domain orchestrator_combined)

  (:objects
    tallinn munich seville - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 - num
  )

  (:init
    ;; Direct flights (bidirectional)
    (flight seville munich)
    (flight munich seville)
    (flight munich tallinn)
    (flight tallinn munich)

    ;; Successor relations day1 -> day2 -> ... -> day12
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

    ;; Meeting allowed days per Tallinn agent
    (allowed-meet day11)
    (allowed-meet day12)

    ;; Initial location: start in Munich on day1
    (in munich day1)

    ;; Initialize counters: zero for seville and munich
    (seville-count n0)
    (munich-count n0)

    ;; Initialize total cost
    (= (total-cost) 0)
  )

  (:goal (and
    ;; Exactly 7 days in Seville required: seville-count n7
    (seville-count n7)

    ;; At least 3 days in Munich: any of n3..n12
    (or (munich-count n3) (munich-count n4) (munich-count n5) (munich-count n6)
        (munich-count n7) (munich-count n8) (munich-count n9) (munich-count n10)
        (munich-count n11) (munich-count n12))

    ;; Be in Tallinn on day11 and day12 and meet on day11
    (in tallinn day11)
    (in tallinn day12)
    (met day11)
  ))

  (:metric minimize (total-cost))
)