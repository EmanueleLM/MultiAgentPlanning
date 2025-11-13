(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (current ?d - day)
    (next ?d1 - day ?d2 - day)
    (is_first ?d - day)

    (unassigned ?d - day)
    (assigned ?d - day ?c - city)

    (visited ?c - city)
    (left ?c - city)

    (flight ?from - city ?to - city)

    (show_day ?d - day)
    (attended_show ?d - day)
  )

  (:action assign_start
    :parameters (?d - day ?c - city)
    :precondition (and (current ?d) (is_first ?d) (unassigned ?d) (not (left ?c)))
    :effect (and (assigned ?d ?c) (visited ?c) (not (unassigned ?d)))
  )

  (:action assign_stay
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?c) (unassigned ?d) (not (left ?c)))
    :effect (and (assigned ?d ?c) (visited ?c) (not (unassigned ?d)))
  )

  (:action assign_move
    :parameters (?prev - day ?d - day ?from - city ?to - city)
    :precondition (and (current ?d) (next ?prev ?d) (assigned ?prev ?from) (flight ?from ?to) (unassigned ?d) (not (left ?to)))
    :effect (and (assigned ?d ?to) (visited ?to) (not (unassigned ?d)) (left ?from))
  )

  (:action advance_day
    :parameters (?cur - day ?nxt - day)
    :precondition (and (current ?cur) (next ?cur ?nxt) (not (unassigned ?cur)))
    :effect (and (not (current ?cur)) (current ?nxt))
  )

  (:action attend_show
    :parameters (?d - day)
    :precondition (and (assigned ?d berlin) (show_day ?d) (not (attended_show ?d)))
    :effect (attended_show ?d)
  )
)