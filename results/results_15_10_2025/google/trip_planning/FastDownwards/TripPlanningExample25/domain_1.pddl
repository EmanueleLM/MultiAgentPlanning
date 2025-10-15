(define (domain travel-domain)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d - day ?d2 - day)
    (connected ?c - city ?c2 - city)
  )

  (:action stay-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia ?d) (next ?d ?d2) (not (at lyon ?d2)) (not (at split ?d2)))
    :effect (and (at valencia ?d2))
    :cost 1
  )

  (:action stay-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (at lyon ?d) (next ?d ?d2) (not (at valencia ?d2)) (not (at split ?d2)))
    :effect (and (at lyon ?d2))
    :cost 1
  )

  (:action stay-split
    :parameters (?d - day ?d2 - day)
    :precondition (and (at split ?d) (next ?d ?d2) (not (at valencia ?d2)) (not (at lyon ?d2)))
    :effect (and (at split ?d2))
    :cost 1
  )

  (:action fly-valencia-to-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (at valencia ?d) (next ?d ?d2) (not (at valencia ?d2)) (not (at split ?d2)))
    :effect (and (at lyon ?d2))
    :cost 1
  )

  (:action fly-lyon-to-valencia
    :parameters (?d - day ?d2 - day)
    :precondition (and (at lyon ?d) (next ?d ?d2) (not (at lyon ?d2)) (not (at split ?d2)))
    :effect (and (at valencia ?d2))
    :cost 1
  )

  (:action fly-lyon-to-split
    :parameters (?d - day ?d2 - day)
    :precondition (and (at lyon ?d) (next ?d ?d2) (not (at lyon ?d2)) (not (at valencia ?d2)))
    :effect (and (at split ?d2))
    :cost 1
  )

  (:action fly-split-to-lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (at split ?d) (next ?d ?d2) (not (at split ?d2)) (not (at valencia ?d2)))
    :effect (and (at lyon ?d2))
    :cost 1
  )
)