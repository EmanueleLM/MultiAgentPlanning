(define (domain trip-planning)
  (:requirements :strips :typing :equality)
  (:types agent city day)
  (:predicates
    (direct-flight ?from - city ?to - city)
    (at ?a - agent ?c - city)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (current-day ?d - day)
    (last-day ?d - day)
  )

  (:action assign-day
    :parameters (?sched - agent ?trav - agent ?d - day ?c - city ?dnext - day)
    :precondition (and (current-day ?d) (unassigned ?d) (at ?trav ?c) (next ?d ?dnext))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)) (not (current-day ?d)) (current-day ?dnext))
  )

  (:action assign-last-day
    :parameters (?sched - agent ?trav - agent ?d - day ?c - city)
    :precondition (and (current-day ?d) (unassigned ?d) (at ?trav ?c) (last-day ?d))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)) (not (current-day ?d)))
  )

  (:action fly
    :parameters (?trav - agent ?from - city ?to - city)
    :precondition (and (at ?trav ?from) (direct-flight ?from ?to))
    :effect (and (not (at ?trav ?from)) (at ?trav ?to))
  )
)