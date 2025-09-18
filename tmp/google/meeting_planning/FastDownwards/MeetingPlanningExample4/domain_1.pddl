(define (domain integrated-visit-classical)
  (:requirements :typing :negative-preconditions :action-costs :equality)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location)
    (now ?t - time)
    (succ ?t1 - time ?t2 - time)
    (chain2 ?t1 - time ?t2 - time)
    (chain12 ?t1 - time ?t2 - time)
    (jessica-at ?l - location ?t - time)
    (idle)
    (met ?v - person ?j - person)
  )

  (:functions (total-cost))

  (:action visitor-travel-presidio-to-marina
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (chain2 ?t ?t2) (at visitor Presidio) (idle))
    :effect (and
      (not (at visitor Presidio))
      (at visitor MarinaDistrict)
      (not (now ?t))
      (now ?t2)
      (increase (total-cost) 1)
    )
  )

  (:action visitor-travel-marina-to-presidio
    :parameters (?t - time ?t2 - time)
    :precondition (and (now ?t) (chain2 ?t ?t2) (at visitor MarinaDistrict) (idle))
    :effect (and
      (not (at visitor MarinaDistrict))
      (at visitor Presidio)
      (not (now ?t))
      (now ?t2)
      (increase (total-cost) 1)
    )
  )

  (:action visitor-wait-1
    :parameters (?t - time ?t1 - time)
    :precondition (and (now ?t) (succ ?t ?t1) (idle))
    :effect (and
      (not (now ?t))
      (now ?t1)
      (increase (total-cost) 1)
    )
  )

  (:action meet-visitor-jessica-60
    :parameters (?t - time ?tend - time ?loc - location)
    :precondition (and
      (now ?t)
      (chain12 ?t ?tend)
      (at visitor ?loc)
      (jessica-at ?loc ?t)
      (jessica-at ?loc ?tend)
      (idle)
    )
    :effect (and
      (not (now ?t))
      (now ?tend)
      (met visitor jessica)
      (increase (total-cost) 1)
    )
  )
)