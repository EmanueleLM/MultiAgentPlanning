(define (domain san_francisco_meet_margaret)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    location
    person
    timepoint
  )

  (:predicates
    (at ?l - location)
    (current_time ?t - timepoint)
    (direct_route ?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    (next_time ?t1 - timepoint ?t2 - timepoint)
    (available ?p - person ?start - timepoint ?end - timepoint)
    (met ?p - person)
  )

  (:action wait
    :parameters (?from_t - timepoint ?to_t - timepoint)
    :precondition (and
      (current_time ?from_t)
      (next_time ?from_t ?to_t)
    )
    :effect (and
      (not (current_time ?from_t))
      (current_time ?to_t)
    )
  )

  (:action travel
    :parameters (?from - location ?to - location ?depart - timepoint ?arrive - timepoint)
    :precondition (and
      (at ?from)
      (current_time ?depart)
      (direct_route ?from ?to ?depart ?arrive)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_time ?depart))
      (current_time ?arrive)
    )
  )

  (:action meet_margaret
    :parameters (?p - person ?loc - location ?start - timepoint ?end - timepoint)
    :precondition (and
      (at ?loc)
      (current_time ?start)
      (available ?p ?start ?end)
      (not (met ?p))
    )
    :effect (and
      (not (current_time ?start))
      (current_time ?end)
      (met ?p)
    )
  )
)