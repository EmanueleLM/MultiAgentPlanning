(define (domain orchestrator_combined)
  (:requirements :typing :adl :negative-preconditions :fluents)
  (:types city day)

  (:predicates
    (flight ?from - city ?to - city)
    (at ?c - city ?d - day)
    (succ ?d1 - day ?d2 - day)
    (allowed-meet ?d - day)
    (met ?d - day)
  )

  (:functions
    (seville-days)
    (munich-days)
    (tallinn-days)
    (total-cost)
  )

  (:action stay-seville
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at seville ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (at seville ?d1))
              (at seville ?d2)
              (increase (seville-days) 1)
              (increase (total-cost) 1)
            )
  )

  (:action stay-munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at munich ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (at munich ?d1))
              (at munich ?d2)
              (increase (munich-days) 1)
              (increase (total-cost) 1)
            )
  )

  (:action stay-tallinn
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at tallinn ?d1) (succ ?d1 ?d2))
    :effect (and
              (not (at tallinn ?d1))
              (at tallinn ?d2)
              (increase (tallinn-days) 1)
              (increase (total-cost) 1)
            )
  )

  (:action fly-seville-to-munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at seville ?d1) (succ ?d1 ?d2) (flight seville munich))
    :effect (and
              (not (at seville ?d1))
              (at munich ?d2)
              (increase (munich-days) 1)
              (increase (total-cost) 1)
            )
  )

  (:action fly-munich-to-seville
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at munich ?d1) (succ ?d1 ?d2) (flight munich seville))
    :effect (and
              (not (at munich ?d1))
              (at seville ?d2)
              (increase (seville-days) 1)
              (increase (total-cost) 1)
            )
  )

  (:action fly-munich-to-tallinn
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at munich ?d1) (succ ?d1 ?d2) (flight munich tallinn))
    :effect (and
              (not (at munich ?d1))
              (at tallinn ?d2)
              (increase (tallinn-days) 1)
              (increase (total-cost) 1)
            )
  )

  (:action fly-tallinn-to-munich
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at tallinn ?d1) (succ ?d1 ?d2) (flight tallinn munich))
    :effect (and
              (not (at tallinn ?d1))
              (at munich ?d2)
              (increase (munich-days) 1)
              (increase (total-cost) 1)
            )
  )

  (:action meet-in-tallinn
    :parameters (?d - day)
    :precondition (and (at tallinn ?d) (allowed-meet ?d))
    :effect (and
              (met ?d)
              (increase (total-cost) 0)
            )
  )
)