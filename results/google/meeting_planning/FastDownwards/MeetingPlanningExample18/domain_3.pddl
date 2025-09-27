(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :adl :fluents :equality)
  (:types person location time)
  (:constants marina richmond - location)
  (:predicates
    (at ?l - location)
    (time-at ?t - time)
    (time-step-11 ?t1 ?t2 - time)
    (time-step-9 ?t1 ?t2 - time)
    (time-step-75 ?t1 ?t2 - time)
    (time-leq690 ?t - time)
    (start-allowed-betty ?t - time)
    (met-betty)
  )
  (:functions
    (friends-met)
  )

  (:action travel-marina-to-richmond
    :parameters (?t1 ?t2 - time)
    :precondition (and (at marina) (time-at ?t1) (time-step-11 ?t1 ?t2))
    :effect (and
      (not (at marina))
      (at richmond)
      (not (time-at ?t1))
      (time-at ?t2)
    )
  )

  (:action travel-richmond-to-marina
    :parameters (?t1 ?t2 - time)
    :precondition (and (at richmond) (time-at ?t1) (time-step-9 ?t1 ?t2))
    :effect (and
      (not (at richmond))
      (at marina)
      (not (time-at ?t1))
      (time-at ?t2)
    )
  )

  (:action wait-until-betty-window
    :parameters (?t1 ?t2 - time)
    :precondition (and (time-at ?t1) (time-leq690 ?t1) (start-allowed-betty ?t2))
    :effect (and
      (not (time-at ?t1))
      (time-at ?t2)
    )
  )

  (:action meet-betty-75
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at richmond)
      (time-at ?t1)
      (time-step-75 ?t1 ?t2)
      (start-allowed-betty ?t1)
      (not (met-betty))
    )
    :effect (and
      (met-betty)
      (not (time-at ?t1))
      (time-at ?t2)
      (increase (friends-met) 1)
    )
  )
)