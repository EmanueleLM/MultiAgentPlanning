(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :fluents)
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

  ;; Fly between cities (requires an explicit direct edge)
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Stay one day in Riga: decrements global days and Riga need by 1
  (:action stay-riga
    :parameters ()
    :precondition (and (at riga) (> (days-remaining) 0) (> (need-riga) 0))
    :effect (and
      (decrease (days-remaining) 1)
      (decrease (need-riga) 1)
    )
  )

  ;; Stay one day in Manchester: decrements global days and Manchester need by 1
  (:action stay-manchester
    :parameters ()
    :precondition (and (at manchester) (> (days-remaining) 0) (> (need-manchester) 0))
    :effect (and
      (decrease (days-remaining) 1)
      (decrease (need-manchester) 1)
    )
  )

  ;; Stay one day in Split: decrements global days and Split need by 1
  (:action stay-split
    :parameters ()
    :precondition (and (at split) (> (days-remaining) 0) (> (need-split) 0))
    :effect (and
      (decrease (days-remaining) 1)
      (decrease (need-split) 1)
    )
  )
)