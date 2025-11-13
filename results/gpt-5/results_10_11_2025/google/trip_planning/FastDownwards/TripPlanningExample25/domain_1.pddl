(define (domain tripplanningexample25)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city token)
  (:predicates
    (next ?d - day ?d2 - day)
    (today ?d - day)
    (at-day ?d - day ?c - city)
    (assigned ?d - day)
    (current ?c - city)
    (flight ?from - city ?to - city)
    (presplit ?d - day)
    (splitwindow ?d - day)
    (last ?d - day)
    (split-city ?c - city)
    (valencia-city ?c - city)
    (used ?t - token)
    (unused ?t - token)
    (counted ?d - day)
    (start-chosen)
  )

  (:action choose-start
    :parameters (?c - city ?d - day)
    :precondition (and
      (today ?d)
      (presplit ?d)
      (not (split-city ?c))
      (not (start-chosen))
    )
    :effect (and
      (start-chosen)
      (current ?c)
    )
  )

  (:action advance-stay-presplit
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (presplit ?d)
      (current ?c)
      (not (split-city ?c))
      (not (assigned ?d))
    )
    :effect (and
      (at-day ?d ?c)
      (assigned ?d)
      (not (today ?d))
      (today ?d2)
    )
  )

  (:action advance-move-presplit
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (presplit ?d)
      (current ?from)
      (not (split-city ?from))
      (flight ?from ?to)
      (not (assigned ?d))
    )
    :effect (and
      (at-day ?d ?from)
      (assigned ?d)
      (not (today ?d))
      (today ?d2)
      (not (current ?from))
      (current ?to)
    )
  )

  (:action advance-stay-window
    :parameters (?d - day ?d2 - day ?s - city)
    :precondition (and
      (today ?d)
      (next ?d ?d2)
      (splitwindow ?d)
      (split-city ?s)
      (current ?s)
      (not (assigned ?d))
    )
    :effect (and
      (at-day ?d ?s)
      (assigned ?d)
      (not (today ?d))
      (today ?d2)
      (current ?s)
    )
  )

  (:action finalize-window
    :parameters (?d - day ?s - city)
    :precondition (and
      (today ?d)
      (last ?d)
      (splitwindow ?d)
      (split-city ?s)
      (current ?s)
      (not (assigned ?d))
    )
    :effect (and
      (at-day ?d ?s)
      (assigned ?d)
      (not (today ?d))
    )
  )

  (:action mark-valencia
    :parameters (?d - day ?t - token ?v - city)
    :precondition (and
      (presplit ?d)
      (at-day ?d ?v)
      (valencia-city ?v)
      (not (counted ?d))
      (unused ?t)
    )
    :effect (and
      (used ?t)
      (not (unused ?t))
      (counted ?d)
    )
  )
)