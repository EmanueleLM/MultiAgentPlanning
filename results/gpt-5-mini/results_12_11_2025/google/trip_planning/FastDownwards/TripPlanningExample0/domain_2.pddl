(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (allowed-flight ?c1 - city ?c2 - city ?d - day)
    (meeting-window ?d - day)
    (is-florence ?c - city)
    (met)
    (last ?d - day)
    (finished)
  )

  ;; Stay in the same city from one day to the next
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  ;; Fly between two directly connected cities on an allowed departure day
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (direct ?from ?to) (allowed-flight ?from ?to ?d1))
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  ;; Meet friend in Florence on a day inside the meeting window (requires being in the Florence city)
  (:action meet-friend
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (meeting-window ?d) (is-florence ?c))
    :effect (met)
  )

  ;; Finish the trip after occupying the final day
  (:action finish
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (last ?d))
    :effect (and (not (at ?c ?d)) (finished))
  )
)