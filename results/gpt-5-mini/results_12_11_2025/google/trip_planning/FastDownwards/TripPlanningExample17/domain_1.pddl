(define (domain TripPlanningExample17-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (current ?d - day)
    (next ?d1 ?d2 - day)
    (at ?c - city)
    (direct ?c1 ?c2 - city)
    (visited ?c - city)
    (conf_day ?d - day)
    (ready ?d - day)
  )

  (:action attend_conf
    :parameters (?d - day)
    :precondition (and (current ?d) (conf_day ?d) (at copenhagen))
    :effect (and (ready ?d))
  )

  (:action stay
    :parameters (?d ?d2 - day ?c - city)
    :precondition (and (current ?d) (ready ?d) (at ?c) (next ?d ?d2))
    :effect (and
      (not (current ?d))
      (current ?d2)
      ;; keep being at the same city
      (at ?c)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?d ?d2 - day ?c1 ?c2 - city)
    :precondition (and (current ?d) (ready ?d) (at ?c1) (direct ?c1 ?c2) (next ?d ?d2))
    :effect (and
      (not (current ?d))
      (current ?d2)
      (not (at ?c1))
      (at ?c2)
      (visited ?c2)
    )
  )
)