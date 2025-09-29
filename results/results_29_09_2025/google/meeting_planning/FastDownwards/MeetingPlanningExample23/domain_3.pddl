(define (domain bayview-scheduling-classical)
  (:requirements :typing :negative-preconditions :action-costs :adl)
  (:types person location time)

  (:predicates
    (at ?p - person ?l - location)
    (now ?t - time)
    (plus23 ?t - time ?t2 - time)
    (plus75 ?t - time ?t2 - time)
    (john-window-start ?t - time)
    (met-john)
    (route ?from - location ?to - location)
    (is-visitor ?p - person)
    (is-john ?p - person)
    (is-russianhill ?l - location)
  )

  (:functions
    (total-cost)
  )

  (:action travel
    :parameters (?t - time ?t2 - time ?p - person ?from - location ?to - location)
    :precondition (and (now ?t) (plus23 ?t ?t2) (at ?p ?from) (route ?from ?to))
    :effect (and
      (not (now ?t))
      (now ?t2)
      (not (at ?p ?from))
      (at ?p ?to)
      (increase (total-cost) 23)
    )
  )

  (:action meet-with-john
    :parameters (?v - person ?j - person ?l - location ?t - time ?t2 - time)
    :precondition (and (now ?t) (plus75 ?t ?t2) (john-window-start ?t) (at ?v ?l) (at ?j ?l) (is-visitor ?v) (is-john ?j) (is-russianhill ?l))
    :effect (and
      (not (now ?t))
      (now ?t2)
      (met-john)
      (increase (total-cost) 75)
    )
  )
)