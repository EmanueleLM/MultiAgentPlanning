(define (domain trip_planning)
  (:requirements :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (at ?d - day ?c - city)
    (free ?d - day)
    (next ?d1 - day ?d2 - day)
    (first_day ?d - day)
    (direct_flight ?c1 - city ?c2 - city)
    (in_workshop_window ?d - day)
    (workshop_satisfied)
  )

  (:action assign_first
    :parameters (?d - day ?c - city)
    :precondition (and (first_day ?d) (free ?d))
    :effect (and (not (free ?d)) (at ?d ?c))
  )

  (:action stay
    :parameters (?dprev - day ?dnext - day ?c - city)
    :precondition (and (at ?dprev ?c) (next ?dprev ?dnext) (free ?dnext))
    :effect (and (not (free ?dnext)) (at ?dnext ?c))
  )

  (:action fly
    :parameters (?dprev - day ?dnext - day ?from - city ?to - city)
    :precondition (and (at ?dprev ?from) (next ?dprev ?dnext) (direct_flight ?from ?to) (free ?dnext))
    :effect (and (not (free ?dnext)) (at ?dnext ?to))
  )

  (:action mark_workshop
    :parameters (?d - day)
    :precondition (and (at ?d reykjavik) (in_workshop_window ?d) (not (workshop_satisfied)))
    :effect (workshop_satisfied)
  )
)