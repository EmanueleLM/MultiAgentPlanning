(define (domain multiagent-trip)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (direct ?from ?to - city)
    (free ?d - day)
  )

  (:action venice_agent_stay_venice
    :parameters (?d - day)
    :precondition (and (at venice) (free ?d))
    :effect (and (visited venice) (not (free ?d)))
  )

  (:action venice_agent_fly_venice_to_zurich
    :parameters ()
    :precondition (and (at venice) (direct venice zurich))
    :effect (and (not (at venice)) (at zurich))
  )

  (:action florence_agent_stay_florence
    :parameters (?d - day)
    :precondition (and (at florence) (free ?d))
    :effect (and (visited florence) (not (free ?d)))
  )

  (:action florence_agent_fly_zurich_to_florence
    :parameters ()
    :precondition (and (at zurich) (direct zurich florence))
    :effect (and (not (at zurich)) (at florence))
  )

  (:action zurich_agent_stay_zurich
    :parameters (?d - day)
    :precondition (and (at zurich) (free ?d))
    :effect (and (visited zurich) (not (free ?d)))
  )

  (:action zurich_agent_fly_zurich_to_venice
    :parameters ()
    :precondition (and (at zurich) (direct zurich venice))
    :effect (and (not (at zurich)) (at venice))
  )
)