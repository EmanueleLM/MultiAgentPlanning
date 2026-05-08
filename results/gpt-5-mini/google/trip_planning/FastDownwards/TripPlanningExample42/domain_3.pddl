(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
    (slot_for ?s - slot ?c - city)
    (used ?s - slot)
    (met)
    (meet_allowed ?d - day)
    (initial_day ?d - day)
  )

  (:action assign_first_day
    :parameters (?c - city ?s - slot ?d - day)
    :precondition (and
                    (initial_day ?d)
                    (slot_for ?s ?c)
                    (not (used ?s))
                    (not (assigned ?d))
                  )
    :effect (and
              (at ?c ?d)
              (assigned ?d)
              (used ?s)
            )
  )

  (:action stay_assign
    :parameters (?c - city ?s - slot ?dprev - day ?dcurr - day)
    :precondition (and
                    (at ?c ?dprev)
                    (next ?dprev ?dcurr)
                    (slot_for ?s ?c)
                    (not (used ?s))
                    (not (assigned ?dcurr))
                  )
    :effect (and
              (at ?c ?dcurr)
              (assigned ?dcurr)
              (used ?s)
            )
  )

  (:action fly_assign
    :parameters (?from - city ?to - city ?s - slot ?dprev - day ?dcurr - day)
    :precondition (and
                    (at ?from ?dprev)
                    (next ?dprev ?dcurr)
                    (flight ?from ?to)
                    (slot_for ?s ?to)
                    (not (used ?s))
                    (not (assigned ?dcurr))
                  )
    :effect (and
              (at ?to ?dcurr)
              (assigned ?dcurr)
              (used ?s)
            )
  )

  (:action meet_friends
    :parameters (?d - day)
    :precondition (and
                    (at paris ?d)
                    (meet_allowed ?d)
                    (not (met))
                  )
    :effect (met)
  )
)