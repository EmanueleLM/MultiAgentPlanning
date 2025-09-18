(define (domain integrated-meeting)
  (:requirements :strips :durative-actions :typing :fluents :numeric-fluents)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (met)                          ; meeting achieved
  )

  (:functions
    (current-time)                 ; minutes since midnight
    (meeting-quality)              ; numeric score to maximize (sum of meeting duration)
    (avail-start-presidio)         ; Sarah's availability start at Presidio (minutes)
    (avail-end-presidio)           ; Sarah's availability end at Presidio (minutes)
  )

  ;; Generic travel action (from first agent description)
  (:durative-action travel-generic
    :parameters (?from - location ?to - location ?a - agent)
    :duration (= ?duration 7)
    :condition (and
                 (at start (at ?a ?from))
               )
    :effect (and
              (at end (not (at ?a ?from)))
              (at end (at ?a ?to))
              (at end (increase (current-time) ?duration))
            )
  )

  ;; Explicit travel action Richmond -> Presidio (from second agent description)
  (:durative-action travel-richmond-presidio
    :parameters (?trav - agent ?from - location ?to - location)
    :duration (= ?duration 7)
    :condition (and
                 (at start (at ?trav ?from))
               )
    :effect (and
              (at end (not (at ?trav ?from)))
              (at end (at ?trav ?to))
              (at end (increase (current-time) ?duration))
            )
  )

  ;; Explicit travel action Presidio -> Richmond (from second agent description)
  (:durative-action travel-presidio-richmond
    :parameters (?trav - agent ?from - location ?to - location)
    :duration (= ?duration 7)
    :condition (and
                 (at start (at ?trav ?from))
               )
    :effect (and
              (at end (not (at ?trav ?from)))
              (at end (at ?trav ?to))
              (at end (increase (current-time) ?duration))
            )
  )

  ;; Generic wait action (first agent)
  (:durative-action wait-generic
    :parameters (?a - agent)
    :duration (= ?duration ?dur)
    :condition ()
    :effect (and
              (at end (increase (current-time) ?duration))
            )
  )

  ;; Wait at location with "over all" to ensure staying in place (second agent)
  (:durative-action wait-at-location
    :parameters (?trav - agent ?loc - location)
    :duration (>= ?d 0)
    :condition (and
                 (at start (at ?trav ?loc))
                 (over all (at ?trav ?loc))
               )
    :effect (and
              (at end (at ?trav ?loc))
              (at end (increase (current-time) ?d))
            )
  )

  ;; Joint meeting action: requires traveler and Sarah to be at Presidio.
  ;; Meeting duration must be at least 105 and at most 120 (to incorporate first agent's flexibility).
  ;; Meeting cannot start before avail-start-presidio and must finish by avail-end-presidio.
  ;; Meeting increases meeting-quality by meeting duration and sets (met).
  (:durative-action meet-at-presidio
    :parameters (?trav - agent ?s - agent ?loc - location)
    :duration (and (>= ?duration 105) (<= ?duration 120))
    :condition (and
                 (at start (at ?trav ?loc))
                 (at start (at ?s ?loc))
                 (at start (>= (current-time) (avail-start-presidio)))
                 (at start (<= (+ (current-time) ?duration) (avail-end-presidio)))
                 (over all (at ?trav ?loc))
                 (over all (at ?s ?loc))
               )
    :effect (and
              (at end (increase (current-time) ?duration))
              (at end (increase (meeting-quality) ?duration))
              (at end (met))
            )
  )
)