(define (problem meet_ronald_in_san_francisco)
  (:domain san_francisco_visit)
  (:objects
    chinatown - location
    russian_hill - location
    ronald - person
  )
  (:init
    (at chinatown)
    (time 9 0)
  )
  (:goal
    (and (met_ronald_long_enough))
  )
)