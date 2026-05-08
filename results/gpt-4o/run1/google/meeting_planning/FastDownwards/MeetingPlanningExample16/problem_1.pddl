(define (problem meet_ronald_in_san_francisco)
  (:domain san_francisco_visit)
  (:objects
    chinatown - location
    russian_hill - location
    ronald - person
    ts_0 ts_1 ts_2 ts_3 ts_4 - time_stage
  )
  (:init
    (at chinatown)
    (time_stage ts_0)
  )
  (:goal
    (and (met_ronald_long_enough))
  )
)