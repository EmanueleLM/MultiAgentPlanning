(define (problem meet-james)
  (:domain meeting-scheduling)
  (:objects
    planner james - person
    MarinaDistrict AlamoSquare - location
  )
  (:init
    (= (travel-time MarinaDistrict AlamoSquare) 15)
    (= (travel-time AlamoSquare MarinaDistrict) 15)
    (at planner MarinaDistrict)
    (at 405 (at james AlamoSquare))
    (at 405 (available james))
    (at 660 (not (available james)))
    (at 660 (not (at james AlamoSquare)))
  )
  (:goal
    (met planner james)
  )
)