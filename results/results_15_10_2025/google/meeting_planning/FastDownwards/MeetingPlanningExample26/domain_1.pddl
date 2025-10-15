(define (domain meeting-planning)
  (:requirements :typing :durative-actions :timed-initial-literals :negative-preconditions :numeric-fluents)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (available-sarah)
    (met-sarah)
  )
  (:functions
    (total-meetings)
  )

  (:durative-action travel
    :parameters (?p - agent ?from - location ?to - location)
    :duration (= ?duration 7)
    :condition (and
      (at start (at ?p ?from))
    )
    :effect (and
      (at end (not (at ?p ?from)))
      (at end (at ?p ?to))
    )
  )

  (:durative-action meet-with-sarah
    :parameters (?trav - agent ?s - agent ?loc - location)
    :duration (= ?duration 105)
    :condition (and
      (at start (at ?trav ?loc))
      (at start (at ?s ?loc))
      (over all (available-sarah))
    )
    :effect (and
      (at end (met-sarah))
      (at end (increase (total-meetings) 1))
    )
  )
)