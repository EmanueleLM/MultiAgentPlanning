(define (domain san_francisco_meet_paul)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location person time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (met ?p - person)
    (connected ?from - location ?to - location)
    (travel_900_to_930 ?from - location ?to - location)
    (valid_meeting_start ?p - person ?t - time)
  )

  (:action wait_to_next
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel_900_to_930_action
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (current_time t900)
      (connected ?from ?to)
      (travel_900_to_930 ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time t900))
      (current_time t930)
    )
  )

  (:action meet_paul
    :parameters (?t - time)
    :precondition (and
      (at nob_hill)
      (current_time ?t)
      (valid_meeting_start paul ?t)
      (not (met paul))
    )
    :effect (and
      (met paul)
    )
  )
)