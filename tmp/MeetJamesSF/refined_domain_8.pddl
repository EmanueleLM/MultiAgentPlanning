(define (domain meet-orchestrated)
  (:requirements :strips :typing :equality :action-costs)
  (:types person location time)
  (:predicates
    (at ?p - person ?l - location ?t - time)
    (met ?a - person ?b - person)
    (next ?t1 - time ?t2 - time)
    (allowed-at ?p - person ?t - time)
  )

  (:action travel
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
    )
    :effect (and
      (at ?p ?to ?t2)
      (not (at ?p ?from ?t1))
    )
    :cost 15
  )

  (:action wait
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
    )
    :effect (and
      (at ?p ?l ?t2)
      (not (at ?p ?l ?t1))
    )
    :cost 0
  )

  (:action meet_75
    :parameters (?p1 - person ?p2 - person ?l - location
                 ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time)
    :precondition (and
      (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6)
      (at ?p1 ?l ?t1) (at ?p1 ?l ?t2) (at ?p1 ?l ?t3) (at ?p1 ?l ?t4) (at ?p1 ?l ?t5) (at ?p1 ?l ?t6)
      (at ?p2 ?l ?t1) (at ?p2 ?l ?t2) (at ?p2 ?l ?t3) (at ?p2 ?l ?t4) (at ?p2 ?l ?t5) (at ?p2 ?l ?t6)
    )
    :effect (and
      (met ?p1 ?p2)
    )
    :cost 0
  )
)