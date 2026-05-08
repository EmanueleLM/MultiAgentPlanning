(define (problem meet_mary_problem)
  (:domain meeting_planning)
  (:objects
    me mary - person
    nob_hill marina_district - location
    t0900 t2000 t2200 - time
  )
  (:init
    (at me nob_hill)
    (time_is t0900)
    (can_travel nob_hill marina_district t0900 t2000)
    (friend_available mary marina_district t2000 t2200)
  )
  (:goal
    (met mary)
  )
)