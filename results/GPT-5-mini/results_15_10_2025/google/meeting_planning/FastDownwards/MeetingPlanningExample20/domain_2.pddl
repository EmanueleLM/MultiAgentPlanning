(define (domain meeting-domain)
  (:requirements :typing :adl :fluents)
  (:types person location time)
  (:constants visitor joseph - person chinatown nobhill - location)
  (:predicates
    (current-time ?t - time)
    (at ?p - person ?l - location)
    (joseph-at-nobhill ?t - time)
    (meeting-start-allowed ?t - time)
    (next1 ?t - time ?t2 - time)
    (next6 ?t - time ?t2 - time)
    (next8 ?t - time ?t2 - time)
    (next75 ?t - time ?t2 - time)
    (meeting-done)
  )
  (:functions (total-cost))

  (:action travel-chinatown-to-nobhill
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (at visitor chinatown) (next8 ?t ?t2))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (at visitor chinatown)) (at visitor nobhill) (increase (total-cost) 8))
  )

  (:action travel-nobhill-to-chinatown
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (at visitor nobhill) (next6 ?t ?t2))
    :effect (and (not (current-time ?t)) (current-time ?t2) (not (at visitor nobhill)) (at visitor chinatown) (increase (total-cost) 6))
  )

  (:action wait
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (next1 ?t ?t2))
    :effect (and (not (current-time ?t)) (current-time ?t2) (increase (total-cost) 1))
  )

  (:action meet-with-joseph
    :parameters (?t - time ?t2 - time)
    :precondition (and (current-time ?t) (at visitor nobhill) (joseph-at-nobhill ?t) (meeting-start-allowed ?t) (next75 ?t ?t2))
    :effect (and (not (current-time ?t)) (current-time ?t2) (meeting-done) (increase (total-cost) 75))
  )
)