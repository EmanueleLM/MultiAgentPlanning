(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions :equality :fluents :disjunctive-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )
  (:functions
    (clock)
  )

  (:action travel-traveler-bayview-to-ggp
    :parameters ()
    :precondition (and
      (at traveler bayview)
      (>= (clock) 60)
    )
    :effect (and
      (not (at traveler bayview))
      (at traveler ggp)
      (increase (clock) 22)
    )
  )

  (:action wait-1min
    :parameters (?a - agent)
    :precondition (or (at ?a bayview) (at ?a ggp))
    :effect (and
      (increase (clock) 1)
    )
  )

  (:action traveler-meet-barbara-at-ggp
    :parameters ()
    :precondition (and
      (at traveler ggp)
      (at barbara ggp)
      (<= (+ (clock) 90) 210)
    )
    :effect (and
      (met)
      (increase (clock) 90)
    )
  )
)