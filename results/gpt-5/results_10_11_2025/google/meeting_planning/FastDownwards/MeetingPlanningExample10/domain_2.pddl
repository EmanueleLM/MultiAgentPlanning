(define (domain meeting-planning-sf-fixed)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location time)
  (:constants
    ggp marina - location
  )
  (:predicates
    (at ?l - location)
    (cur ?t - time)
    (next ?t1 - time ?t2 - time)
    (plus16 ?t1 - time ?t2 - time)
    (plus18 ?t1 - time ?t2 - time)
    (plus15win ?t1 - time ?t2 - time)
    (met-james)
  )
  (:functions (total-cost))

  (:action wait1
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (cur ?t1) (next ?t1 ?t2))
    :effect (and
      (not (cur ?t1))
      (cur ?t2)
    )
  )

  (:action travel_ggp_to_marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (cur ?t1)
      (at ggp)
      (plus16 ?t1 ?t2)
    )
    :effect (and
      (not (cur ?t1))
      (cur ?t2)
      (not (at ggp))
      (at marina)
      (increase (total-cost) 16)
    )
  )

  (:action travel_marina_to_ggp
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (cur ?t1)
      (at marina)
      (plus18 ?t1 ?t2)
    )
    :effect (and
      (not (cur ?t1))
      (cur ?t2)
      (not (at marina))
      (at ggp)
      (increase (total-cost) 18)
    )
  )

  (:action meet_james_15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (cur ?t1)
      (at marina)
      (plus15win ?t1 ?t2)
    )
    :effect (and
      (not (cur ?t1))
      (cur ?t2)
      (met-james)
    )
  )
)