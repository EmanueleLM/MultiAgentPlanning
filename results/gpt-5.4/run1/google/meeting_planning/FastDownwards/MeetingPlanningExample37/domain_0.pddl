(define (domain san_francisco_jeffrey_day)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    time
  )

  (:predicates
    (at ?l - location)
    (connected ?from - location ?to - location)
    (current_time ?t - time)
    (next_time ?t1 - time ?t2 - time)
    (travel_time_19 ?from - location ?to - location ?t1 - time ?t2 - time)
    (available ?p - person ?l - location ?start - time ?end - time)
    (can_complete_90 ?p - person ?start - time ?end - time)
    (met_minimum ?p - person)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current_time ?t1)
      (next_time ?t1 ?t2)
    )
    :effect (and
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (current_time ?t1)
      (travel_time_19 ?from ?to ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?t1))
      (current_time ?t2)
    )
  )

  (:action meet_for_90
    :parameters (?p - person ?l - location ?t_start - time ?t_end - time ?avail_end - time)
    :precondition (and
      (at ?l)
      (current_time ?t_start)
      (available ?p ?l ?t_start ?avail_end)
      (can_complete_90 ?p ?t_start ?t_end)
      (not (met_minimum ?p))
    )
    :effect (and
      (not (current_time ?t_start))
      (current_time ?t_end)
      (met_minimum ?p)
    )
  )
)