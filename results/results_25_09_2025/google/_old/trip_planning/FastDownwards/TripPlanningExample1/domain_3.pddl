(define (domain integrated-travel)
  (:requirements :strips :typing :equality)
  (:types person city day)

  (:predicates
    (at-person ?p - person ?c - city)
    (direct ?from - city ?to - city)
    (unassigned ?d - day)
    (day-at ?d - day ?c - city)
    (visited1 ?c - city)
    (visited2 ?c - city)
    (visited3 ?c - city)
  )

  (:action agent1_start-in
    :parameters (?p - person ?c - city)
    :precondition (at-person ?p ?c)
    :effect (at-person ?p ?c)
  )

  (:action agent1_fly
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and (at-person ?p ?from) (direct ?from ?to))
    :effect (and
              (not (at-person ?p ?from))
              (at-person ?p ?to)
            )
  )

  (:action agent1_stay
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and (at-person ?p ?c) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d ?c)
              (visited1 ?c)
            )
  )

  (:action agent2_fly
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and (at-person ?p ?from) (direct ?from ?to))
    :effect (and
              (not (at-person ?p ?from))
              (at-person ?p ?to)
            )
  )

  (:action agent2_assign-day
    :parameters (?p - person ?d - day ?c - city)
    :precondition (and (at-person ?p ?c) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d ?c)
              (visited2 ?c)
            )
  )

  (:action agent3_fly
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and (at-person ?p ?from) (direct ?from ?to))
    :effect (and
              (not (at-person ?p ?from))
              (at-person ?p ?to)
            )
  )

  (:action agent3_stay-one-day
    :parameters (?p - person ?c - city ?d - day)
    :precondition (and (at-person ?p ?c) (unassigned ?d))
    :effect (and
              (not (unassigned ?d))
              (day-at ?d ?c)
              (visited3 ?c)
            )
  )
)