(define (domain combined-meeting)
  (:requirements :strips :typing :durative-actions :fluents :numeric)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (road ?from - location ?to - location)
    (met)                         ; global meeting-completed flag
  )
  (:functions
    (clock)  ; minutes since 9:00 AM (global clock)
  )

  ;; Visitor moves along a road (11 minutes)
  (:durative-action travel-visitor
    :parameters (?from ?to - location)
    :duration (= ?duration 11)
    :condition (and
      (at start (at visitor ?from))
      (at start (road ?from ?to))
    )
    :effect (and
      (at start (not (at visitor ?from)))
      (at end (at visitor ?to))
      (at end (increase (clock) 11))
    )
  )

  ;; Kenneth moves along a road (11 minutes)
  (:durative-action travel-kenneth
    :parameters (?from ?to - location)
    :duration (= ?duration 11)
    :condition (and
      (at start (at kenneth ?from))
      (at start (road ?from ?to))
    )
    :effect (and
      (at start (not (at kenneth ?from)))
      (at end (at kenneth ?to))
      (at end (increase (clock) 11))
    )
  )

  ;; Visitor can wait for an arbitrary non-negative amount of time
  (:durative-action wait-visitor
    :parameters (?loc - location)
    :duration (>= ?duration 0)
    :condition (at start (at visitor ?loc))
    :effect (at end (increase (clock) ?duration))
  )

  ;; Kenneth can wait for an arbitrary non-negative amount of time
  (:durative-action wait-kenneth
    :parameters (?loc - location)
    :duration (>= ?duration 0)
    :condition (at start (at kenneth ?loc))
    :effect (at end (increase (clock) ?duration))
  )

  ;; Joint meeting action: requires both agents at Nob Hill and uses the
  ;; shared availability window. Duration fixed to 90 minutes.
  ;; Window for start time (minutes since 9:00 AM): [315, 555] which
  ;; corresponds to 14:15..18:15 start (so meeting ends by 19:45).
  (:durative-action meeting
    :parameters ()
    :duration (= ?duration 90)
    :condition (and
      (at start (at visitor nob_hill))
      (at start (at kenneth nob_hill))
      (at start (>= (clock) 315))   ; earliest start 14:15
      (at start (<= (clock) 555))   ; latest start so 90-min meeting ends by 19:45
    )
    :effect (and
      (at end (met))
      (at end (increase (clock) 90))
    )
  )
)