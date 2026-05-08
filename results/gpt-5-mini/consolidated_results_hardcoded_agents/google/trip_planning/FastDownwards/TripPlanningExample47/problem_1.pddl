(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    paris istanbul salzburg - city
    d1 d2 d3 d4 d5 d6 d7 - day
  )
  (:init
    (at paris d1)
    (day-assigned d1)
  )
  (:goal
    (and
      (at paris d1)
      (at paris d2)
      (at istanbul d3)
      (at istanbul d4)
      (at salzburg d5)
      (at salzburg d6)
      (at salzburg d7)
    )
  )
)