(define (domain travel-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day)

  (:predicates
    (assigned ?c - city ?d - day)
    (day-free ?d - day)
  )

  ;; Stays (distinct actions per city)
  (:action stay-paris
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (assigned paris ?dprev) (day-free ?dcur))
    :effect (and (assigned paris ?dcur) (not (day-free ?dcur)))
  )

  (:action stay-istanbul
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (assigned istanbul ?dprev) (day-free ?dcur))
    :effect (and (assigned istanbul ?dcur) (not (day-free ?dcur)))
  )

  (:action stay-salzburg
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (assigned salzburg ?dprev) (day-free ?dcur))
    :effect (and (assigned salzburg ?dcur) (not (day-free ?dcur)))
  )

  ;; Flights (distinct actions for each allowed direct-leg)
  ;; Only legs with known direct flights are provided (no Paris<->Salzburg)
  (:action fly-paris-to-istanbul
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (assigned paris ?dprev) (day-free ?dcur))
    :effect (and (assigned istanbul ?dcur) (not (day-free ?dcur)))
  )

  (:action fly-istanbul-to-paris
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (assigned istanbul ?dprev) (day-free ?dcur))
    :effect (and (assigned paris ?dcur) (not (day-free ?dcur)))
  )

  (:action fly-istanbul-to-salzburg
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (assigned istanbul ?dprev) (day-free ?dcur))
    :effect (and (assigned salzburg ?dcur) (not (day-free ?dcur)))
  )

  (:action fly-salzburg-to-istanbul
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (assigned salzburg ?dprev) (day-free ?dcur))
    :effect (and (assigned istanbul ?dcur) (not (day-free ?dcur)))
  )
)