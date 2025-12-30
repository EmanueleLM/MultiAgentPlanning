(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types
    city - object
  )
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (has-flight ?from - city ?to - city)
  )
  (:functions
    (total-time) ; Tracks total days elapsed (target 12)
    (total-cost) ; Tracks planning steps
  )

  ; --- Visit Actions (Durations adjusted to 4, 5, 3 days for a total of 12) ---
  ; Fixed duration actions ensure the total time constraint is met exactly while visiting all required cities once.

  (:action visit_istanbul_4d
    :parameters ()
    :precondition (and (at istanbul) (not (visited istanbul)))
    :effect (and
      (visited istanbul)
      (increase (total-time) 4)
      (increase (total-cost) 0)
    )
  )

  (:action visit_budapest_5d
    :parameters ()
    :precondition (and (at budapest) (not (visited budapest)))
    :effect (and
      (visited budapest)
      (increase (total-time) 5)
      (increase (total-cost) 0)
    )
  )

  (:action visit_dubrovnik_3d
    :parameters ()
    :precondition (and (at dubrovnik) (not (visited dubrovnik)))
    :effect (and
      (visited dubrovnik)
      (increase (total-time) 3)
      (increase (total-cost) 0)
    )
  )


  ; --- Travel Action ---
  ; Travel uses direct flights only and takes 0 time, but increases the planning cost by 1.

  (:action travel
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (has-flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (total-cost) 1)
    )
  )
)