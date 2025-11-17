(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (now ?t - time)
    (at ?l - location)
    (next ?t1 ?t2 - time)
    (travel_allowed ?from - location ?to - location ?t1 - time ?t2 - time)
    (james_available ?t1 - time ?t2 - time)
    (is_marina ?l - location)
    (met_james)
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time ?loc - location)
    :precondition (and (now ?t1) (at ?loc) (next ?t1 ?t2))
    :effect (and
      (not (now ?t1))
      (now ?t2)
      ; remain at same location (no (not (at ?loc)) necessary)
    )
  )

  (:action travel
    :parameters (?t1 - time ?t2 - time ?fromloc - location ?toloc - location)
    :precondition (and
      (now ?t1)
      (at ?fromloc)
      (travel_allowed ?fromloc ?toloc ?t1 ?t2)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (not (at ?fromloc))
      (at ?toloc)
    )
  )

  (:action meet-james
    :parameters (?t1 - time ?t2 - time ?loc - location)
    :precondition (and
      (now ?t1)
      (at ?loc)
      (is_marina ?loc)
      (james_available ?t1 ?t2)
      (next ?t1 ?t2)
    )
    :effect (and
      (not (now ?t1))
      (now ?t2)
      (met_james)
    )
  )
)