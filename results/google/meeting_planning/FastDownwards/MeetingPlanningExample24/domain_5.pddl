(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :equality :fluents)
  (:types person location)
  (:constants
    nob_hill presidio - location
  )
  (:predicates
    (at ?p - person ?l - location)
    (met_matthew)
  )
  (:functions
    (current_time) ; minutes since 09:00 (initial = 0)
    (meet_count)
  )

  (:action travel_nob_to_pres_17
    :parameters (?p - person)
    :precondition (at ?p nob_hill)
    :effect (and
      (not (at ?p nob_hill))
      (at ?p presidio)
      (increase (current_time) 17)
    )
  )

  (:action travel_pres_to_nob_18
    :parameters (?p - person)
    :precondition (at ?p presidio)
    :effect (and
      (not (at ?p presidio))
      (at ?p nob_hill)
      (increase (current_time) 18)
    )
  )

  (:action meet_matthew_30
    :parameters (?p - person)
    :precondition (and
      (at ?p presidio)
      (not (met_matthew))
      (>= (current_time) 120)                  ; Matthew available start at 11:00 -> 120 minutes after 09:00
      (<= (+ (current_time) 30) 375)          ; meeting must end by 15:15 -> 375 minutes after 09:00
    )
    :effect (and
      (met_matthew)
      (increase (current_time) 30)
      (increase (meet_count) 1)
    )
  )

  (:action meet_matthew_45
    :parameters (?p - person)
    :precondition (and
      (at ?p presidio)
      (not (met_matthew))
      (>= (current_time) 120)
      (<= (+ (current_time) 45) 375)
    )
    :effect (and
      (met_matthew)
      (increase (current_time) 45)
      (increase (meet_count) 1)
    )
  )

  (:action wait_1_min
    :parameters (?p - person ?l - location)
    :precondition (at ?p ?l)
    :effect (increase (current_time) 1)
  )
)