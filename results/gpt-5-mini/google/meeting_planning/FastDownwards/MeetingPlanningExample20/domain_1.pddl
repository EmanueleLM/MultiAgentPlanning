(define (domain meeting-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location timepoint)
  (:constants
    traveler - agent
    Chinatown NobHill - location
    t0900 t1122 t1130 t1245 t1515 - timepoint
  )
  (:predicates
    (at ?a - agent ?l - location)
    (current-time ?t - timepoint)
    (joseph-at ?l - location)
    (met ?a - agent)
  )

  (:action wait-to-1122
    :parameters ()
    :precondition (and (current-time t0900) (at traveler Chinatown))
    :effect (and
              (not (current-time t0900))
              (current-time t1122)
              (increase (total-cost) 142)
            )
  )

  (:action travel-to-nobhill
    :parameters ()
    :precondition (and (current-time t1122) (at traveler Chinatown))
    :effect (and
              (not (at traveler Chinatown))
              (at traveler NobHill)
              (not (current-time t1122))
              (current-time t1130)
              (increase (total-cost) 8)
            )
  )

  (:action meet-1130-1245
    :parameters ()
    :precondition (and (current-time t1130) (at traveler NobHill) (joseph-at NobHill))
    :effect (and
              (met traveler)
              (not (current-time t1130))
              (current-time t1245)
              (increase (total-cost) 75)
            )
  )
)