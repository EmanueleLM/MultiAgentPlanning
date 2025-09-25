(define (problem integrated-trip-problem)
  (:domain integrated-trip-domain)

  (:objects
    copenhagen vienna lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - num
  )

  (:init
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)
    (at copenhagen day1)
    (today day1)
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
    (nextnum n0 n1)
    (nextnum n1 n2)
    (nextnum n2 n3)
    (nextnum n3 n4)
    (nextnum n4 n5)
    (nextnum n5 n6)
    (nextnum n6 n7)
    (nextnum n7 n8)
    (nextnum n8 n9)
    (nextnum n9 n10)
    (nextnum n10 n11)
    (spent copenhagen n0)
    (spent vienna n0)
    (spent lyon n0)
    (conference copenhagen day1)
    (conference copenhagen day5)
  )

  (:goal
    (and
      (attended day1)
      (attended day5)
      (or (spent copenhagen n5) (spent copenhagen n6) (spent copenhagen n7) (spent copenhagen n8) (spent copenhagen n9) (spent copenhagen n10) (spent copenhagen n11))
      (or (spent vienna n4) (spent vienna n5) (spent vienna n6) (spent vienna n7) (spent vienna n8) (spent vienna n9) (spent vienna n10) (spent vienna n11))
      (or (spent lyon n2) (spent lyon n3) (spent lyon n4) (spent lyon n5) (spent lyon n6) (spent lyon n7) (spent lyon n8) (spent lyon n9) (spent lyon n10) (spent lyon n11))
    )
  )
)