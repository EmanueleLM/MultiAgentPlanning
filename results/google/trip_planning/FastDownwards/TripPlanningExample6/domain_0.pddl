; Domain: multiagent_trip
; This domain encodes a single traveler's 8-day itinerary.
; Actions are kept distinct per agent: dubrovnik_agent, berlin_agent, munich_agent.
; Each agent has "fly-<agent>" and "stay-<agent>" actions that can produce the traveler's location
; for the next day. Only direct flights (flight predicate) may be used by fly actions.

(define (domain multiagent_trip)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)      ; traveler is at city c on day d
    (next ?d1 - day ?d2 - day)  ; day ordering
    (flight ?from - city ?to - city) ; direct flight exists from->to
  )

  ; --- Actions for dubrovnik_agent ---
  (:action fly-dubrovnik_agent
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (flight ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action stay-dubrovnik_agent
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  ; --- Actions for berlin_agent ---
  (:action fly-berlin_agent
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (flight ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action stay-berlin_agent
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  ; --- Actions for munich_agent ---
  (:action fly-munich_agent
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (flight ?from ?to))
    :effect (and (at ?to ?d2))
  )

  (:action stay-munich_agent
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

)