(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (visited ?c - city)
    (flight ?from - city ?to - city)
  )

  (:action assign_first_berlin
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d))
    :effect (and
      (assigned ?d berlin)
      (visited berlin)
      (not (unassigned ?d))
    )
  )

  (:action assign_first_frankfurt
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d))
    :effect (and
      (assigned ?d frankfurt)
      (visited frankfurt)
      (not (unassigned ?d))
    )
  )

  (:action assign_first_bucharest
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d))
    :effect (and
      (assigned ?d bucharest)
      (visited bucharest)
      (not (unassigned ?d))
    )
  )

  (:action stay_in_city
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?c) (unassigned ?d))
    :effect (and
      (assigned ?d ?c)
      (visited ?c)
      (not (unassigned ?d))
    )
  )

  (:action move_between_cities
    :parameters (?prev - day ?d - day ?from - city ?to - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?from) (flight ?from ?to) (unassigned ?d))
    :effect (and
      (assigned ?d ?to)
      (visited ?to)
      (not (unassigned ?d))
    )
  )

  (:action advance_day
    :parameters (?cur - day ?nxt - day)
    :precondition (and (current ?cur) (next ?cur ?nxt) (not (unassigned ?cur)))
    :effect (and
      (not (current ?cur))
      (current ?nxt)
    )
  )
)