(define (domain TripDomain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
  )

  ;; Assign the first day to a city (only if that day is the first and not already assigned)
  (:action assign-first
    :parameters (?d - day ?c - city)
    :precondition (and (first ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (at ?d ?c))
  )

  ;; Assign the next day when staying in the same city
  (:action assign-next-stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (at ?d1 ?c) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 ?c))
  )

  ;; Flight actions hardcode allowed direct flights (graph embedded in actions).
  ;; Valencia <-> Brussels
  (:action fly-valencia-to-brussels
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (next ?d1 ?d2) (at ?d1 valencia) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 brussels))
  )

  (:action fly-brussels-to-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (next ?d1 ?d2) (at ?d1 brussels) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 valencia))
  )

  ;; Brussels <-> Nice
  (:action fly-brussels-to-nice
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (next ?d1 ?d2) (at ?d1 brussels) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 nice))
  )

  (:action fly-nice-to-brussels
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (next ?d1 ?d2) (at ?d1 nice) (not (assigned ?d2)))
    :effect (and (assigned ?d2) (at ?d2 brussels))
  )
)