(define (domain multiagent-trip)
  (:requirements :strips :typing :equality)
  (:types city agent daycount)
  (:predicates
    (at ?c - city)
    (unvisited ?c - city)
    (visited ?c - city)
    (day ?d - daycount)
    (delta ?from ?to - daycount)
    (direct_flight ?from ?to - city)
  )

  (:action fly_dubrovnik_to_istanbul_by_dubrovnik_agent
    :parameters ()
    :precondition (and (at dubrovnik) (direct_flight dubrovnik istanbul))
    :effect (and
              (not (at dubrovnik))
              (at istanbul)
            )
  )

  (:action fly_istanbul_to_budapest_by_istanbul_agent
    :parameters ()
    :precondition (and (at istanbul) (direct_flight istanbul budapest))
    :effect (and
              (not (at istanbul))
              (at budapest)
            )
  )

  (:action fly_budapest_to_istanbul_by_budapest_agent
    :parameters ()
    :precondition (and (at budapest) (direct_flight budapest istanbul))
    :effect (and
              (not (at budapest))
              (at istanbul)
            )
  )

  (:action stay_in_dubrovnik_by_dubrovnik_agent
    :parameters (?from ?to - daycount)
    :precondition (and (at dubrovnik) (unvisited dubrovnik) (day ?from) (delta ?from ?to))
    :effect (and
              (visited dubrovnik)
              (not (unvisited dubrovnik))
              (not (day ?from))
              (day ?to)
            )
  )

  (:action stay_in_istanbul_by_istanbul_agent
    :parameters (?from ?to - daycount)
    :precondition (and (at istanbul) (unvisited istanbul) (day ?from) (delta ?from ?to))
    :effect (and
              (visited istanbul)
              (not (unvisited istanbul))
              (not (day ?from))
              (day ?to)
            )
  )

  (:action stay_in_budapest_by_budapest_agent
    :parameters (?from ?to - daycount)
    :precondition (and (at budapest) (unvisited budapest) (day ?from) (delta ?from ?to))
    :effect (and
              (visited budapest)
              (not (unvisited budapest))
              (not (day ?from))
              (day ?to)
            )
  )
)