(define (domain trip-planning-10days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city)                 ; current city
    (current ?d - day)             ; current day pointer
    (next ?d1 - day ?d2 - day)     ; successor relation
    (edge ?c1 - city ?c2 - city)   ; direct flight connectivity
    (assigned ?d - day)            ; day ?d has been allocated exactly once
    (on ?d - day ?c - city)        ; witness: day ?d spent in city ?c
    (visited ?c - city)            ; visited city at least one full day
  )

  ; Stay in the same city on day ?d and advance to day ?d2
  (:action stay_d
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (at ?c)
      (not (assigned ?d))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (assigned ?d)
      (on ?d ?c)
      (visited ?c)
    )
  )

  ; Fly on day ?d from ?from to ?to along a direct edge and advance to day ?d2
  (:action fly_d
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (at ?from)
      (edge ?from ?to)
      (not (assigned ?d))
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (assigned ?d)
      (not (at ?from))
      (at ?to)
      (on ?d ?to)
      (visited ?to)
    )
  )
)