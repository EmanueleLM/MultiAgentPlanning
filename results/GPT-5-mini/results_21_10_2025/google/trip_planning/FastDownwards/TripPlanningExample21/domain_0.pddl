(define (domain travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)          ; agent is in city ?c on day ?d
    (next ?d - day ?dn - day)       ; temporal successor relation between days
    (workshop-done)                 ; workshop in Venice has been held
  )

  ;; Stay in the same city from one day to the next (consumes the full day)
  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn))
    :effect (and (not (at ?c ?d)) (at ?c ?dn))
  )

  ;; Direct flights: only the allowed direct connections are modeled.
  ;; Mykonos <-> Vienna
  (:action fly-mykonos-to-vienna
    :parameters (?d - day ?dn - day)
    :precondition (and (at mykonos ?d) (next ?d ?dn))
    :effect (and (not (at mykonos ?d)) (at vienna ?dn))
  )

  (:action fly-vienna-to-mykonos
    :parameters (?d - day ?dn - day)
    :precondition (and (at vienna ?d) (next ?d ?dn))
    :effect (and (not (at vienna ?d)) (at mykonos ?dn))
  )

  ;; Vienna <-> Venice
  (:action fly-vienna-to-venice
    :parameters (?d - day ?dn - day)
    :precondition (and (at vienna ?d) (next ?d ?dn))
    :effect (and (not (at vienna ?d)) (at venice ?dn))
  )

  (:action fly-venice-to-vienna
    :parameters (?d - day ?dn - day)
    :precondition (and (at venice ?d) (next ?d ?dn))
    :effect (and (not (at venice ?d)) (at vienna ?dn))
  )

  ;; Workshop actions: one action per possible workshop day (day5 .. day10).
  ;; Any one of these actions can make the workshop-done fact true if the agent is in Venice that day.
  (:action hold-workshop-day5
    :parameters ()
    :precondition (at venice day5)
    :effect (workshop-done)
  )
  (:action hold-workshop-day6
    :parameters ()
    :precondition (at venice day6)
    :effect (workshop-done)
  )
  (:action hold-workshop-day7
    :parameters ()
    :precondition (at venice day7)
    :effect (workshop-done)
  )
  (:action hold-workshop-day8
    :parameters ()
    :precondition (at venice day8)
    :effect (workshop-done)
  )
  (:action hold-workshop-day9
    :parameters ()
    :precondition (at venice day9)
    :effect (workshop-done)
  )
  (:action hold-workshop-day10
    :parameters ()
    :precondition (at venice day10)
    :effect (workshop-done)
  )
)