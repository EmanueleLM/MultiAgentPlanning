(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city - object
  )
  (:constants
    istanbul budapest dubrovnik - city
  )
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (has-flight ?from - city ?to - city)
  )
  (:functions
    total-time - number
    total-cost - number
  )

  (:action visit_istanbul_4d
    :parameters ()
    :precondition (and (at istanbul) (not (visited istanbul)))
    :effect (and
      (visited istanbul)
      (increase total-time 4)
      (increase total-cost 0)
    )
  )

  (:action visit_budapest_5d
    :parameters ()
    :precondition (and (at budapest) (not (visited budapest)))
    :effect (and
      (visited budapest)
      (increase total-time 5)
      (increase total-cost 0)
    )
  )

  (:action visit_dubrovnik_3d
    :parameters ()
    :precondition (and (at dubrovnik) (not (visited dubrovnik)))
    :effect (and
      (visited dubrovnik)
      (increase total-time 3)
      (increase total-cost 0)
    )
  )

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
      (increase total-cost 1)
    )
  )