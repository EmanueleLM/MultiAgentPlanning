(define (problem orchestrated_trip-problem)
  (:domain orchestrated_trip)

  (:objects
    brussels valencia nice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - number
  )

  (:init
    ;; direct flights (bidirectional)
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    ;; day ordering
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; initial location and occupancy
    (in brussels day1)
    (occupied day1)

    ;; meeting allowed window day1..day6
    (meeting-allowed day1)
    (meeting-allowed day2)
    (meeting-allowed day3)
    (meeting-allowed day4)
    (meeting-allowed day5)
    (meeting-allowed day6)

    (is-nice nice)

    ;; successor (precomputed arithmetic)
    (succ n0 n1)
    (succ n1 n2)
    (succ n2 n3)
    (succ n3 n4)
    (succ n4 n5)
    (succ n5 n6)
    (succ n6 n7)
    (succ n7 n8)
    (succ n8 n9)

    ;; initial total and city-specific counts encoded as predicates
    (total-count n1)
    (city-count brussels n1)
    (city-count valencia n0)
    (city-count nice n0)

    ;; initial total-cost (action-costs use this function; solver may minimize)
    (= (total-cost) 0)
  )

  (:goal
    (and
      (met-friends)
      (total-count n9)
      (city-count brussels n2)
      (city-count valencia n3)
      (city-count nice n6)
    )
  )

  (:metric minimize (total-cost))
)