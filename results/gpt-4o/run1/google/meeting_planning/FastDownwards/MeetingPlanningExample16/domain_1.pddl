(define (domain san_francisco_visit)
  (:requirements :strips :typing)
  (:types location person time_stage)
  (:predicates
    (at ?loc - location)
    (visited_ronald)
    (met_ronald_long_enough)
    (time_stage ?ts - time_stage)
  )
  (:action move_chinatown_to_russian_hill
    :precondition (and (at chinatown) (time_stage ts_0))
    :effect (and (at russian_hill) (not (at chinatown)) (time_stage ts_1))
  )
  (:action move_russian_hill_to_chinatown
    :precondition (and (at russian_hill) (time_stage ts_3))
    :effect (and (at chinatown) (not (at russian_hill)) (time_stage ts_4))
  )
  (:action meet_ronald
    :precondition (and (at russian_hill) (time_stage ts_1) (not (met_ronald_long_enough)))
    :effect (and (visited_ronald) (time_stage ts_2))
  )
  (:action sustain_meeting_with_ronald
    :precondition (and (visited_ronald) (time_stage ts_2) (not (met_ronald_long_enough)))
    :effect (met_ronald_long_enough)
  )
)