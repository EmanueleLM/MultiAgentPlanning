(define (problem trip-8days)
  (:domain trip-planning)
  (:objects
    London Bucharest Riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8)

    (direct London Bucharest) (direct Bucharest London)
    (direct Bucharest Riga) (direct Riga Bucharest)

    (assigned day1)
    (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8)

    (at London day1)
  )

  (:goal (and
    (at London day1) (at London day2) (at London day3)
    (at Bucharest day4)
    (at Riga day5) (at Riga day6) (at Riga day7) (at Riga day8)
  )))