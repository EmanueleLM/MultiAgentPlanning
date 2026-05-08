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
    (current_time ?t - timepoint)
    (joseph_available ?t - timepoint) ; Joseph is present/available at this symbolic timepoint
    (met ?a - agent)
  )

  ;; Wait in Chinatown until 11:22 so that departing then (travel 8 minutes) arrives at 11:30
  (:action wait-to-1122
    :parameters ()
    :precondition (and (current_time t0900) (at traveler chinatown))
    :effect (and
      (not (current_time t0900))
      (current_time t1122)
    )
  )

  ;; Travel from Chinatown to Nob Hill (8 minutes): depart at 11:22, arrive 11:30
  (:action travel-chinatown-to-nob_hill
    :parameters ()
    :precondition (and (current_time t1122) (at traveler chinatown))
    :effect (and
      (not (at traveler chinatown))
      (at traveler nob_hill)
      (not (current_time t1122))
      (current_time t1130)
    )
  )

  ;; Meet Joseph starting at 11:30 for a contiguous 75 minutes (ends 12:45).
  ;; Requires Joseph to be available at both the meeting start and end timepoints
  (:action meet-joseph-1130-1245
    :parameters ()
    :precondition (and (current_time t1130) (at traveler nob_hill)
                       (joseph_available t1130) (joseph_available t1245))
    :effect (and
      (met traveler)
      (not (current_time t1130))
      (current_time t1245)
    )
  )
)