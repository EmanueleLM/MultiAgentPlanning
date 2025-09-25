(define (domain meeting-schedule)
  (:requirements :typing :durative-actions :timed-initial-literals)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )
  (:durative-action travel-traveler-bayview-to-russianhill
    :parameters ()
    :duration (= ?duration 23)
    :condition (at start (at traveler Bayview))
    :effect (and
      (at end (at traveler RussianHill))
      (at end (not (at traveler Bayview)))
    )
  )
  (:durative-action travel-traveler-russianhill-to-bayview
    :parameters ()
    :duration (= ?duration 23)
    :condition (at start (at traveler RussianHill))
    :effect (and
      (at end (at traveler Bayview))
      (at end (not (at traveler RussianHill)))
    )
  )
  (:durative-action traveler-meet-john
    :parameters ()
    :duration (= ?duration 75)
    :condition (and
      (at start (at traveler RussianHill))
      (at start (at john RussianHill))
      (over all (at traveler RussianHill))
      (over all (at john RussianHill))
    )
    :effect (at end (met))
  )
)