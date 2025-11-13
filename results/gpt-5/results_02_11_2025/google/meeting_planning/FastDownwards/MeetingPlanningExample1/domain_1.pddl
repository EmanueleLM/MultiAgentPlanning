(define (domain meetingplanningexample1)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location person time
  )
  (:predicates
    (now ?t - time)
    (succ ?t1 - time ?t2 - time)
    (dur3 ?t1 - time ?t2 - time)     ; 15-minute jump (3 ticks)
    (dur5 ?t1 - time ?t2 - time)     ; 25-minute jump (rounded-up travel)
    (dur12 ?t1 - time ?t2 - time)    ; 60-minute jump (12 ticks)
    (at ?l - location)
    (edge ?from - location ?to - location)
    (avail15 ?p - person ?l - location ?t1 - time ?t2 - time)
    (avail60_betty ?t1 - time ?t2 - time)
    (met ?p - person)
  )

  (:action wait5
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (now ?t1) (succ ?t1 ?t2))
    :effect (and (not (now ?t1)) (now ?t2))
  )

  (:action move
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (now ?t1)
      (at ?from)
      (edge ?from ?to)
      (dur5 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action meet15
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (now ?t1)
      (at ?l)
      (avail15 ?p ?l ?t1 ?t2)
      (dur3 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (met ?p)
    )
  )

  (:action meet_betty60
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (now ?t1)
      (at financial_district)
      (avail60_betty ?t1 ?t2)
      (dur12 ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (met betty)
    )
  )
)