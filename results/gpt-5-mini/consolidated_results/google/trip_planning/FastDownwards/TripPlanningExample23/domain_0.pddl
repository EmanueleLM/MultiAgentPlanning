(define (domain trip-planning)
  (:requirements :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)        ; agent is in city c on day d
    (assigned ?d - day)           ; day d has been assigned (occupied)
    (unassigned ?d - day)         ; day d is free to be assigned
    (next ?d1 - day ?d2 - day)    ; d2 is the direct successor of d1
    (direct ?c1 - city ?c2 - city) ; direct flight connection exists
  )

  ;; Stay in the same city from day d to the next day dn
  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn) (unassigned ?dn))
    :effect (and (at ?c ?dn) (assigned ?dn) (not (unassigned ?dn)))
  )

  ;; Fly from city ?from on day ?d to city ?to on day ?dn (requires a direct flight)
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from ?d) (next ?d ?dn) (unassigned ?dn) (direct ?from ?to))
    :effect (and (at ?to ?dn) (assigned ?dn) (not (unassigned ?dn)))
  )
)