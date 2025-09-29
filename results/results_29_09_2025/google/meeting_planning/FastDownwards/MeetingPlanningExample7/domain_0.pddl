(define (domain meeting-scheduling)
  (:requirements :strips :typing :durative-actions :negative-preconditions :equality :fluents :numeric-fluents)
  (:types agent location)
  (:constants Richmond_District North_Beach - location)
  (:predicates
    (at ?a - agent ?l - location)
  )
  (:functions
    (total-time) ; total accumulated meeting minutes
  )

  ;; Travel action between locations (fixed travel duration)
  (:durative-action travel
    :parameters (?a - agent ?from - location ?to - location)
    :duration (= ?duration 30)  ; travel duration is 30 minutes
    :condition (at start (at ?a ?from))
    :effect (and
      (at start (not (at ?a ?from)))
      (at end (at ?a ?to))
    )
  )

  ;; Meeting action: must take place while the friend (John) is present at the location.
  ;; Duration is flexible but constrained to be at least 75 minutes and at most 120 minutes
  ;; (John's availability window length), and meeting increases total-time by its duration.
  (:durative-action meet
    :parameters (?a - agent ?friend - agent ?loc - location)
    :duration (and (>= ?duration 75) (<= ?duration 120))
    :condition (and
      (at start (at ?a ?loc))
      (at start (at ?friend ?loc))
      (over all (at ?friend ?loc))  ; friend must be present during the entire meeting
    )
    :effect (at end (increase (total-time) ?duration))
  )
)