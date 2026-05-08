(define (domain trip16)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)       ; traveler is at city ?c on day ?d
    (next ?d1 - day ?d2 - day)   ; ?d2 is the day immediately after ?d1
    (attended ?d - day)          ; conference attendance recorded for day ?d
  )

  ;; AgentA: Porto -> Oslo flights
  (:action fly_porto_oslo_agentA
    :parameters (?d - day ?d2 - day)
    :precondition (and (at porto ?d) (next ?d ?d2))
    :effect (and (not (at porto ?d)) (at oslo ?d2))
  )

  ;; AgentB: Oslo -> Dubrovnik flight
  (:action fly_oslo_dubrovnik_agentB
    :parameters (?d - day ?d2 - day)
    :precondition (and (at oslo ?d) (next ?d ?d2))
    :effect (and (not (at oslo ?d)) (at dubrovnik ?d2))
  )

  ;; AgentB: Dubrovnik -> Oslo flight (included for completeness / round trips)
  (:action fly_dubrovnik_oslo_agentB
    :parameters (?d - day ?d2 - day)
    :precondition (and (at dubrovnik ?d) (next ?d ?d2))
    :effect (and (not (at dubrovnik ?d)) (at oslo ?d2))
  )

  ;; AgentC: stay in same city for the next day
  (:action stay_agentC
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and (not (at ?c ?d)) (at ?c ?d2))
  )

  ;; AgentC: attend conference on day12 in Dubrovnik
  (:action attend_agentC_day12
    :parameters ()
    :precondition (and (at dubrovnik day12))
    :effect (and (attended day12))
  )

  ;; AgentC: attend conference on day16 in Dubrovnik
  (:action attend_agentC_day16
    :parameters ()
    :precondition (and (at dubrovnik day16))
    :effect (and (attended day16))
  )
)