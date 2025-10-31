(define (domain travel-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (day ?d - day)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (at ?c - city ?d - day)
    (covered ?d - day)
    (allowed-meet-day ?d - day)
    (met)
  )

  ;; Stay actions: remain in the same city from one day to the next.
  (:action stay-in-barcelona
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at barcelona ?d1))
    :effect (and (not (current ?d1)) (current ?d2) (at barcelona ?d2) (covered ?d2))
  )

  (:action stay-in-florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at florence ?d1))
    :effect (and (not (current ?d1)) (current ?d2) (at florence ?d2) (covered ?d2))
  )

  (:action stay-in-helsinki
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at helsinki ?d1))
    :effect (and (not (current ?d1)) (current ?d2) (at helsinki ?d2) (covered ?d2))
  )

  ;; Flight actions: only direct flights are allowed (Barcelona <-> Florence, Barcelona <-> Helsinki)
  (:action fly-barcelona-to-florence
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at barcelona ?d1))
    :effect (and (not (current ?d1)) (current ?d2) (at florence ?d2) (covered ?d2))
  )

  (:action fly-florence-to-barcelona
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at florence ?d1))
    :effect (and (not (current ?d1)) (current ?d2) (at barcelona ?d2) (covered ?d2))
  )

  (:action fly-barcelona-to-helsinki
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at barcelona ?d1))
    :effect (and (not (current ?d1)) (current ?d2) (at helsinki ?d2) (covered ?d2))
  )

  (:action fly-helsinki-to-barcelona
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (current ?d1) (next ?d1 ?d2) (at helsinki ?d1))
    :effect (and (not (current ?d1)) (current ?d2) (at barcelona ?d2) (covered ?d2))
  )

  ;; Confirm meeting: can only be applied on allowed meeting days and requires being in Florence that day.
  (:action confirm-in-florence
    :parameters (?d - day)
    :precondition (and (at florence ?d) (allowed-meet-day ?d))
    :effect (met)
  )
)