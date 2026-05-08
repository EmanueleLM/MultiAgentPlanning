(define (domain san_francisco_nancy_meeting)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    friend
    location
    time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (current_time ?t - time)
    (next ?t1 - time ?t2 - time)
    (travel_15 ?from - location ?to - location ?t1 - time ?t2 - time)
    (nancy_available_for_75 ?l - location ?t1 - time ?t2 - time)
    (met_nancy)
  )

  (:action wait
    :parameters (?a - agent ?l - location ?from - time ?to - time)
    :precondition (and
      (at ?a ?l)
      (current_time ?from)
      (next ?from ?to)
    )
    :effect (and
      (not (current_time ?from))
      (current_time ?to)
    )
  )

  (:action travel
    :parameters (?a - agent ?from_loc - location ?to_loc - location ?from_t - time ?to_t - time)
    :precondition (and
      (at ?a ?from_loc)
      (current_time ?from_t)
      (travel_15 ?from_loc ?to_loc ?from_t ?to_t)
    )
    :effect (and
      (not (at ?a ?from_loc))
      (at ?a ?to_loc)
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action meet_nancy_for_75
    :parameters (?a - agent ?l - location ?start - time ?end - time)
    :precondition (and
      (at ?a ?l)
      (current_time ?start)
      (nancy_available_for_75 ?l ?start ?end)
      (not (met_nancy))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met_nancy)
    )
  )
)