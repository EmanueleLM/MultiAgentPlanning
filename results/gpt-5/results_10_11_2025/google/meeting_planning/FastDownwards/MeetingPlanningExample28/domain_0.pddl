(define (domain meeting-schedule)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent person location time
  )

  (:predicates
    (at ?a - agent ?l - location)
    (time-at ?t - time)
    (next ?t1 - time ?t2 - time)
    (road ?from - location ?to - location)
    (wait-slot ?l - location ?t1 - time ?t2 - time)
    (travel-slot ?from - location ?to - location ?t1 - time ?t2 - time)
    (meet-slot ?p - person ?l - location ?t1 - time ?t2 - time)
    (available ?p - person ?l - location ?t - time)
    (met ?a - agent ?p - person)
  )

  (:action wait
    :parameters (?a - agent ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?l)
      (time-at ?t1)
      (wait-slot ?l ?t1 ?t2)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (time-at ?t1))
      (time-at ?t2)
    )
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?from)
      (time-at ?t1)
      (road ?from ?to)
      (travel-slot ?from ?to ?t1 ?t2)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
      (not (time-at ?t1))
      (time-at ?t2)
    )
  )

  (:action meet
    :parameters (?a - agent ?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?a ?l)
      (time-at ?t1)
      (meet-slot ?p ?l ?t1 ?t2)
      (available ?p ?l ?t1)
      (available ?p ?l ?t2)
      (next ?t1 ?t2)
      (not (met ?a ?p))
    )
    :effect (and
      (met ?a ?p)
      (not (time-at ?t1))
      (time-at ?t2)
    )
  )
)