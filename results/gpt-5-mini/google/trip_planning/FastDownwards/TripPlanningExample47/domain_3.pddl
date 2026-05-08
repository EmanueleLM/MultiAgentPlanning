(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (flight ?from - city ?to - city)    ;; direct flight connection (bidirectional facts supplied in problem)
    (next ?d - day ?dn - day)           ;; temporal ordering of days
    (at ?c - city ?d - day)             ;; being in city c on day d
    (assigned ?d - day)                 ;; day d has already been assigned a city
  )

  ;; stay in the same city from one day to the next
  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?dn)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?c ?dn)
      (assigned ?dn)
    )
  )

  ;; fly along a direct flight from one city to another overnight (from day d to next day dn)
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and
      (at ?from ?d)
      (flight ?from ?to)
      (next ?d ?dn)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?to ?dn)
      (assigned ?dn)
    )
  )
)