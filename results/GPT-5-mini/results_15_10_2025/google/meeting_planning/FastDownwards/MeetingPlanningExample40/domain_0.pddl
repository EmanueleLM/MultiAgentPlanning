(define (domain friends-meeting)
  (:requirements :durative-actions :typing :negative-preconditions :timed-initial-literals :numeric-fluents)
  (:types agent location)
  (:predicates
    (at ?ag - agent ?loc - location)
    (met ?ag - agent)
  )
  (:functions
    (met-count)  ; numeric fluent counting how many friends have been met
  )

  ;; Travel from The Castro to Sunset District (for "you")
  (:durative-action travel-you-castro-to-sunset
    :duration (= ?duration 17)
    :condition (and
                 (at start (at you castro))
                )
    :effect (and
              (at end (not (at you castro)))
              (at end (at you sunset))
            )
  )

  ;; Travel from Sunset District to The Castro (for "you")
  (:durative-action travel-you-sunset-to-castro
    :duration (= ?duration 17)
    :condition (and
                 (at start (at you sunset))
                )
    :effect (and
              (at end (not (at you sunset)))
              (at end (at you castro))
            )
  )

  ;; Meeting action between you and Deborah at Sunset District
  ;; Minimum meeting duration = 75 (encoded as fixed duration)
  ;; Deborah must be present for the whole meeting (over all), same for you.
  (:durative-action meet-deborah-at-sunset
    :duration (= ?duration 75)
    :condition (and
                 (at start (at you sunset))
                 (at start (at deborah sunset))
                 (over all (at you sunset))
                 (over all (at deborah sunset))
                )
    :effect (and
              (at end (met deborah))
              (at end (increase (met-count) 1))
            )
  )
)