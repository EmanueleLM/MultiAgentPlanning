(define (domain meeting-domain)
  (:requirements :typing :durative-actions :fluents :numeric-fluents :timed-initial-literals :negative-preconditions :equality)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )
  (:functions
    (meeting-length) ; total minutes of meeting accumulated (objective)
  )

  ;; Traveler moves between locations (fixed travel time 7 minutes)
  (:durative-action traveler-move
    :parameters (?from - location ?to - location)
    :duration (= ?duration 7)
    :condition (and
                 (at start (at traveler ?from))
                )
    :effect (and
              (at start (not (at traveler ?from)))
              (at end (at traveler ?to))
            )
  )

  ;; Sarah can move as a distinct action (kept separate for multi-agent clarity).
  ;; Travel time symmetric and also 7 minutes if used.
  (:durative-action sarah-move
    :parameters (?from - location ?to - location)
    :duration (= ?duration 7)
    :condition (and
                 (at start (at sarah ?from))
                )
    :effect (and
              (at start (not (at sarah ?from)))
              (at end (at sarah ?to))
            )
  )

  ;; Meeting action: requires both agents co-located at start; Sarah must remain at the location for the entire meeting
  ;; Duration is flexible but constrained between 105 and 120 minutes (Sarah's availability window length).
  ;; The meeting contributes its duration to the numeric fluent meeting-length (this is what we maximize).
  (:durative-action meet
    :parameters (?loc - location)
    :duration (and (>= ?duration 105) (<= ?duration 120))
    :condition (and
                 (at start (at traveler ?loc))
                 (at start (at sarah ?loc))
                 (over all (at sarah ?loc))  ; Sarah must remain at the location for the whole meeting
                )
    :effect (and
              (at end (met))
              (at end (increase (meeting-length) ?duration))
            )
  )
)