(define (problem meet-james)
  (:domain meeting-scheduling)
  (:objects
    planner james - person
    MarinaDistrict AlamoSquare - location
  )
  (:init
    ;; Travel time between Marina District and Alamo Square is 15 minutes
    (= (travel-time MarinaDistrict AlamoSquare) 15)

    ;; Initial positions at time 0 (which corresponds to 09:00)
    (at planner MarinaDistrict)
    (at james AlamoSquare)

    ;; James is only available from 15:45 to 20:00
    ;; From 09:00 to 15:45 is 6h45 = 405 minutes, from 09:00 to 20:00 is 11h = 660 minutes
    (at 405   (available james))
    (at 660   (not (available james)))
  )
  (:goal
    ;; Ensure that planner and James have met for at least 75 minutes
    (met planner james)
  )
)