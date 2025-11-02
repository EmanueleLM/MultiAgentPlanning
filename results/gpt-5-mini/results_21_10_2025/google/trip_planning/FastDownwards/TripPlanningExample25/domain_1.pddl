(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (next ?d1 - day ?d2 - day)
    (assigned ?d - day ?c - city)
    (free ?d - day)
    (slot ?s - slot ?c - city)
    (slot-free ?s - slot)
    (flight ?c1 - city ?c2 - city)
  )

  ;; Stay in the same city for the next day, consuming one available slot for that city.
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city ?s - slot)
    :precondition (and
      (assigned ?d ?c)
      (next ?d ?d2)
      (free ?d2)
      (slot ?s ?c)
      (slot-free ?s)
    )
    :effect (and
      (assigned ?d2 ?c)
      (not (free ?d2))
      (not (slot-free ?s))
    )
  )

  ;; Fly from current city to a directly-connected city for the next day, consuming one available slot in the destination city.
  (:action fly
    :parameters (?d - day ?d2 - day ?c1 - city ?c2 - city ?s - slot)
    :precondition (and
      (assigned ?d ?c1)
      (next ?d ?d2)
      (free ?d2)
      (flight ?c1 ?c2)
      (slot ?s ?c2)
      (slot-free ?s)
    )
    :effect (and
      (assigned ?d2 ?c2)
      (not (free ?d2))
      (not (slot-free ?s))
    )
  )
)