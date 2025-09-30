(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
  )
  (:action stay-geneva
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at geneva ?d1) (next ?d1 ?d2))
    :effect (and (at geneva ?d2))
    :cost 0
  )
  (:action stay-madrid
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at madrid ?d1) (next ?d1 ?d2))
    :effect (and (at madrid ?d2))
    :cost 0
  )
  (:action stay-venice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at venice ?d1) (next ?d1 ?d2))
    :effect (and (at venice ?d2))
    :cost 0
  )
  (:action fly-geneva-madrid
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at geneva ?d1) (next ?d1 ?d2))
    :effect (and (at madrid ?d2))
    :cost 1
  )
  (:action fly-madrid-geneva
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at madrid ?d1) (next ?d1 ?d2))
    :effect (and (at geneva ?d2))
    :cost 1
  )
  (:action fly-madrid-venice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at madrid ?d1) (next ?d1 ?d2))
    :effect (and (at venice ?d2))
    :cost 1
  )
  (:action fly-venice-madrid
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at venice ?d1) (next ?d1 ?d2))
    :effect (and (at madrid ?d2))
    :cost 1
  )
)