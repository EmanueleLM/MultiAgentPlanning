(define (problem meet-stephanie-problem)
  (:domain travel-meetings)
  (:objects
    traveler stephanie - person
    MarinaDistrict MissionDistrict - location
  )
  (:init
    ;; traveler initial location (arrived at Marina District at 09:00)
    (at traveler MarinaDistrict)
    ;; Stephanie is at Mission District for the window (we model her presence as fixed)
    (at stephanie MissionDistrict)
    ;; global clock set to 09:00 = 540 minutes after midnight
    (= (time) 540)
  )
  (:goal (and
           (met traveler stephanie)
         ))
)