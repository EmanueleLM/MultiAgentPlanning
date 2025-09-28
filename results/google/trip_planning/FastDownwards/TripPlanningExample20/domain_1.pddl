(define (domain multiagent-trip)
  (:requirements :strips :typing :negative-preconditions :fluents :equality)
  (:types city agent)
  (:predicates
    (at ?c - city)
    (unvisited ?c - city)
    (visited ?c - city)
  )
  (:functions (days-used))
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