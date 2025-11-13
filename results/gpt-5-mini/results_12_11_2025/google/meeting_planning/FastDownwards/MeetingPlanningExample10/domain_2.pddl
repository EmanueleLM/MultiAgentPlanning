(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types location time)

  (:predicates
    (now ?t - time)
    (at ?l - location)
    (next ?t1 ?t2 - time)
    (travel_allowed ?from - location ?to - location ?t1 - time ?t2 - time)
    (james_available ?t1 - time ?t2 - time)
    (met_james)
  )

  (:action wait
    :parameters (?from - time ?to - time ?loc - location)
    :precondition (and (now ?from) (at ?loc) (next ?from ?to))
    :effect (and (not (now ?from)) (now ?to))
  )

  (:action travel
    :parameters (?from - time ?to - time ?fromloc - location ?toloc - location)
    :precondition (and (now ?from) (at ?fromloc) (travel_allowed ?fromloc ?toloc ?from ?to))
    :effect (and
      (not (now ?from)) (now ?to)
      (not (at ?fromloc)) (at ?toloc)
    )
  )

  (:action meet-james
    :parameters (?from - time ?to - time)
    :precondition (and (now ?from) (at marina_district) (james_available ?from ?to) (next ?from ?to))
    :effect (and
      (not (now ?from)) (now ?to)
      (met_james)
    )
  )
)