(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)        ; day succession (ordered days)
    (first ?d - day)                 ; identifies the first day (no predecessor)
    (at ?d - day ?c - city)          ; traveler is in city ?c on day ?d
    (direct ?c1 - city ?c2 - city)   ; direct flight exists between cities
    (visited ?c - city)              ; city has been visited at least once
    (unassigned ?d - day)            ; day has not yet been assigned a city
  )

  ;; Choose the start city on the first day.
  (:action start
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (unassigned ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (visited ?c)
    )
  )

  ;; Stay in the same city across a day boundary (no flight).
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (unassigned ?d2)
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?c)
      (visited ?c)
    )
  )

  ;; Fly between different cities from one day to the next, only if a direct flight exists.
  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (unassigned ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (unassigned ?d2))
      (at ?d2 ?to)
      (visited ?to)
    )
  )
)