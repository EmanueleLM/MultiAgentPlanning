(define (domain meet-orchestrated)
  (:requirements :strips :typing :negative-preconditions :action-costs :fluents :adl)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location ?t - time)
    (met ?a - person ?b - person)
    (next ?t1 - time ?t2 - time)
    (allowed-at ?p - person ?t - time)
  )

  (:functions (total-cost))

  ;; Traveler-specific instantaneous travel (15-minute step)
  (:action travel_traveler
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (= ?p traveler)
      (at ?p ?from ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
      (not (at ?p ?to ?t2))
    )
    :effect (and
      (at ?p ?to ?t2)
      (not (at ?p ?from ?t2))
    )
  )

  ;; James-specific instantaneous travel (15-minute step)
  (:action travel_james
    :parameters (?p - person ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (= ?p james)
      (at ?p ?from ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
      (not (at ?p ?to ?t2))
    )
    :effect (and
      (at ?p ?to ?t2)
      (not (at ?p ?from ?t2))
    )
  )

  ;; Traveler waits one 15-minute step (incurs cost)
  (:action wait_traveler
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (= ?p traveler)
      (at ?p ?l ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
      (not (at ?p ?l ?t2))
    )
    :effect (and
      (at ?p ?l ?t2)
      (increase (total-cost) 1)
    )
  )

  ;; James waits one 15-minute step (incurs cost)
  (:action wait_james
    :parameters (?p - person ?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (= ?p james)
      (at ?p ?l ?t1)
      (next ?t1 ?t2)
      (allowed-at ?p ?t2)
      (not (at ?p ?l ?t2))
    )
    :effect (and
      (at ?p ?l ?t2)
      (increase (total-cost) 1)
    )
  )

  ;; 75-minute meeting encoded as presence at five consecutive 15-minute instants
  (:action meet_75
    :parameters (?trav - person ?j - person ?l - location
                 ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time)
    :precondition (and
      (= ?trav traveler)
      (= ?j james)
      ;; consecutive times
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      (next ?t3 ?t4)
      (next ?t4 ?t5)
      ;; both present at the location across these instants
      (at ?trav ?l ?t1) (at ?trav ?l ?t2) (at ?trav ?l ?t3) (at ?trav ?l ?t4) (at ?trav ?l ?t5)
      (at ?j ?l ?t1)    (at ?j ?l ?t2)    (at ?j ?l ?t3)    (at ?j ?l ?t4)    (at ?j ?l ?t5)
    )
    :effect (and
      (met ?trav ?j)
    )
  )
)