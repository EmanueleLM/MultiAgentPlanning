(define (domain multi-agent-meetings)
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents :timed-initial-literals)
  (:types agent location)

  (:predicates
    (you-at ?l - location)
    (matthew-at ?l - location)
    (matthew-available)
    (met-you-matthew)
  )

  (:functions
    (meet-count)
  )

  ;; You travel from NobHill to Presidio (17 minutes)
  (:durative-action travel-you-nob-to-pres
    :parameters ()
    :duration (= ?duration 17)
    :condition (at start (you-at nobhill))
    :effect (and
      (at start (not (you-at nobhill)))
      (at end (you-at presidio))
    )
  )

  ;; You travel from Presidio back to NobHill (18 minutes)
  (:durative-action travel-you-pres-to-nob
    :parameters ()
    :duration (= ?duration 18)
    :condition (at start (you-at presidio))
    :effect (and
      (at start (not (you-at presidio)))
      (at end (you-at nobhill))
    )
  )

  ;; Meeting action between you and Matthew at Presidio.
  ;; Duration is exactly 30 minutes to satisfy "at least 30 minutes".
  ;; Requires both to be at Presidio for the whole meeting and that Matthew is available for the whole meeting.
  (:durative-action meet-you-matthew
    :parameters ()
    :duration (= ?duration 30)
    :condition (and
      (at start (you-at presidio))
      (at start (matthew-at presidio))
      (over all (you-at presidio))
      (over all (matthew-at presidio))
      (over all (matthew-available))
    )
    :effect (and
      (at end (met-you-matthew))
      (at end (increase (meet-count) 1))
    )
  )
)