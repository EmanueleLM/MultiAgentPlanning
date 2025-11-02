(define (domain meeting-planning)
  (:requirements :typing :durative-actions :fluents :negative-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (available ?a - agent)
  )
  (:functions
    (meeting-time)
  )

  (:durative-action you_move
    :parameters (?from - location ?to - location)
    :duration (= ?duration 10)
    :condition (and
      (at start (at you ?from))
    )
    :effect (and
      (at start (not (at you ?from)))
      (at end (at you ?to))
    )
  )

  (:durative-action meet
    :parameters (?loc - location)
    :duration (>= ?duration 60)
    :condition (and
      (at start (at you ?loc))
      (at start (at jessica ?loc))
      (over all (available jessica))
    )
    :effect (and
      (at end (increase (meeting-time) ?duration))
    )
  )
)