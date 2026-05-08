(define (domain san_francisco_visit)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person)
  (:predicates
    (at ?loc - location)
    (visited_ronald)
    (met_ronald_long_enough)
    (time ?hour - integer ?minute - integer)
  )
  (:action move_chinatown_to_russian_hill
    :precondition (and (at chinatown) (time 15 7) (not (visited_ronald)))
    :effect (and (at russian_hill) (not (at chinatown)) (time 15 14))
  )
  (:action move_russian_hill_to_chinatown
    :precondition (and (at russian_hill) (time 16 59))
    :effect (and (at chinatown) (not (at russian_hill)) (time 17 8))
  )
  (:action meet_ronald
    :precondition (and (at russian_hill) (time 15 15) (not (met_ronald_long_enough)))
    :effect (and (visited_ronald) (time 17 0))
  )
  (:action sustain_meeting_with_ronald
    :precondition (and (visited_ronald) (not (met_ronald_long_enough)) (time 17 0))
    :effect (met_ronald_long_enough)
  )
)