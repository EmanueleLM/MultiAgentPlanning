(define (domain sf-meet)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals)
  (:types agent location)
  (:predicates
    (at-visitor ?l - location)
    (at-jessica ?l - location)
    (available-visitor)
    (available-jessica)
    (meeting-slot-375)  ; short marker forcing meeting to start at 375
    (met)               ; meeting completed
  )

  ;; Visitor travel action (distinct from Jessica's)
  (:durative-action travel-visitor
    :parameters (?from ?to - location)
    :duration (= ?duration 15)
    :condition (and
                 (at start (at-visitor ?from))
                )
    :effect (and
              (at start (not (at-visitor ?from)))
              (at end (at-visitor ?to))
            )
  )

  ;; Jessica travel action (kept distinct though Jessica is mostly fixed by timed literals)
  (:durative-action travel-jessica
    :parameters (?from ?to - location)
    :duration (= ?duration 15)
    :condition (and
                 (at start (at-jessica ?from))
                )
    :effect (and
              (at start (not (at-jessica ?from)))
              (at end (at-jessica ?to))
            )
  )

  ;; Meeting action distinct for the two agents: requires both at same location,
  ;; both available for entire meeting, and requires meeting-slot-375 at start
  (:durative-action meet-visitor-jessica
    :parameters (?loc - location)
    :duration (>= ?duration 90)
    :condition (and
                 (at start (at-visitor ?loc))
                 (at start (at-jessica ?loc))
                 (at start (meeting-slot-375))         ; forces start at 375 (15:15)
                 (over all (at-visitor ?loc))
                 (over all (at-jessica ?loc))
                 (over all (available-visitor))
                 (over all (available-jessica))
                )
    :effect (and
              (at end (met))
            )
  )
)