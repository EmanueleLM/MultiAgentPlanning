(define (domain multiagent-itinerary)
  (:requirements :typing :strips)
  (:types city day agent)

  ;; Predicates
  (:predicates
    (day ?d - day)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)                ; traveler is at city at start of day
    (direct ?c1 - city ?c2 - city)         ; direct flight available
    (commute-used ?from - city ?to - city ?d - day) ; transport_agent recorded a commute for traceability
  )

  ;; -----------------------
  ;; Actions belonging to itinerary_agent
  ;; These actions model "staying" in a city from one day to the next.
  ;; They are intentionally separate (namespaced) from transport actions.
  ;; -----------------------
  (:action itinerary_agent-stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  ;; -----------------------
  ;; Actions belonging to transport_agent
  ;; These model direct flights. They require the direct edge and move the traveler
  ;; from a city on day d1 to the destination on the next day d2 (flight consumes the day).
  ;; -----------------------
  (:action transport_agent-fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (direct ?from ?to) (next ?d1 ?d2))
    :effect (and
              (at ?to ?d2)
              (commute-used ?from ?to ?d1)
            )
  )
)