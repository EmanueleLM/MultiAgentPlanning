(define (domain multi-agent-meeting)
  (:requirements :typing :durative-actions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (available ?a - agent)
    (met)
  )

  ;; Traveler's travel action (Chinatown -> Marina; 12 minutes)
  (:durative-action travel-traveler
    :parameters ()
    :duration (= ?duration 12)
    :condition (and
      (at start (at traveler Chinatown))
    )
    :effect (and
      (at start (not (at traveler Chinatown)))
      (at end   (at traveler Marina))
    )
  )

  ;; Stephanie's travel action (Marina -> Chinatown; 16 minutes)
  ;; Kept distinct from travel-traveler although not required for the current plan.
  (:durative-action travel-stephanie
    :parameters ()
    :duration (= ?duration 16)
    :condition (and
      (at start (at stephanie Marina))
    )
    :effect (and
      (at start (not (at stephanie Marina)))
      (at end   (at stephanie Chinatown))
    )
  )

  ;; Meeting action between traveler and Stephanie, fixed duration 105 minutes.
  ;; Requires both to be at Marina at meeting start and Stephanie to remain available for the whole meeting.
  (:durative-action meet-traveler-stephanie
    :parameters ()
    :duration (= ?duration 105)
    :condition (and
      (at start (at traveler Marina))
      (at start (at stephanie Marina))
      (over all (available stephanie))
    )
    :effect (and
      (at end (met))
    )
  )
)