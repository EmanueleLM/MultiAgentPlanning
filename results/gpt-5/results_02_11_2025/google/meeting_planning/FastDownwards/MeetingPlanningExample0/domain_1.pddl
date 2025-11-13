(define (domain meet-stephanie)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:types
    location
  )
  (:constants
    marina mission - location
  )
  (:predicates
    (at ?l - location)
  )
  (:functions
    (now) - number
    (met-stephanie) - number
    (open-stephanie) - number
    (close-stephanie) - number
    (tt ?from - location ?to - location) - number
  )

  (:action wait-1
    :parameters ()
    :precondition (and)
    :effect (increase (now) 1)
  )

  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (now) (tt ?from ?to))
    )
  )

  (:action meet-1
    :parameters ()
    :precondition (and
      (at mission)
      (>= (now) (open-stephanie))
      (< (now) (close-stephanie))
    )
    :effect (and
      (increase (now) 1)
      (increase (met-stephanie) 1)
    )
  )
)