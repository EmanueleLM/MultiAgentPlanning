(define (domain meet-orchestrator)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :timed-initial-literals :numeric-fluents)
  (:types agent location)

  (:predicates
    (at ?ag - agent ?loc - location)
    (met ?a - agent ?b - agent)
    (available-betty)
  )

  (:functions
    (met-time) ; total minutes spent meeting Betty
  )

  ;; Travel actions for "you" (explicitly named to reflect the agent)
  (:durative-action travel_you_presidio_to_north_beach
    :parameters ()
    :duration (= ?duration 18)
    :condition (and
                 (at start (at you presidio))
               )
    :effect (and
              (at end (not (at you presidio)))
              (at end (at you north_beach))
            )
  )

  (:durative-action travel_you_north_beach_to_presidio
    :parameters ()
    :duration (= ?duration 17)
    :condition (and
                 (at start (at you north_beach))
               )
    :effect (and
              (at end (not (at you north_beach)))
              (at end (at you presidio))
            )
  )

  ;; (Optional) travel actions for Betty are included but Betty's schedule is modeled
  ;; via timed initial literals. These actions are available but need explicit preconditions.
  (:durative-action travel_betty_north_beach_to_presidio
    :parameters ()
    :duration (= ?duration 17)
    :condition (and
                 (at start (at betty north_beach))
               )
    :effect (and
              (at end (not (at betty north_beach)))
              (at end (at betty presidio))
            )
  )

  (:durative-action travel_betty_presidio_to_north_beach
    :parameters ()
    :duration (= ?duration 18)
    :condition (and
                 (at start (at betty presidio))
               )
    :effect (and
              (at end (not (at betty presidio)))
              (at end (at betty north_beach))
            )
  )

  ;; Meeting action between "you" and "betty".
  ;; Duration is flexible but must be at least 75 minutes.
  ;; Requires both agents to be co-located at north_beach and Betty to be available for the entire meeting.
  (:durative-action meet_you_betty
    :parameters ()
    :duration (>= ?duration 75)
    :condition (and
                 (at start (at you north_beach))
                 (at start (at betty north_beach))
                 ;; Ensure Betty is available for whole meeting
                 (over all (available-betty))
                 ;; Ensure both remain at the location during the meeting
                 (over all (at you north_beach))
                 (over all (at betty north_beach))
               )
    :effect (and
              (at end (met you betty))
              (at end (increase (met-time) ?duration))
            )
  )
)