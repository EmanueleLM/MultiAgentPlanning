(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types agent place)
  (:predicates
    (at ?a - agent ?p - place)
    (meeting-initiated)
    (meeting-done)
  )
  (:functions
    (time) ; time in minutes since midnight
  )

  ; Traveler travel actions (distinct agent actions)
  (:action traveler-travel-ggp-to-ph
    :parameters ()
    :precondition (and (at traveler ggp))
    :effect (and
      (not (at traveler ggp))
      (at traveler ph)
      (increase (time) 20) ; travel duration: 20 minutes
    )
  )

  (:action traveler-travel-ph-to-ggp
    :parameters ()
    :precondition (and (at traveler ph))
    :effect (and
      (not (at traveler ph))
      (at traveler ggp)
      (increase (time) 20)
    )
  )

  ; John actions kept distinct (here John does not travel in the environment model)
  ; Meeting is modeled as two distinct actions: traveler initiates, then John participates.
  (:action traveler-initiate-meeting
    :parameters ()
    :precondition (and
      (at traveler ph)
      (at john ph)
      (not (meeting-initiated))
      (not (meeting-done))
    )
    :effect (and
      (meeting-initiated)
    )
  )

  (:action john-participate-meeting
    :parameters ()
    :precondition (and
      (meeting-initiated)
      (at traveler ph)
      (at john ph)
      (>= (time) 1185)   ; John's availability start: 19:45 -> 1185 minutes
      (<= (time) 1200)   ; meeting must start no later than 20:00 to allow 45-minute meeting finishing by 20:45
      (not (meeting-done))
    )
    :effect (and
      (not (meeting-initiated))
      (meeting-done)
      (increase (time) 45) ; meeting duration at least 45 minutes
    )
  )
)