(define (domain meetup)
  (:requirements :typing :durative-actions :timed-initial-literals :negative-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?b - agent)
  )

  ;; Travel: Marina -> Mission (20 minutes) for "you"
  (:durative-action travel-you-marina-to-mission
    :parameters ()
    :duration (= ?duration 20)
    :condition (and
       (at start (at you marina))
    )
    :effect (and
       (at start (not (at you marina)))
       (at end (at you mission))
    )
  )

  ;; Travel: Mission -> Marina (19 minutes) for "you"
  (:durative-action travel-you-mission-to-marina
    :parameters ()
    :duration (= ?duration 19)
    :condition (and
       (at start (at you mission))
    )
    :effect (and
       (at start (not (at you mission)))
       (at end (at you marina))
    )
  )

  ;; Travel actions for Stephanie (kept distinct; not required by the current facts,
  ;; but included so agent actions remain separate)
  (:durative-action travel-stephanie-marina-to-mission
    :parameters ()
    :duration (= ?duration 20)
    :condition (and
       (at start (at stephanie marina))
    )
    :effect (and
       (at start (not (at stephanie marina)))
       (at end (at stephanie mission))
    )
  )

  (:durative-action travel-stephanie-mission-to-marina
    :parameters ()
    :duration (= ?duration 19)
    :condition (and
       (at start (at stephanie mission))
    )
    :effect (and
       (at start (not (at stephanie mission)))
       (at end (at stephanie marina))
    )
  )

  ;; Meeting action: requires both agents be at the same location for the whole meeting.
  ;; Duration is fixed to 120 minutes (the required minimal meeting length).
  ;; Because Stephanie's presence at mission is modeled with timed initial literals,
  ;; this durative action can only be scheduled when Stephanie is actually present.
  (:durative-action meet
    :parameters (?a - agent ?b - agent ?loc - location)
    :duration (= ?duration 120)
    :condition (and
       (at start (at ?a ?loc))
       (at start (at ?b ?loc))
       (over all (at ?a ?loc))
       (over all (at ?b ?loc))
    )
    :effect (and
       (at end (met ?a ?b))
    )
  )
)