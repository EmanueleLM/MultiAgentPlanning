(define (problem orchestrated_trip-problem)
  (:domain orchestrated_trip)

  (:objects
    brussels valencia nice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (in brussels day1)
    (occupied day1)

    (meeting-allowed day1)
    (meeting-allowed day2)
    (meeting-allowed day3)
    (meeting-allowed day4)
    (meeting-allowed day5)
    (meeting-allowed day6)

    (is-nice nice)

    (= (total-days) 1)
    (= (days-brussels) 1)
    (= (days-valencia) 0)
    (= (days-nice) 0)
  )

  (:goal
    (and
      (met-friends)
      (= (total-days) 9)
      (= (days-brussels) 2)
      (= (days-valencia) 3)
      (= (days-nice) 4)
    )
  )
)