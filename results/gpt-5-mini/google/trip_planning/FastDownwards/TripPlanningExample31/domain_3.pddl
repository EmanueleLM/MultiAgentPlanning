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
    (unconsumed_day ?d - day)
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

  ;; use a single unconsumed_day token to count one day of presence; each satisfy consumes it
  (:action satisfy_req
    :parameters (?r - req ?d - day ?c - city)
    :precondition (and (req_for ?r ?c) (assigned ?d ?c) (unconsumed_day ?d) (not (req_satisfied ?r)))
    :effect (and (req_satisfied ?r) (not (unconsumed_day ?d)))
  )

  (:action satisfy_workshop
    :parameters (?d - day)
    :precondition (and (assigned ?d reykjavik) (in_workshop_window ?d) (unconsumed_day ?d) (not (workshop_satisfied)))
    :effect (and (workshop_satisfied) (not (unconsumed_day ?d)))
  )
)