(define (domain trip_planning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:predicates
    (free ?d - day)
    (first-day ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (visited ?c - city)
    (flight ?from - city ?to - city)
    (day-in-meeting-window ?d - day)
    (is-tallinn ?c - city)
    (tallinn_meet)
  )

  ;; Assign the first day to a city (three distinct actions preserving city origin)
  (:action assign-first-valencia
    :parameters (?d - day)
    :precondition (and (first-day ?d) (free ?d))
    :effect (and (not (free ?d)) (at valencia ?d) (visited valencia))
  )

  (:action assign-first-amsterdam
    :parameters (?d - day)
    :precondition (and (first-day ?d) (free ?d))
    :effect (and (not (free ?d)) (at amsterdam ?d) (visited amsterdam))
  )

  (:action assign-first-tallinn
    :parameters (?d - day)
    :precondition (and (first-day ?d) (free ?d))
    :effect (and (not (free ?d)) (at tallinn ?d) (visited tallinn))
  )

  ;; Staying in the same city for the next day (distinct names per city)
  (:action stay-valencia
    :parameters (?dprev - day ?d - day)
    :precondition (and (at valencia ?dprev) (next ?dprev ?d) (free ?d))
    :effect (and (not (free ?d)) (at valencia ?d) (visited valencia))
  )

  (:action stay-amsterdam
    :parameters (?dprev - day ?d - day)
    :precondition (and (at amsterdam ?dprev) (next ?dprev ?d) (free ?d))
    :effect (and (not (free ?d)) (at amsterdam ?d) (visited amsterdam))
  )

  ;; Two variants for Tallinn staying: one that records the meeting when the day is in the window
  (:action stay-tallinn
    :parameters (?dprev - day ?d - day)
    :precondition (and (at tallinn ?dprev) (next ?dprev ?d) (free ?d))
    :effect (and (not (free ?d)) (at tallinn ?d) (visited tallinn))
  )

  (:action stay-tallinn-meet
    :parameters (?dprev - day ?d - day)
    :precondition (and (at tallinn ?dprev) (next ?dprev ?d) (free ?d) (day-in-meeting-window ?d))
    :effect (and (not (free ?d)) (at tallinn ?d) (visited tallinn) (tallinn_meet))
  )

  ;; Moves along direct flights. Action names preserve origin/destination.
  (:action move-valencia-to-amsterdam
    :parameters (?dprev - day ?d - day)
    :precondition (and (at valencia ?dprev) (next ?dprev ?d) (free ?d) (flight valencia amsterdam))
    :effect (and (not (free ?d)) (at amsterdam ?d) (visited amsterdam))
  )

  (:action move-amsterdam-to-valencia
    :parameters (?dprev - day ?d - day)
    :precondition (and (at amsterdam ?dprev) (next ?dprev ?d) (free ?d) (flight amsterdam valencia))
    :effect (and (not (free ?d)) (at valencia ?d) (visited valencia))
  )

  (:action move-amsterdam-to-tallinn
    :parameters (?dprev - day ?d - day)
    :precondition (and (at amsterdam ?dprev) (next ?dprev ?d) (free ?d) (flight amsterdam tallinn))
    :effect (and (not (free ?d)) (at tallinn ?d) (visited tallinn))
  )

  (:action move-amsterdam-to-tallinn-meet
    :parameters (?dprev - day ?d - day)
    :precondition (and (at amsterdam ?dprev) (next ?dprev ?d) (free ?d) (flight amsterdam tallinn) (day-in-meeting-window ?d))
    :effect (and (not (free ?d)) (at tallinn ?d) (visited tallinn) (tallinn_meet))
  )

  (:action move-tallinn-to-amsterdam
    :parameters (?dprev - day ?d - day)
    :precondition (and (at tallinn ?dprev) (next ?dprev ?d) (free ?d) (flight tallinn amsterdam))
    :effect (and (not (free ?d)) (at amsterdam ?d) (visited amsterdam))
  )

)