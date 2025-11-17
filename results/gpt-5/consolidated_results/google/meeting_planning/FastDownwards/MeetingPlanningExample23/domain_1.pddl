(define (domain meet-john-timewindows)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types location person traveler)
  (:predicates
    (at ?l - location)
    (met-john)
    (known-location ?l - location)
    (route ?from - location ?to - location)
  )
  (:functions
    (current_time)
    (travel-time ?from - location ?to - location)
    (john-window-start)
    (john-window-end)
    (meet-min-john)
  )

  (:action travel
    :parameters (?from - location ?to - location)
    :precondition (and
      (at ?from)
      (known-location ?to)
      (route ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (current_time) (travel-time ?from ?to))
    )
  )

  (:action sync-to-john-start
    :parameters ()
    :precondition (and
      (at russian_hill)
      (< (current_time) (john-window-start))
    )
    :effect (assign (current_time) (john-window-start))
  )

  (:action meet-john
    :parameters ()
    :precondition (and
      (at russian_hill)
      (not (met-john))
      (>= (current_time) (john-window-start))
      (<= (+ (current_time) (meet-min-john)) (john-window-end))
    )
    :effect (and
      (increase (current_time) (meet-min-john))
      (met-john)
    )
  )
)