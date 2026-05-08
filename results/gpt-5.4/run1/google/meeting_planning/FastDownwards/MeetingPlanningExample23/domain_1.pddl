(define (domain meet_john_san_francisco_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    person
    location
    time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (plus_23 ?t1 - time ?t2 - time)
    (plus_75 ?t1 - time ?t2 - time)
    (connected ?from - location ?to - location)
    (john_at ?l - location)
    (john_available_at ?t - time)
    (met_john)
  )

  (:action wait_step
    :parameters (?a - agent ?from - time ?to - time ?l - location)
    :precondition (and
      (current_time ?from)
      (next_time ?from ?to)
      (at ?a ?l)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action move
    :parameters (?a - agent ?from_loc - location ?to_loc - location ?from_t - time ?to_t - time)
    :precondition (and
      (current_time ?from_t)
      (at ?a ?from_loc)
      (connected ?from_loc ?to_loc)
      (plus_23 ?from_t ?to_t)
    )
    :effect (and
      (not (at ?a ?from_loc))
      (at ?a ?to_loc)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action meet_john_75
    :parameters (?a - agent ?start - time ?end - time ?l - location)
    :precondition (and
      (current_time ?start)
      (at ?a ?l)
      (john_at ?l)
      (john_available_at ?start)
      (plus_75 ?start ?end)
      (not (met_john))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_john)
    )
  )
)