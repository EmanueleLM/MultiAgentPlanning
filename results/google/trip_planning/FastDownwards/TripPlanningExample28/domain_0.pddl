(define (domain multiagent-trip)
  (:requirements :strips :typing :negative-preconditions :fluents :numeric-fluents)
  (:types city)
  (:predicates
    (at ?c - city)
    (visited ?c - city)
    (direct ?from ?to - city)
  )
  (:functions
    (days-passed) ; numeric fluent counting days spent in cities
  )

  ;------------------------------
  ; Actions owned by venice_agent
  ;------------------------------
  (:action venice_agent_stay_venice
    :parameters ()
    :precondition (at venice)
    :effect (and
              (visited venice)
              (increase (days-passed) 1)
            )
  )

  (:action venice_agent_fly_venice_to_zurich
    :parameters ()
    :precondition (and (at venice) (direct venice zurich))
    :effect (and (not (at venice)) (at zurich))
  )

  ;------------------------------
  ; Actions owned by florence_agent
  ;------------------------------
  (:action florence_agent_stay_florence
    :parameters ()
    :precondition (at florence)
    :effect (and
              (visited florence)
              (increase (days-passed) 1)
            )
  )

  (:action florence_agent_fly_zurich_to_florence
    :parameters ()
    :precondition (and (at zurich) (direct zurich florence))
    :effect (and (not (at zurich)) (at florence))
  )

  ;------------------------------
  ; Actions owned by zurich_agent
  ;------------------------------
  (:action zurich_agent_stay_zurich
    :parameters ()
    :precondition (at zurich)
    :effect (and
              (visited zurich)
              (increase (days-passed) 1)
            )
  )

  (:action zurich_agent_fly_zurich_to_venice
    :parameters ()
    :precondition (and (at zurich) (direct zurich venice))
    :effect (and (not (at zurich)) (at venice))
  )

)