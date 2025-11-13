(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?c1 - city ?c2 - city)
    (allowed-flight ?c1 - city ?c2 - city ?d - day)
    (meeting-window ?d - day)
    (met)
    (last ?d - day)
    (finished)
  )

  ;; stay from one day to the next in the same city (days 1..13)
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )

  ;; fly from one city to a directly connected city on an explicitly allowed day (days 1..13)
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
                    (at ?from ?d1)
                    (next ?d1 ?d2)
                    (direct ?from ?to)
                    (allowed-flight ?from ?to ?d1)
                  )
    :effect (and (not (at ?from ?d1)) (at ?to ?d2))
  )

  ;; meet friend in Florence — only on days inside the meeting window (days 9..14)
  ;; Note: this action references the constant 'florence' which is declared in the problem objects.
  (:action meet-friend-in-florence
    :parameters (?d - day)
    :precondition (and (at florence ?d) (meeting-window ?d))
    :effect (met)
  )

  ;; finish the trip after completing the last day (d14). This action marks the trip as finished.
  (:action finish
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (last ?d))
    :effect (and (not (at ?c ?d)) (finished))
  )
)