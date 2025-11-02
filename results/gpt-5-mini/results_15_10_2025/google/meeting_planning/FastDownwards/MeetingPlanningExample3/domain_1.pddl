(define (domain meeting-planning)
  (:requirements :strips :durative-actions :fluents :negative-preconditions :typing)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?b - agent)
  )
  (:functions (time))

  (:durative-action travel-bayview-to-golden
    :parameters ()
    :duration (= ?duration 22)
    :condition (at start (at traveler bayview))
    :effect (and
      (at start (increase (time) 22))
      (at end (not (at traveler bayview)))
      (at end (at traveler golden_gate_park))
    )
  )

  (:durative-action travel-golden-to-bayview
    :parameters ()
    :duration (= ?duration 23)
    :condition (at start (at traveler golden_gate_park))
    :effect (and
      (at start (increase (time) 23))
      (at end (not (at traveler golden_gate_park)))
      (at end (at traveler bayview))
    )
  )

  (:durative-action meet-traveler-barbara
    :parameters ()
    :duration (= ?duration 90)
    :condition (and
      (at start (at traveler golden_gate_park))
      (at start (at barbara golden_gate_park))
      (at start (>= (time) 480))
      (at end (<= (time) 690))
    )
    :effect (and
      (at start (increase (time) 90))
      (at end (met traveler barbara))
    )
  )
)