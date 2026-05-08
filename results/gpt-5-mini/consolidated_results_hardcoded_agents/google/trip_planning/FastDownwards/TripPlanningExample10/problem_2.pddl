(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )
  (:init
    (start-day day1)
    (unassigned day1) (unassigned day2) (unassigned day3)
    (unassigned day4) (unassigned day5) (unassigned day6)
    (unassigned day7) (unassigned day8) (unassigned day9)
    (next day1 day2) (next day2 day3) (next day3 day4)
    (next day4 day5) (next day5 day6) (next day6 day7)
    (next day7 day8) (next day8 day9)
    (direct oslo dublin) (direct dublin oslo)
    (direct dublin valencia) (direct valencia dublin)
  )
  (:goal
    (and
      (assigned day1 oslo) (assigned day2 oslo) (assigned day3 oslo)
      (assigned day4 dublin) (assigned day5 dublin) (assigned day6 dublin)
      (assigned day7 valencia) (assigned day8 valencia) (assigned day9 valencia)
    )
  )
)