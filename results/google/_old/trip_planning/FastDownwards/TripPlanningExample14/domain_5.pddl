(define (domain trip-planning)
  (:requirements :typing :fluents :equality)
  (:types city day)
  (:predicates
    (direct-flight ?from - city ?to - city)
    (at ?c - city)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (current-day ?d - day)
    (last-day ?d - day)
  )
  (:functions
    (stays ?c - city)
  )

  (:action assign-day
    :parameters (?d - day ?c - city ?dnext - day)
    :precondition (and (current-day ?d) (unassigned ?d) (at ?c) (next ?d ?dnext))
    :effect (and
      (assigned ?d ?c)
      (not (unassigned ?d))
      (not (current-day ?d))
      (current-day ?dnext)
      (increase (stays ?c) 1)
    )
  )

  (:action assign-last-day
    :parameters (?d - day ?c - city)
    :precondition (and (current-day ?d) (unassigned ?d) (at ?c) (last-day ?d))
    :effect (and
      (assigned ?d ?c)
      (not (unassigned ?d))
      (not (current-day ?d))
      (increase (stays ?c) 1)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct-flight ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )
)