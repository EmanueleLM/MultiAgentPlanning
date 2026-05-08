(define (domain jack_of_all_trades)
  (:requirements :typing :negative-preconditions)
  (:types day city req)

  (:predicates
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (first_day ?d - day)
    (direct_flight ?c1 - city ?c2 - city)
    (in_workshop_window ?d - day)
    (req_for ?r - req ?c - city)
    (req_satisfied ?r - req)
    (workshop_satisfied)
  )

  (:action assign_first
    :parameters (?d - day ?c - city)
    :precondition (and (first_day ?d) (unassigned ?d))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)))
  )

  (:action stay
    :parameters (?dprev - day ?dnext - day ?c - city)
    :precondition (and (assigned ?dprev ?c) (next ?dprev ?dnext) (unassigned ?dnext))
    :effect (and (assigned ?dnext ?c) (not (unassigned ?dnext)))
  )

  (:action fly
    :parameters (?dprev - day ?dnext - day ?from - city ?to - city)
    :precondition (and (assigned ?dprev ?from) (next ?dprev ?dnext) (unassigned ?dnext) (direct_flight ?from ?to))
    :effect (and (assigned ?dnext ?to) (not (unassigned ?dnext)))
  )

  (:action satisfy_req
    :parameters (?r - req ?d - day ?c - city)
    :precondition (and (req_for ?r ?c) (assigned ?d ?c) (not (req_satisfied ?r)))
    :effect (req_satisfied ?r)
  )

  (:action satisfy_workshop
    :parameters (?d - day)
    :precondition (and (assigned ?d reykjavik) (in_workshop_window ?d) (not (workshop_satisfied)))
    :effect (workshop_satisfied)
  )
)