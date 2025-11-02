(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?loc - city)
    (direct ?from - city ?to - city)
    (day-available ?d - day)

    (venice-days-0)
    (venice-days-1)
    (venice-days-2)
    (venice-days-3)
    (venice-days-4)
    (venice-days-5)
    (venice-days-6)

    (florence-days-0)
    (florence-days-1)
    (florence-days-2)
    (florence-days-3)
    (florence-days-4)
    (florence-days-5)
    (florence-days-6)

    (zurich-days-0)
    (zurich-days-1)
    (zurich-days-2)
  )

  (:action stay-venice-0
    :parameters (?d - day)
    :precondition (and (at venice) (day-available ?d) (venice-days-0))
    :effect (and (not (day-available ?d)) (not (venice-days-0)) (venice-days-1))
  )

  (:action stay-venice-1
    :parameters (?d - day)
    :precondition (and (at venice) (day-available ?d) (venice-days-1))
    :effect (and (not (day-available ?d)) (not (venice-days-1)) (venice-days-2))
  )

  (:action stay-venice-2
    :parameters (?d - day)
    :precondition (and (at venice) (day-available ?d) (venice-days-2))
    :effect (and (not (day-available ?d)) (not (venice-days-2)) (venice-days-3))
  )

  (:action stay-venice-3
    :parameters (?d - day)
    :precondition (and (at venice) (day-available ?d) (venice-days-3))
    :effect (and (not (day-available ?d)) (not (venice-days-3)) (venice-days-4))
  )

  (:action stay-venice-4
    :parameters (?d - day)
    :precondition (and (at venice) (day-available ?d) (venice-days-4))
    :effect (and (not (day-available ?d)) (not (venice-days-4)) (venice-days-5))
  )

  (:action stay-venice-5
    :parameters (?d - day)
    :precondition (and (at venice) (day-available ?d) (venice-days-5))
    :effect (and (not (day-available ?d)) (not (venice-days-5)) (venice-days-6))
  )

  (:action stay-florence-0
    :parameters (?d - day)
    :precondition (and (at florence) (day-available ?d) (florence-days-0))
    :effect (and (not (day-available ?d)) (not (florence-days-0)) (florence-days-1))
  )

  (:action stay-florence-1
    :parameters (?d - day)
    :precondition (and (at florence) (day-available ?d) (florence-days-1))
    :effect (and (not (day-available ?d)) (not (florence-days-1)) (florence-days-2))
  )

  (:action stay-florence-2
    :parameters (?d - day)
    :precondition (and (at florence) (day-available ?d) (florence-days-2))
    :effect (and (not (day-available ?d)) (not (florence-days-2)) (florence-days-3))
  )

  (:action stay-florence-3
    :parameters (?d - day)
    :precondition (and (at florence) (day-available ?d) (florence-days-3))
    :effect (and (not (day-available ?d)) (not (florence-days-3)) (florence-days-4))
  )

  (:action stay-florence-4
    :parameters (?d - day)
    :precondition (and (at florence) (day-available ?d) (florence-days-4))
    :effect (and (not (day-available ?d)) (not (florence-days-4)) (florence-days-5))
  )

  (:action stay-florence-5
    :parameters (?d - day)
    :precondition (and (at florence) (day-available ?d) (florence-days-5))
    :effect (and (not (day-available ?d)) (not (florence-days-5)) (florence-days-6))
  )

  (:action stay-zurich-0
    :parameters (?d - day)
    :precondition (and (at zurich) (day-available ?d) (zurich-days-0))
    :effect (and (not (day-available ?d)) (not (zurich-days-0)) (zurich-days-1))
  )

  (:action stay-zurich-1
    :parameters (?d - day)
    :precondition (and (at zurich) (day-available ?d) (zurich-days-1))
    :effect (and (not (day-available ?d)) (not (zurich-days-1)) (zurich-days-2))
  )

  (:action fly-from-venice
    :parameters (?to - city)
    :precondition (and (at venice) (direct venice ?to) (venice-days-6))
    :effect (and (not (at venice)) (at ?to))
  )

  (:action fly-from-zurich
    :parameters (?to - city)
    :precondition (and (at zurich) (direct zurich ?to) (zurich-days-2))
    :effect (and (not (at zurich)) (at ?to))
  )

  (:action fly-from-florence
    :parameters (?to - city)
    :precondition (and (at florence) (direct florence ?to) (florence-days-6))
    :effect (and (not (at florence)) (at ?to))
  )
)