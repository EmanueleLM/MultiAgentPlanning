(define (problem meeting_planning_example17_problem)
  (:domain meeting_planning_example17)
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