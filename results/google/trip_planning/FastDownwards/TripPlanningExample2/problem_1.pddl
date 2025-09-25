(define (problem trip-11days-integrated)
  (:domain trip-multiagent)

  (:objects
    reykjavik vienna venice - city
  )

  (:init
    (at reykjavik)
    (flight reykjavik vienna)
    (flight vienna reykjavik)
    (flight vienna venice)
    (flight venice vienna)
    (= (day) 0)
    (= (days_in_reykjavik) 0)
    (= (days_in_vienna) 0)
    (= (days_in_venice) 0)
  )

  (:goal (and
    (= (day) 11)
    (= (days_in_reykjavik) 2)
    (= (days_in_venice) 4)
    (= (days_in_vienna) 5)
    (attended-wedding)
  )))