(define (domain bayview-scheduling)
  (:requirements :typing :durative-actions :fluents :numeric-fluents :negative-preconditions :timed-initial-literals)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (john-available)
    (met-john)
  )

  (:functions
    (meet-count)   ; integer counter of completed meetings
  )

  ;; Travel: Bayview -> RussianHill (fixed duration 23 minutes)
  (:durative-action travel-bayview-to-russianhill
    :parameters (?p - person)
    :duration (= ?duration 23)
    :condition (at start (at ?p Bayview))
    :effect (and
      (at end (not (at ?p Bayview)))
      (at end (at ?p RussianHill))
    )
  )

  ;; Travel: RussianHill -> Bayview (fixed duration 23 minutes)
  (:durative-action travel-russianhill-to-bayview
    :parameters (?p - person)
    :duration (= ?duration 23)
    :condition (at start (at ?p RussianHill))
    :effect (and
      (at end (not (at ?p RussianHill)))
      (at end (at ?p Bayview))
    )
  )

  ;; Meeting with John at Russian Hill.
  ;; Must last at least 75 minutes and must occur entirely while john-available is true.
  ;; Both participants must be at RussianHill for the whole meeting (enforced with over all).
  (:durative-action meet-with-john
    :parameters ()
    :duration (>= ?duration 75)
    :condition (and
      (at start (at visitor RussianHill))
      (at start (at john RussianHill))
      (over all (at visitor RussianHill))
      (over all (at john RussianHill))
      (over all (john-available))
    )
    :effect (and
      (at end (met-john))
      (at end (increase (meet-count) 1))
    )
  )

)