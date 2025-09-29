(define (domain multiagent-trip)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:types city agent)

  ;; state predicates
  (:predicates
    (at ?c - city)            ; traveler is at city ?c
    (unvisited ?c - city)     ; city still needs to be visited
    (visited ?c - city)       ; city has been visited
  )

  ;; numeric function to accumulate days used
  (:functions (days-used))

  ;; Flight actions — only direct flights provided by public information.
  ;; Agent role is encoded in the action name to keep agent roles distinct.
  (:action fly_dubrovnik_to_istanbul_by_dubrovnik_agent
    :parameters ()
    :precondition (at dubrovnik)
    :effect (and
              (not (at dubrovnik))
              (at istanbul)
            )
  )

  (:action fly_istanbul_to_budapest_by_istanbul_agent
    :parameters ()
    :precondition (at istanbul)
    :effect (and
              (not (at istanbul))
              (at budapest)
            )
  )

  (:action fly_budapest_to_istanbul_by_budapest_agent
    :parameters ()
    :precondition (at budapest)
    :effect (and
              (not (at budapest))
              (at istanbul)
            )
  )

  ;; Stay actions for each city. These are the local "visit" actions proposed by each agent.
  ;; Each stay action:
  ;;  - requires the traveler to be at that city,
  ;;  - requires the city to still be unvisited,
  ;;  - marks the city visited (removing unvisited),
  ;;  - increases the global days-used by the city's allocated stay (hard constraint).
  ;; Agent role is encoded in the stay action's name.

  (:action stay_in_dubrovnik_by_dubrovnik_agent
    :parameters ()
    :precondition (and (at dubrovnik) (unvisited dubrovnik))
    :effect (and
              (visited dubrovnik)
              (not (unvisited dubrovnik))
              (increase (days-used) 3)
            )
  )

  (:action stay_in_istanbul_by_istanbul_agent
    :parameters ()
    :precondition (and (at istanbul) (unvisited istanbul))
    :effect (and
              (visited istanbul)
              (not (unvisited istanbul))
              (increase (days-used) 5)
            )
  )

  (:action stay_in_budapest_by_budapest_agent
    :parameters ()
    :precondition (and (at budapest) (unvisited budapest))
    :effect (and
              (visited budapest)
              (not (unvisited budapest))
              (increase (days-used) 4)
            )
  )
)