(define (domain travel)
  (:requirements :strips :typing :fluents)
  (:types town)
  (:predicates
    (leg ?from ?to - town)
    (at ?c - town)
    (relative ?c - town)
    (visited-window)
  )
  (:functions
    (day)
    (window-start)
    (window-end)
    (spent ?c - town)
    (required ?c - town)
  )

  (:action fly
    :parameters (?from ?to - town)
    :precondition (and (at ?from) (leg ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (day) 1)
    )
  )

  (:action stay
    :parameters (?c - town)
    :precondition (at ?c)
    :effect (and
      (increase (day) 1)
      (increase (spent ?c) 1)
    )
  )

  (:action attend-relatives
    :parameters (?c - town)
    :precondition (and
      (at ?c)
      (relative ?c)
      (>= (day) (window-start))
      (<= (day) (window-end))
    )
    :effect (and
      (visited-window)
      (increase (day) 1)
      (increase (spent ?c) 1)
    )
  )
)