(define (problem meet-stephanie-problem-classical)
  (:domain travel-meetings-classical)
  (:objects
    traveler stephanie - person
    marina_district mission_district - location
  )
  (:init
    (at traveler marina_district)
    (at stephanie mission_district)
    (time t540)
  )
  (:goal (and
    (met traveler stephanie)
  ))
)