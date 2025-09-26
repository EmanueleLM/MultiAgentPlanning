(define (problem meet-stephanie-problem-classical)
  (:domain travel-meetings-classical)
  (:objects
    traveler stephanie - person
    MarinaDistrict MissionDistrict - location
    t540 t610 t630 t670 t690 t750 t810 - timepoint
  )
  (:init
    (at traveler MarinaDistrict)
    (at stephanie MissionDistrict)
    (time t540)
    (= (total-cost) 0)
  )
  (:goal (and
    (met traveler stephanie)
  ))
  (:metric minimize (total-cost))
)