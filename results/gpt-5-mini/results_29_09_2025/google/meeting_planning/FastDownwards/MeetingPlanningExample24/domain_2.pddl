(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types person location)
  (:predicates
    (at ?p - person ?l - location)
    (met_matthew)
    (matthew_available)
    (visitor_prefers_short)
  )

  (:action travel_nob_to_pres_17
    :parameters (?p - person)
    :precondition (at ?p nob_hill)
    :effect (and
      (not (at ?p nob_hill))
      (at ?p presidio)
    )
  )

  (:action travel_pres_to_nob_18
    :parameters (?p - person)
    :precondition (at ?p presidio)
    :effect (and
      (not (at ?p presidio))
      (at ?p nob_hill)
    )
  )

  (:action meet_matthew_30
    :parameters (?p - person)
    :precondition (and
      (at ?p presidio)
      (matthew_available)
      (not (met_matthew))
    )
    :effect (and
      (met_matthew)
    )
  )

  (:action meet_matthew_45
    :parameters (?p - person)
    :precondition (and
      (at ?p presidio)
      (matthew_available)
      (not (met_matthew))
    )
    :effect (and
      (met_matthew)
    )
  )

  (:action wait
    :parameters (?p - person ?l - location)
    :precondition (at ?p ?l)
    :effect (and
      (at ?p ?l)
    )
  )
)