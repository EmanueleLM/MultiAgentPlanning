(define (domain jack_of_all_trades)
  (:requirements :typing :strips :negative-preconditions)
  (:types day city req)
  (:predicates
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (day_filled ?d - day)
    (day_bound ?d - day)
    (direct_flight ?c1 - city ?c2 - city)
    (req_for ?r - req ?c - city)
    (req_satisfied ?r - req)
    (workshop_satisfied)
    (in_workshop_window ?d - day)
    (first_day ?d - day)
    (next ?d1 - day ?d2 - day)
  )

  (:action assign_start
    :parameters (?d - day ?c - city)
    :precondition (and (first_day ?d) (unassigned ?d))
    :effect (and (assigned ?d ?c) (day_filled ?d) (not (unassigned ?d)))
  )

  (:action stay
    :parameters (?prev - day ?next - day ?c - city)
    :precondition (and (assigned ?prev ?c) (unassigned ?next) (next ?prev ?next))
    :effect (and (assigned ?next ?c) (day_filled ?next) (not (unassigned ?next)))
  )

  (:action fly
    :parameters (?prev - day ?next - day ?from - city ?to - city)
    :precondition (and (assigned ?prev ?from) (unassigned ?next) (next ?prev ?next) (direct_flight ?from ?to))
    :effect (and (assigned ?next ?to) (day_filled ?next) (not (unassigned ?next)))
  )

  (:action bind_req_to_day
    :parameters (?r - req ?d - day ?c - city)
    :precondition (and (req_for ?r ?c) (assigned ?d ?c) (not (day_bound ?d)) (not (req_satisfied ?r)))
    :effect (and (req_satisfied ?r) (day_bound ?d))
  )

  (:action satisfy_workshop
    :parameters (?d - day)
    :precondition (and (not (workshop_satisfied)) (assigned ?d reykjavik) (in_workshop_window ?d))
    :effect (workshop_satisfied)
  )
)