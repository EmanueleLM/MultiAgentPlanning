(define (domain meeting-planning)
  (:requirements :strips :typing :durative-actions :negative-preconditions :action-costs)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (stephanie-available ?l - location) ; Stephanie's availability at a specific location
    (meeting-occurred ?a1 - agent ?a2 - agent) ; To signal that a meeting has completed
    (is-traveler ?a - agent)
    (is-stephanie ?a - agent)
  )
  (:functions
    (total-cost)
  )

  (:durative-action travel
    :parameters (?a - agent ?from - location ?to - location)
    :duration (= ?duration 20)
    :condition (and
      (at start (at ?a ?from))
      (at start (not (at ?a ?to)))
    )
    :effect (and
      (at start (not (at ?a ?from)))
      (at end (at ?a ?to))
      (at end (increase (total-cost) 1))
    )
  )

  (:durative-action meet-stephanie
    :parameters (?traveler - agent ?stephanie - agent ?loc - location)
    :duration (and (>= ?duration 120)) ; Minimum 120 minutes meeting
    :condition (and
      (at start (is-traveler ?traveler))
      (at start (is-stephanie ?stephanie))
      (at start (at ?traveler ?loc))
      (at start (stephanie-available ?loc)) ; Stephanie must be available at start
      (at end (stephanie-available ?loc))   ; Stephanie must still be available at end (continuous availability)
    )
    :effect (and
      (at end (meeting-occurred ?traveler ?stephanie))
      (at end (increase (total-cost) 1))
    )
  )
)