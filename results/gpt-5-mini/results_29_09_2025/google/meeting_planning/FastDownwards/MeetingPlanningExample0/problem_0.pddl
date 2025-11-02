(define (problem meet-stephanie-problem)
  (:domain traveler-meetings)
  (:objects
    traveler - agent
    stephanie - person
    MarinaDistrict MissionDistrict - location
  )
  ;; Initial time: 09:00 = 540 minutes since midnight
  (:init
    (= (time) 540)
    (at traveler MarinaDistrict)
    (available stephanie MissionDistrict)
  )
  ;; Goal: traveler has completed the required contiguous meeting with Stephanie (>= 120 minutes)
  (:goal (and
    (met traveler stephanie)
  ))
)