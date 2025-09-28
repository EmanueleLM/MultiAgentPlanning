(define (domain travel-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent city day stayslot)

  (:predicates
    (at ?ag - agent ?c - city)
    (flight ?from - city ?to - city)
    (visited ?c - city)
    (day-used ?d - day)
    (slot-of ?s - stayslot ?c - city)
    (slot-free ?s - stayslot)
  )

  (:action fly
    :parameters (?ag - agent ?from - city ?to - city ?d - day)
    :precondition (and
      (at ?ag ?from)
      (flight ?from ?to)
      (not (day-used ?d))
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
      (visited ?to)
      (day-used ?d)
    )
  )

  (:action stay
    :parameters (?ag - agent ?c - city ?s - stayslot ?d - day)
    :precondition (and
      (at ?ag ?c)
      (slot-of ?s ?c)
      (slot-free ?s)
      (not (day-used ?d))
    )
    :effect (and
      (not (slot-free ?s))
      (visited ?c)
      (day-used ?d)
    )
  )
)