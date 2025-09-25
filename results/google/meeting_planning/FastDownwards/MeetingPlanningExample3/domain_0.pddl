(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions :equality :numeric-fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)                             ; meeting of required duration achieved
  )
  (:functions
    (clock)                           ; global clock in minutes relative to 08:00 (t=0 -> 08:00)
  )

  ;; Traveler-specific travel action: Bayview -> Golden Gate Park (22 minutes)
  (:action travel-traveler-bayview-to-ggp
    :parameters ()
    :precondition (and
      (at traveler bayview)
      (>= (clock) 60)                 ; traveler arrives at Bayview at 09:00 -> cannot depart before t=60
    )
    :effect (and
      (not (at traveler bayview))
      (at traveler ggp)
      (increase (clock) 22)           ; travel time 22 minutes
    )
  )

  ;; (Optional) traveler can wait at current location by 1 minute increments.
  ;; This allows adjusting start times if needed by the planner.
  (:action wait-1min
    :parameters (?a - agent)
    :precondition (and
      (or (at ?a bayview) (at ?a ggp))
    )
    :effect (and
      (increase (clock) 1)
    )
  )

  ;; Meeting action: both agents meet at Golden Gate Park for at least 90 minutes.
  ;; We model the required minimum meeting by making the action take exactly 90 minutes
  ;; and require that it finishes before Barbara's availability window ends (t <= 210).
  ;; Barbara's availability: 08:00..11:30 -> in minutes relative to 08:00: 0 .. 210.
  (:action traveler-meet-barbara-at-ggp
    :parameters ()
    :precondition (and
      (at traveler ggp)
      (at barbara ggp)
      (<= (+ (clock) 90) 210)         ; meeting of 90 minutes must finish by Barbara's leave time (11:30 -> t=210)
    )
    :effect (and
      (met)
      (increase (clock) 90)           ; meeting duration 90 minutes
    )
  )
)