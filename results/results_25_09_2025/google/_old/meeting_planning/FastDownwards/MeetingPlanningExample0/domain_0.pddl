(define (domain combined-meet-domain)
  (:requirements :durative-actions :typing :numeric-fluents :negative-preconditions :timed-initial-literals)
  (:types location)
  (:predicates
    ;; Agent-1 style location predicate
    (at ?l - location)

    ;; Agent-2 style location predicate
    (at-you ?l - location)

    ;; Stephanie presence (modeled as timed initial literals in the problem)
    (stephanie-at ?l - location)

    ;; resource preventing concurrent actions (used by agent1's model)
    (available)

    ;; goal predicate: met Stephanie for required time
    (met)
  )

  (:functions
    ;; minutes since start-time (start-time corresponds to 9:00AM)
    (current-time)
  )

  ;; --------------------------
  ;; Agent-1 travel actions (keeps action names distinct)
  ;; These update both representations of location (at and at-you),
  ;; consume the shared resource 'available', and advance current-time.
  (:durative-action move-marina-to-mission
    :parameters ()
    :duration (= ?duration 20)
    :condition (and
                 (at start (at marina))
                 (at start (available))
                )
    :effect (and
             (at start (not (available)))
             ;; update agent-1 location
             (at end (not (at marina)))
             (at end (at mission))
             ;; update agent-2 location representation as well
             (at end (not (at-you marina)))
             (at end (at-you mission))
             (at end (available))
             (at end (increase (current-time) ?duration))
            )
  )

  (:durative-action move-mission-to-marina
    :parameters ()
    :duration (= ?duration 19)
    :condition (and
                 (at start (at mission))
                 (at start (available))
                )
    :effect (and
             (at start (not (available)))
             (at end (not (at mission)))
             (at end (at marina))
             (at end (not (at-you mission)))
             (at end (at-you marina))
             (at end (available))
             (at end (increase (current-time) ?duration))
            )
  )

  ;; Wait to advance current time (agent-1)
  (:durative-action wait
    :parameters ()
    :duration (>= ?duration 0)
    :condition (and
                 (at start (available))
                )
    :effect (and
             (at start (not (available)))
             (at end (available))
             (at end (increase (current-time) ?duration))
            )
  )

  ;; Agent-1 meeting action: flexible duration (>= 120), uses numeric current-time constraints
  ;; All times are measured relative to start-time (9:00AM = 0). Stephanie availability is 90..270.
  (:durative-action meet-stephanie
    :parameters ()
    :duration (>= ?duration 120)
    :condition (and
                 (at start (at mission))
                 (at start (available))
                 ;; Stephanie availability window expressed relative to start (9:00AM):
                 ;; available from 10:30 => 90, latest start to allow 120 min meeting => 150
                 (at start (>= (current-time) 90))
                 (at start (<= (current-time) 150))
                 ;; meeting must finish by 13:30 => 270
                 (at start (<= (+ (current-time) ?duration) 270))
                )
    :effect (and
             (at start (not (available)))
             (at end (available))
             (at end (increase (current-time) ?duration))
             ;; ensure both representations reflect being at mission at end
             (at end (at mission))
             (at end (at-you mission))
             (at end (met))
            )
  )

  ;; --------------------------
  ;; Agent-2 travel actions (distinct names). These mirror agent-1 motions
  ;; but also update the agent-1 location predicate and advance current-time,
  ;; and use 'available' to avoid concurrency.
  (:durative-action travel-marina-to-mission
    :parameters ()
    :duration (= ?duration 20)
    :condition (and
      (at start (at-you marina))
      (at start (available))
    )
    :effect (and
      (at start (not (available)))
      ;; update agent-2 location
      (at end (not (at-you marina)))
      (at end (at-you mission))
      ;; update agent-1 location representation as well
      (at end (not (at marina)))
      (at end (at mission))
      (at end (available))
      (at end (increase (current-time) ?duration))
    )
  )

  (:durative-action travel-mission-to-marina
    :parameters ()
    :duration (= ?duration 19)
    :condition (and
      (at start (at-you mission))
      (at start (available))
    )
    :effect (and
      (at start (not (available)))
      (at end (not (at-you mission)))
      (at end (at-you marina))
      (at end (not (at mission)))
      (at end (at marina))
      (at end (available))
      (at end (increase (current-time) ?duration))
    )
  )

  ;; Agent-2 meeting action: fixed 120 minutes, requires Stephanie present at start and end.
  ;; Also uses 'available' and advances current-time and ensures both location predicates hold.
  (:durative-action meet-at-mission
    :parameters ()
    :duration (= ?duration 120)
    :condition (and
      (at start (at-you mission))
      (at start (available))
      (at start (stephanie-at mission))
      (at end (stephanie-at mission))
    )
    :effect (and
      (at start (not (available)))
      (at end (available))
      (at end (increase (current-time) ?duration))
      (at end (met))
      ;; ensure both location representations are consistent
      (at end (at-you mission))
      (at end (at mission))
    )
  )
)