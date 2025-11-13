(define (domain tripplanningexample1)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:types city)
  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
  )
  (:functions
    (days-remaining)
    (need-riga)
    (need-manchester)
    (need-split)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay-riga
    :parameters ()
    :precondition (and
      (at riga)
      (> (days-remaining) 0)
      (> (need-riga) 0)
    )
    :effect (and
      (decrease (days-remaining) 1)
      (decrease (need-riga) 1)
    )
  )

  (:action stay-manchester
    :parameters ()
    :precondition (and
      (at manchester)
      (> (days-remaining) 0)
      (> (need-manchester) 0)
    )
    :effect (and
      (decrease (days-remaining) 1)
      (decrease (need-manchester) 1)
    )
  )

  (:action stay-split
    :parameters ()
    :precondition (and
      (at split)
      (> (days-remaining) 0)
      (> (need-split) 0)
    )
    :effect (and
      (decrease (days-remaining) 1)
      (decrease (need-split) 1)
    )
  )
)