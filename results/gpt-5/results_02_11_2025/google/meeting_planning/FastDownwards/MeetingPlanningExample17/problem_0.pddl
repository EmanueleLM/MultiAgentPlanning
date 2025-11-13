(define (problem meet-matthew-problem)
  (:domain meet-matthew-time)
  (:objects
    alamo_square sunset_district - location
  )
  (:init
    (at alamo_square)
    (= (t) 540)
    (= (total-cost) 0)
  )
  (:goal
    (met_matthew)
  )
  (:metric minimize (total-cost))
)