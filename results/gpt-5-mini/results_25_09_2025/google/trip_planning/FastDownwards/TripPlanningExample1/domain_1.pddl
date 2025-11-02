(define (domain trip_domain_multiagent)
  (:requirements :typing :negative-preconditions :equality :adl :action-costs)
  (:types city day)

  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (day-free ?d - day)
    (day-assigned ?d - day ?c - city)
  )

  (:action riga_planner-stay
    :parameters (?d - day)
    :precondition (and (at riga) (day-free ?d))
    :effect (and (not (day-free ?d)) (day-assigned ?d riga) (visited riga))
    :cost 1
  )

  (:action riga_planner-fly-riga-to-manchester
    :parameters ()
    :precondition (at riga)
    :effect (and (not (at riga)) (at manchester))
    :cost 0
  )

  (:action manchester_planner-stay
    :parameters (?d - day)
    :precondition (and (at manchester) (day-free ?d))
    :effect (and (not (day-free ?d)) (day-assigned ?d manchester) (visited manchester))
    :cost 1
  )

  (:action manchester_planner-fly-manchester-to-riga
    :parameters ()
    :precondition (at manchester)
    :effect (and (not (at manchester)) (at riga))
    :cost 0
  )

  (:action manchester_planner-fly-manchester-to-split
    :parameters ()
    :precondition (at manchester)
    :effect (and (not (at manchester)) (at split))
    :cost 0
  )

  (:action split_planner-stay
    :parameters (?d - day)
    :precondition (and (at split) (day-free ?d))
    :effect (and (not (day-free ?d)) (day-assigned ?d split) (visited split))
    :cost 1
  )
)