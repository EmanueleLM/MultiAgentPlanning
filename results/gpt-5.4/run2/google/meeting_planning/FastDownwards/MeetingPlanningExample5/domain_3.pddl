(define (domain san_francisco_meet_william)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - time)
    (available ?p - person ?l - location ?start - time)
    (met ?p - person)
  )

  (:action go_to_the_castro_before_william_available
    :parameters ()
    :precondition (and
      (at nob_hill)
      (current_time t_0900)
      (connected nob_hill the_castro)
    )
    :effect (and
      (not (at nob_hill))
      (at the_castro)
      (not (current_time t_0900))
      (current_time t_1215)
    )
  )

  (:action meet_william_for_75_minutes
    :parameters ()
    :precondition (and
      (at the_castro)
      (current_time t_1215)
      (available william the_castro t_1215)
      (not (met william))
    )
    :effect (and
      (met william)
      (not (current_time t_1215))
      (current_time t_1330)
    )
  )
)