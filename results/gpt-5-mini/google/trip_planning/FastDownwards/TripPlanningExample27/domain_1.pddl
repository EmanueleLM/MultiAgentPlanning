(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?d - day ?c - city)            ; city assignment on a specific day
    (assigned ?d - day)               ; day has been assigned
    (flight ?from - city ?to - city)  ; direct flight availability (directed)
    (next ?d1 - day ?d2 - day)        ; day adjacency (d2 is the day after d1)
    (first-day ?d - day)              ; marks the first day (start)
  )

  (:action set-initial
    :parameters (?d - day ?c - city)
    :precondition (and (first-day ?d) (not (assigned ?d)))
    :effect (and (at ?d ?c) (assigned ?d))
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (assigned ?d1) (at ?d1 ?c) (not (assigned ?d2)))
    :effect (and (at ?d2 ?c) (assigned ?d2))
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (next ?d1 ?d2) (assigned ?d1) (at ?d1 ?from) (flight ?from ?to) (not (assigned ?d2)))
    :effect (and (at ?d2 ?to) (assigned ?d2))
  )
)