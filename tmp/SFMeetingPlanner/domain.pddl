(define (domain scheduling)
  (:requirements :typing :durative-actions :numeric-fluents)
  (:types agent person location)
  (:predicates
    (at   ?a - agent  ?l - location)
    (met  ?p - person)
  )
  (:functions
    (current-time)        ; minutes since 9:00AM
  )

  ;; travel action for the scheduler
  (:durative-action travel
    :parameters (?from ?to - location)
    :duration (= ?duration 15)
    :condition (and
      (at start (at scheduler ?from))
    )
    :effect (and
      (at start   (not (at scheduler ?from)))
      (at end     (at scheduler ?to))
      (at end     (increase (current-time) 15))
    )
  )

  ;; meet action: 75 minutes with James at Alamo
  (:durative-action meet
    :parameters (?p - person ?l - location)
    :duration (= ?duration 75)
    :condition (and
      ;; scheduler must be at location
      (at start (at scheduler ?l))
      ;; time window: cannot start before 3:45PM (=405)
      (at start (>= (current-time) 405))
      ;; cannot finish after 8PM (=660) ⇒ start ≤ 660−75 = 585
      (at start (<= (current-time) 585))
    )
    :effect (at end (met ?p))
  )
)