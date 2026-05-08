(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location timepoint)
  (:constants
    traveler joseph - agent
    chinatown nob_hill - location
    t0900 t1122 t1130 t1245 t1515 - timepoint
  )
  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - timepoint)
    (joseph-at ?l - location)
    (met ?a - agent)
  )

  ;; Wait in Chinatown until 11:22 (to depart so arrival at Nob Hill is 11:30)
  (:action wait-to-1122
    :parameters ()
    :precondition (and (current-time t0900) (at traveler chinatown))
    :effect (and
      (not (current-time t0900))
      (current-time t1122)
    )
  )

  ;; Travel from Chinatown to Nob Hill (8 minutes): depart at 11:22, arrive 11:30
  (:action travel-to-nob_hill
    :parameters ()
    :precondition (and (current-time t1122) (at traveler chinatown))
    :effect (and
      (not (at traveler chinatown))
      (at traveler nob_hill)
      (not (current-time t1122))
      (current-time t1130)
    )
  )

  ;; Meet Joseph starting at 11:30 for a contiguous 75 minutes (ends 12:45)
  (:action meet-1130-1245
    :parameters ()
    :precondition (and (current-time t1130) (at traveler nob_hill) (joseph-at nob_hill))
    :effect (and
      (met traveler)
      (not (current-time t1130))
      (current-time t1245)
    )
  )
)