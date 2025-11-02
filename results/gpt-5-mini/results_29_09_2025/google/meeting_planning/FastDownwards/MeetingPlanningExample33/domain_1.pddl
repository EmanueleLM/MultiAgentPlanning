(define (domain multiagent-meetings)
  (:requirements :strips :typing :equality :negative-preconditions :adl :action-costs)
  (:types agent location)
  (:predicates
    (at-traveler-sd)
    (at-traveler-us)
    (sarah-met)
  )
  (:functions
    (current-time)
    (total-meetings)
  )

  (:action travel-sd-to-us-by-traveler
    :parameters ()
    :precondition (and
      (at-traveler-sd)
    )
    :effect (and
      (not (at-traveler-sd))
      (at-traveler-us)
      (increase (current-time) 30)
    )
  )

  (:action travel-us-to-sd-by-traveler
    :parameters ()
    :precondition (and
      (at-traveler-us)
    )
    :effect (and
      (not (at-traveler-us))
      (at-traveler-sd)
      (increase (current-time) 26)
    )
  )

  (:action meet-friend-at-sd-by-traveler
    :parameters ()
    :precondition (and
      (at-traveler-sd)
    )
    :effect (and
      (increase (current-time) 15)
      (increase (total-meetings) 1)
    )
  )

  (:action meet-sarah-at-us-by-traveler
    :parameters ()
    :precondition (and
      (at-traveler-us)
      (>= (current-time) 750)
      (<= (+ (current-time) 15) 1290)
      (not (sarah-met))
    )
    :effect (and
      (increase (current-time) 15)
      (increase (total-meetings) 1)
      (sarah-met)
    )
  )
)