(define (domain meetup-multiagent)
  (:requirements :durative-actions :typing :negative-preconditions :timed-initial-literals)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (available ?a - agent)
    (met ?v - agent ?j - agent)
  )

  ;; Visitor travel actions (kept distinct names to reflect agent-specific actions)
  (:durative-action visitor-travel-presidio-to-marina
    :parameters ()
    :duration (= ?duration 10)
    :condition (and
                 (at start (at visitor presidio))
               )
    :effect (and
              (at start (not (at visitor presidio)))
              (at end (at visitor marina-district))
            )
  )

  (:durative-action visitor-travel-marina-to-presidio
    :parameters ()
    :duration (= ?duration 10)
    :condition (and
                 (at start (at visitor marina-district))
               )
    :effect (and
              (at start (not (at visitor marina-district)))
              (at end (at visitor presidio))
            )
  )

  ;; Jessica travel actions (distinct but not required to be used in this scenario)
  (:durative-action jessica-travel-presidio-to-marina
    :parameters ()
    :duration (= ?duration 10)
    :condition (and
                 (at start (at jessica presidio))
               )
    :effect (and
              (at start (not (at jessica presidio)))
              (at end (at jessica marina-district))
            )
  )

  (:durative-action jessica-travel-marina-to-presidio
    :parameters ()
    :duration (= ?duration 10)
    :condition (and
                 (at start (at jessica marina-district))
               )
    :effect (and
              (at start (not (at jessica marina-district)))
              (at end (at jessica presidio))
            )
  )

  ;; Joint meeting action: duration fixed to meeting requirement (60 minutes).
  ;; It requires both agents to be at MarinaDistrict at the start and to remain there
  ;; and requires Jessica to be available for the entire meeting.
  (:durative-action meet-at-marina-district
    :parameters (?v - agent ?j - agent)
    :duration (= ?duration 60)
    :condition (and
                 (at start (at ?v marina-district))
                 (at start (at ?j marina-district))
                 (over all (at ?v marina-district))
                 (over all (at ?j marina-district))
                 (over all (available ?j))
               )
    :effect (and
              (at end (met ?v ?j))
            )
  )
)