(define (domain travel-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types city day)

  (:constants paris istanbul salzburg - city)

  (:predicates
    (at ?c - city ?d - day)
    (day-free ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct-flight ?c1 - city ?c2 - city)
  )

  (:action stay-paris
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (at paris ?dprev) (next ?dprev ?dcur) (day-free ?dcur))
    :effect (and (at paris ?dcur) (not (day-free ?dcur)))
  )

  (:action stay-istanbul
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (at istanbul ?dprev) (next ?dprev ?dcur) (day-free ?dcur))
    :effect (and (at istanbul ?dcur) (not (day-free ?dcur)))
  )

  (:action stay-salzburg
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (at salzburg ?dprev) (next ?dprev ?dcur) (day-free ?dcur))
    :effect (and (at salzburg ?dcur) (not (day-free ?dcur)))
  )

  (:action fly-paris-to-istanbul
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (at paris ?dprev) (next ?dprev ?dcur) (day-free ?dcur) (direct-flight paris istanbul))
    :effect (and (at istanbul ?dcur) (not (day-free ?dcur)))
  )

  (:action fly-istanbul-to-paris
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (at istanbul ?dprev) (next ?dprev ?dcur) (day-free ?dcur) (direct-flight istanbul paris))
    :effect (and (at paris ?dcur) (not (day-free ?dcur)))
  )

  (:action fly-istanbul-to-salzburg
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (at istanbul ?dprev) (next ?dprev ?dcur) (day-free ?dcur) (direct-flight istanbul salzburg))
    :effect (and (at salzburg ?dcur) (not (day-free ?dcur)))
  )

  (:action fly-salzburg-to-istanbul
    :parameters (?dprev - day ?dcur - day)
    :precondition (and (at salzburg ?dprev) (next ?dprev ?dcur) (day-free ?dcur) (direct-flight salzburg istanbul))
    :effect (and (at istanbul ?dcur) (not (day-free ?dcur)))
  )
)