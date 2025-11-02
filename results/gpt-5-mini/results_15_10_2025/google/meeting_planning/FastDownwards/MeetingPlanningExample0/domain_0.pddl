(define (domain traveler-meetings)
  (:requirements :strips :typing :fluents :negative-preconditions :equality)
  (:types agent person location)
  (:predicates
    (at ?a - agent ?l - location)
    (available ?p - person ?l - location)
    (met ?a - agent ?p - person)
  )
  (:functions
    (time) ; minutes since midnight
  )

  ;; Travel Marina -> Mission (20 minutes)
  (:action travel-marina-to-mission
    :parameters ()
    :precondition (and (at traveler MarinaDistrict))
    :effect (and
      (not (at traveler MarinaDistrict))
      (at traveler MissionDistrict)
      (increase (time) 20)
    )
  )

  ;; Travel Mission -> Marina (19 minutes)
  (:action travel-mission-to-marina
    :parameters ()
    :precondition (and (at traveler MissionDistrict))
    :effect (and
      (not (at traveler MissionDistrict))
      (at traveler MarinaDistrict)
      (increase (time) 19)
    )
  )

  ;; Wait 10 minutes (repeatable) to allow reaching exact meeting start
  (:action wait-10
    :parameters ()
    :precondition (and)
    :effect (and
      (increase (time) 10)
    )
  )

  ;; Meet Stephanie for a contiguous 120 minutes.
  ;; Meeting must start between 10:30 (630) and 11:30 (690) inclusive so that it finishes by 13:30 (810).
  (:action meet-stephanie
    :parameters ()
    :precondition (and
      (at traveler MissionDistrict)
      (available stephanie MissionDistrict)
      (not (met traveler stephanie))
      (>= (time) 630)
      (<= (time) 690)
    )
    :effect (and
      (met traveler stephanie)
      (increase (time) 120)
    )
  )
)