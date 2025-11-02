(define (domain meeting-domain)
  (:requirements :typing :durative-actions :negative-preconditions :equality :timed-initial-literals :fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )
  (:functions (time))

  (:durative-action traveler-move
    :parameters (?from - location ?to - location)
    :duration (= ?duration 7)
    :condition (and
      (at start (at traveler ?from))
    )
    :effect (and
      (at start (not (at traveler ?from)))
      (at end (at traveler ?to))
      (at end (increase (time) 7))
    )
  )

  (:durative-action sarah-move
    :parameters (?from - location ?to - location)
    :duration (= ?duration 7)
    :condition (and
      (at start (at sarah ?from))
    )
    :effect (and
      (at start (not (at sarah ?from)))
      (at end (at sarah ?to))
      (at end (increase (time) 7))
    )
  )

  (:durative-action meet
    :parameters (?loc - location)
    :duration (= ?duration 105)
    :condition (and
      (at start (at traveler ?loc))
      (at start (at sarah ?loc))
      (over all (at traveler ?loc))
      (over all (at sarah ?loc))
      (at start (>= (time) 795))
      (at start (<= (time) 810))
    )
    :effect (and
      (at end (met))
      (at end (increase (time) 105))
    )
  )
)