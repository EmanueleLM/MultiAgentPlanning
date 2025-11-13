(define (domain sf-itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types location person time)
  (:predicates
    (at ?l - location)
    (at-time ?t - time)
    (next ?t1 - time ?t2 - time)
    (route18 ?from - location ?to - location)
    (route17 ?from - location ?to - location)
    (travel18 ?t1 - time ?t2 - time)
    (travel17 ?t1 - time ?t2 - time)
    (loc-of ?p - person ?l - location)
    (block ?p - person ?l - location ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at-time ?t1) (next ?t1 ?t2))
    :effect (and (not (at-time ?t1)) (at-time ?t2))
  )

  (:action travel-18
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (at-time ?t1)
      (route18 ?from ?to)
      (travel18 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action travel-17
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?from)
      (at-time ?t1)
      (route17 ?from ?to)
      (travel17 ?t1 ?t2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )

  (:action meet
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (loc-of ?p ?l)
      (at ?l)
      (at-time ?t1)
      (block ?p ?l ?t1 ?t2)
      (not (met ?p))
    )
    :effect (and
      (met ?p)
      (not (at-time ?t1))
      (at-time ?t2)
    )
  )
)