(define (domain trip_domain_multiagent)
  (:requirements :typing :negative-preconditions :equality :fluents)
  (:types city)

  (:predicates
    (at ?c - city)
    (visited ?c - city)
  )

  (:functions
    (total-days)
    (days ?c - city)
  )

  ;; Actions belonging to riga_planner
  (:action riga_planner-stay
    :parameters ()
    :precondition (at riga)
    :effect (and
      (increase (total-days) 1)
      (increase (days riga) 1)
      (visited riga)
    )
  )

  (:action riga_planner-fly-riga-to-manchester
    :parameters ()
    :precondition (at riga)
    :effect (and
      (not (at riga))
      (at manchester)
    )
  )

  ;; Actions belonging to manchester_planner
  (:action manchester_planner-stay
    :parameters ()
    :precondition (at manchester)
    :effect (and
      (increase (total-days) 1)
      (increase (days manchester) 1)
      (visited manchester)
    )
  )

  (:action manchester_planner-fly-manchester-to-riga
    :parameters ()
    :precondition (at manchester)
    :effect (and
      (not (at manchester))
      (at riga)
    )
  )

  (:action manchester_planner-fly-manchester-to-split
    :parameters ()
    :precondition (at manchester)
    :effect (and
      (not (at manchester))
      (at split)
    )
  )

  ;; Actions belonging to split_planner
  (:action split_planner-stay
    :parameters ()
    :precondition (at split)
    :effect (and
      (increase (total-days) 1)
      (increase (days split) 1)
      (visited split)
    )
  )
)