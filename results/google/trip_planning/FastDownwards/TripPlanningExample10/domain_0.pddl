(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (assigned ?d - day ?c - city)    ; day ?d is assigned to city ?c
    (unassigned ?d - day)           ; day ?d has not yet been assigned
    (next ?d1 - day ?d2 - day)      ; temporal successor relation between days
    (direct ?c1 - city ?c2 - city)  ; direct flight exists between cities (directional)
    (start-day ?d - day)            ; designated start day (day1)
  )

  ;; Start in a chosen city on the designated start day (day1).
  (:action start-in
    :parameters (?c - city ?d - day)
    :precondition (and (unassigned ?d) (start-day ?d))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)) (not (start-day ?d)))
  )

  ;; Stay in the same city from one day to the next.
  ;; This action is generic but logically corresponds to a city's local stay action.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (assigned ?d1 ?c) (next ?d1 ?d2) (unassigned ?d2))
    :effect (and (assigned ?d2 ?c) (not (unassigned ?d2)))
  )

  ;; Flights: only include actions that correspond to explicitly listed direct connections.
  ;; Oslo <-> Dublin connections
  (:action fly-oslo-to-dublin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (assigned ?d1 oslo) (next ?d1 ?d2) (unassigned ?d2) (direct oslo dublin))
    :effect (and (assigned ?d2 dublin) (not (unassigned ?d2)))
  )
  (:action fly-dublin-to-oslo
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (assigned ?d1 dublin) (next ?d1 ?d2) (unassigned ?d2) (direct dublin oslo))
    :effect (and (assigned ?d2 oslo) (not (unassigned ?d2)))
  )

  ;; Dublin <-> Valencia connections
  (:action fly-dublin-to-valencia
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (assigned ?d1 dublin) (next ?d1 ?d2) (unassigned ?d2) (direct dublin valencia))
    :effect (and (assigned ?d2 valencia) (not (unassigned ?d2)))
  )
  (:action fly-valencia-to-dublin
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (assigned ?d1 valencia) (next ?d1 ?d2) (unassigned ?d2) (direct valencia dublin))
    :effect (and (assigned ?d2 dublin) (not (unassigned ?d2)))
  )
)