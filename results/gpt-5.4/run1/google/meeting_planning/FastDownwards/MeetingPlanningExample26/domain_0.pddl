(define (domain san_francisco_meeting_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - time)
    (available ?p - person ?l - location ?t - time)
    (connected ?from - location ?to - location)
    (travel_step ?from - location ?to - location ?t1 - time ?t2 - time)
    (next_time ?t1 - time ?t2 - time)
    (meeting_started ?p - person)
    (meeting_completed ?p - person)
  )

  (:action wait
    :parameters (?from - time ?to - time ?l - location)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
      (at ?l)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?from_loc - location ?to_loc - location ?from_t - time ?to_t - time)
    :precondition (and
      (at ?from_loc)
      (current_time ?from_t)
      (connected ?from_loc ?to_loc)
      (travel_step ?from_loc ?to_loc ?from_t ?to_t)
    )
    :effect (and
      (not (at ?from_loc))
      (at ?to_loc)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action start_meeting
    :parameters (?p - person ?l - location ?t - time)
    :precondition (and
      (at ?l)
      (current_time ?t)
      (available ?p ?l ?t)
      (not (meeting_started ?p))
      (not (meeting_completed ?p))
    )
    :effect (and
      (meeting_started ?p)
    )
  )

  (:action complete_minimum_meeting
    :parameters (?p - person ?l - location ?from_t - time ?to_t - time)
    :precondition (and
      (meeting_started ?p)
      (at ?l)
      (current_time ?from_t)
      (available ?p ?l ?from_t)
      (available ?p ?l ?to_t)
      (not (meeting_completed ?p))
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
      (meeting_completed ?p)
    )
  )
)