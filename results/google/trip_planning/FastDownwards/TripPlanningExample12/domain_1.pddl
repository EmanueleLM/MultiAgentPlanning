(define (domain trip-planning)
  (:requirements :strips :negative-preconditions :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (occupied ?d - day)
    (succ ?d1 - day ?d2 - day)
    (edge ?c1 - city ?c2 - city)
    (startday ?d - day)
  )

  ;; Start actions for each city (distinct names per city agent)
  (:action start-valencia
    :parameters (?d - day)
    :precondition (and (startday ?d) (not (occupied ?d)))
    :effect (and (occupied ?d) (at valencia ?d))
  )

  (:action start-amsterdam
    :parameters (?d - day)
    :precondition (and (startday ?d) (not (occupied ?d)))
    :effect (and (occupied ?d) (at amsterdam ?d))
  )

  (:action start-tallinn
    :parameters (?d - day)
    :precondition (and (startday ?d) (not (occupied ?d)))
    :effect (and (occupied ?d) (at tallinn ?d))
  )

  ;; Stay actions (distinct per city)
  (:action stay-valencia
    :parameters (?d - day ?dnext - day)
    :precondition (and (at valencia ?d) (succ ?d ?dnext) (not (occupied ?dnext)))
    :effect (and (at valencia ?dnext) (occupied ?dnext))
  )

  (:action stay-amsterdam
    :parameters (?d - day ?dnext - day)
    :precondition (and (at amsterdam ?d) (succ ?d ?dnext) (not (occupied ?dnext)))
    :effect (and (at amsterdam ?dnext) (occupied ?dnext))
  )

  (:action stay-tallinn
    :parameters (?d - day ?dnext - day)
    :precondition (and (at tallinn ?d) (succ ?d ?dnext) (not (occupied ?dnext)))
    :effect (and (at tallinn ?dnext) (occupied ?dnext))
  )

  ;; Flight actions (distinct names; only allowed along given direct edges)
  (:action fly-valencia-to-amsterdam
    :parameters (?d - day ?dnext - day)
    :precondition (and (at valencia ?d) (edge valencia amsterdam) (succ ?d ?dnext) (not (occupied ?dnext)))
    :effect (and (at amsterdam ?dnext) (occupied ?dnext))
  )

  (:action fly-amsterdam-to-valencia
    :parameters (?d - day ?dnext - day)
    :precondition (and (at amsterdam ?d) (edge amsterdam valencia) (succ ?d ?dnext) (not (occupied ?dnext)))
    :effect (and (at valencia ?dnext) (occupied ?dnext))
  )

  (:action fly-amsterdam-to-tallinn
    :parameters (?d - day ?dnext - day)
    :precondition (and (at amsterdam ?d) (edge amsterdam tallinn) (succ ?d ?dnext) (not (occupied ?dnext)))
    :effect (and (at tallinn ?dnext) (occupied ?dnext))
  )

  (:action fly-tallinn-to-amsterdam
    :parameters (?d - day ?dnext - day)
    :precondition (and (at tallinn ?d) (edge tallinn amsterdam) (succ ?d ?dnext) (not (occupied ?dnext)))
    :effect (and (at amsterdam ?dnext) (occupied ?dnext))
  )
)