(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :fluents :equality)
  (:types person location)
  (:predicates
    (at ?p - person ?l - location)
    (met_matthew)
  )
  (:functions
    (time)
    (meetings)
  )

  (:action travel_nob_to_pres
    :parameters (?p - person)
    :precondition (at ?p nob_hill)
    :effect (and
      (not (at ?p nob_hill))
      (at ?p presidio)
      (increase (time) 17)
    )
  )

  (:action travel_pres_to_nob
    :parameters (?p - person)
    :precondition (at ?p presidio)
    :effect (and
      (not (at ?p presidio))
      (at ?p nob_hill)
      (increase (time) 18)
    )
  )

  (:action meet_matthew_30
    :parameters (?p - person)
    :precondition (and
      (at ?p presidio)
      (not (met_matthew))
      (>= (time) 660)                      ; earliest start 11:00
      (<= (+ (time) 30) 915)              ; finish by 15:15
    )
    :effect (and
      (met_matthew)
      (increase (time) 30)
      (increase (meetings) 1)
    )
  )

  (:action meet_matthew_45
    :parameters (?p - person)
    :precondition (and
      (at ?p presidio)
      (not (met_matthew))
      (>= (time) 660)
      (<= (+ (time) 45) 915)
    )
    :effect (and
      (met_matthew)
      (increase (time) 45)
      (increase (meetings) 1)
    )
  )

  (:action wait_1min
    :parameters (?p - person ?l - location)
    :precondition (at ?p ?l)
    :effect (increase (time) 1)
  )
)