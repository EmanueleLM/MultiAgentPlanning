(define (domain meeting-domain)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals :duration-inequalities)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
    (met) ;; goal achieved: you met John for required duration
  )

  ;; You's travel actions (distinct from John's)
  (:durative-action travel-you-rd->nb
    :parameters ()
    :duration (= ?duration 17)
    :condition (at start (at you richmond))
    :effect (and
      (at end (not (at you richmond)))
      (at end (at you north-beach))
    )
  )

  (:durative-action travel-you-nb->rd
    :parameters ()
    :duration (= ?duration 18)
    :condition (at start (at you north-beach))
    :effect (and
      (at end (not (at you north-beach)))
      (at end (at you richmond))
    )
  )

  ;; John's travel actions (kept distinct)
  (:durative-action travel-john-rd->nb
    :parameters ()
    :duration (= ?duration 17)
    :condition (at start (at john richmond))
    :effect (and
      (at end (not (at john richmond)))
      (at end (at john north-beach))
    )
  )

  (:durative-action travel-john-nb->rd
    :parameters ()
    :duration (= ?duration 18)
    :condition (at start (at john north-beach))
    :effect (and
      (at end (not (at john north-beach)))
      (at end (at john richmond))
    )
  )

  ;; Joint meeting action: requires both agents at North Beach at start and end.
  ;; Duration must be at least 75 minutes to satisfy meeting-length requirement.
  (:durative-action meet-at-north-beach
    :parameters ()
    :duration (>= ?duration 75)
    :condition (and
      (at start (at you north-beach))
      (at start (at john north-beach))
      (at end   (at you north-beach))
      (at end   (at john north-beach))
    )
    :effect (at end (met))
  )

)