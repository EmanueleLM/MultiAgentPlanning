(define (domain meet-orchestrated)
  (:requirements :strips :typing :negative-preconditions :action-costs :adl)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (met ?a - person ?b - person)
    (next ?t1 - time ?t2 - time)
    (allowed-at ?p - person ?t - time)
  )

  (:action travel_traveler
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
      (not (at ?p ?to ?t2))
    )
    :effect (and
      (at ?p ?to ?t2)
      (not (at ?p ?from ?t2))
    )
    :cost 0
  )

  (:action travel_james
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?from ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
      (not (at ?p ?to ?t2))
    )
    :effect (and
      (at ?p ?to ?t2)
      (not (at ?p ?from ?t2))
    )
    :cost 0
  )

  (:action wait_traveler
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
      (not (at ?p ?l ?t2))
    )
    :effect (and
      (at ?p ?l ?t2)
      (not (at ?p ?l ?t2)) ; keep STRIPS-compatible: moving occupancy from t1 to t2
      (not (at ?p ?l ?t1))
    )
    :cost 1
  )

  (:action wait_james
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at ?p ?l ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
      (not (at ?p ?l ?t2))
    )
    :effect (and
      (at ?p ?l ?t2)
      (not (at ?p ?l ?t2))
      (not (at ?p ?l ?t1))
    )
    :cost 1
  )

  (:action meet_75
    :parameters (?trav - person ?j - person ?l - location
                 ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time)
    :precondition (and
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      (next ?t3 ?t4)
      (next ?t4 ?t5)
      (next ?t5 ?t6)
      (at ?trav ?l ?t1) (at ?trav ?l ?t2) (at ?trav ?l ?t3) (at ?trav ?l ?t4) (at ?trav ?l ?t5) (at ?trav ?l ?t6)
      (at ?j ?l ?t1)    (at ?j ?l ?t2)    (at ?j ?l ?t3)    (at ?j ?l ?t4)    (at ?j ?l ?t5)    (at ?j ?l ?t6)
    )
    :effect (and
      (met ?trav ?j)
    )
    :cost 0
  )
)