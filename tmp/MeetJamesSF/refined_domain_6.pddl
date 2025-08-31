(define (domain meet-orchestrated)
  (:requirements :strips :typing :equality :action-costs)
  (:types person location time)
  (:constants traveler james - person)
  (:predicates
    (at ?p - person ?l - location ?t - time)
    (met ?a - person ?b - person)
    (next ?t1 - time ?t2 - time)
    (allowed-at ?p - person ?t - time)
  )
  (:functions (total-cost))

  (:action travel_traveler
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ?from ?t1)
      (next ?t1 ?t2)
      (allowed-at traveler ?t2)
    )
    :effect (and
      (at traveler ?to ?t2)
      (not (at traveler ?from ?t1))
      (increase (total-cost) 15)
    )
  )

  (:action wait_traveler
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at traveler ?l ?t1)
      (next ?t1 ?t2)
      (allowed-at traveler ?t2)
    )
    :effect (and
      (at traveler ?l ?t2)
      (not (at traveler ?l ?t1))
      (increase (total-cost) 0)
    )
  )

  (:action wait_james
    :parameters (?l - location ?t1 - time ?t2 - time)
    :precondition (and
      (at james ?l ?t1)
      (next ?t1 ?t2)
      (allowed-at james ?t2)
    )
    :effect (and
      (at james ?l ?t2)
      (not (at james ?l ?t1))
      (increase (total-cost) 0)
    )
  )

  (:action meet_75
    :parameters (?l - location ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time)
    :precondition (and
      (next ?t1 ?t2) (next ?t2 ?t3) (next ?t3 ?t4) (next ?t4 ?t5) (next ?t5 ?t6)
      (at traveler ?l ?t1) (at traveler ?l ?t2) (at traveler ?l ?t3) (at traveler ?l ?t4) (at traveler ?l ?t5) (at traveler ?l ?t6)
      (at james ?l ?t1)    (at james ?l ?t2)    (at james ?l ?t3)    (at james ?l ?t4)    (at james ?l ?t5)    (at james ?l ?t6)
    )
    :effect (and
      (met traveler james)
      (increase (total-cost) 0)
    )
  )
)