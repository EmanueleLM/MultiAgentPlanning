(define (domain trip_domain_multiagent)
  (:requirements :typing :negative-preconditions :equality :adl :fluents)
  (:types city day)
  (:constants riga manchester split - city)
  (:functions (total-cost))
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (day-free ?d - day)
    (day-assigned ?d - day ?c - city)
  )

  (:action riga_planner-stay
    :parameters (?d - day)
    :precondition (and (at riga) (day-free ?d))
    :effect (and (not (day-free ?d)) (day-assigned ?d riga) (visited riga) (increase (total-cost) 1))
  )

  (:action riga_planner-fly-riga-to-manchester
    :parameters ()
    :precondition (at riga)
    :effect (and (not (at riga)) (at manchester))
  )

  (:action manchester_planner-stay
    :parameters (?d - day)
    :precondition (and (at manchester) (day-free ?d))
    :effect (and (not (day-free ?d)) (day-assigned ?d manchester) (visited manchester) (increase (total-cost) 1))
  )

  (:action manchester_planner-fly-manchester-to-riga
    :parameters ()
    :precondition (at manchester)
    :effect (and (not (at manchester)) (at riga))
  )

  (:action manchester_planner-fly-manchester-to-split
    :parameters ()
    :precondition (at manchester)
    :effect (and (not (at manchester)) (at split))
  )

  (:action split_planner-stay
    :parameters (?d - day)
    :precondition (and (at split) (day-free ?d))
    :effect (and (not (day-free ?d)) (day-assigned ?d split) (visited split) (increase (total-cost) 1))
  )
)