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
    (travel_900_to_1100 ?from - location ?to - location)
    (travel_930_to_1100 ?from - location ?to - location)
    (travel_930_to_1115 ?from - location ?to - location)
    (next_time ?t1 - time ?t2 - time)
    (paul_available_start ?p - person ?t - time)
    (paul_available_end ?p - person ?t - time)
    (valid_meeting_start ?p - person ?t - time)
  )

  (:action wait_to_next
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?l)
      (current_time ?t1)
      (next_time ?t1 ?t2)
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

  (:action travel_900_to_1100_action
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (current_time t900)
      (connected ?from ?to)
      (travel_900_to_1100 ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time t900))
      (current_time t1100)
    )
  )

  (:action travel_930_to_1100_action
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (current_time t930)
      (connected ?from ?to)
      (travel_930_to_1100 ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time t930))
      (current_time t1100)
    )
  )

  (:action travel_930_to_1115_action
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (current_time t930)
      (connected ?from ?to)
      (travel_930_to_1115 ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time t930))
      (current_time t1115)
    )
  )

  (:action meet_paul
    :parameters (?t - time)
    :precondition (and
      (at nob_hill)
      (current_time ?t)
      (valid_meeting_start paul ?t)
      (paul_available_start paul t930)
      (paul_available_end paul t1115)
      (not (met paul))
    )
    :effect (and
      (met paul)
    )
  )
)