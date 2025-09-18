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
    (spent-cph n0)
    (spent-vie n0)
    (spent-lys n0)
  )

  (:goal
    (and
      (attended1)
      (attended5)
      (or (spent-cph n5) (spent-cph n6) (spent-cph n7) (spent-cph n8) (spent-cph n9) (spent-cph n10) (spent-cph n11))
      (or (spent-vie n4) (spent-vie n5) (spent-vie n6) (spent-vie n7) (spent-vie n8) (spent-vie n9) (spent-vie n10) (spent-vie n11))
      (or (spent-lys n2) (spent-lys n3) (spent-lys n4) (spent-lys n5) (spent-lys n6) (spent-lys n7) (spent-lys n8) (spent-lys n9) (spent-lys n10) (spent-lys n11))
    )
  )
)