(define (domain travel-multiagent)
  (:requirements :strips :typing)
  (:types agent city day)

  (:predicates
    (at ?a - agent ?c - city ?d - day)     ; agent a is at city c on day d
    (next ?d1 - day ?d2 - day)            ; day successor relation
    (leg ?from - city ?to - city)         ; available direct flight leg from->to
  )

  ;; Stay action for the traveler: remain in the same city for the next day
  (:action stay_traveler
    :parameters (?a - agent ?c - city ?d - day ?d2 - day)
    :precondition (and (at ?a ?c ?d) (next ?d ?d2))
    :effect (and (at ?a ?c ?d2))
  )

  ;; Flight actions provided by flight_service: each consumes one day (depart on d, arrive on d2 where next d d2)
  ;; Berlin -> Warsaw
  (:action fly_flight_service_berlin_to_warsaw
    :parameters (?a - agent ?d - day ?d2 - day)
    :precondition (and (at ?a berlin ?d) (leg berlin warsaw) (next ?d ?d2))
    :effect (and (at ?a warsaw ?d2))
  )

  ;; Warsaw -> Berlin
  (:action fly_flight_service_warsaw_to_berlin
    :parameters (?a - agent ?d - day ?d2 - day)
    :precondition (and (at ?a warsaw ?d) (leg warsaw berlin) (next ?d ?d2))
    :effect (and (at ?a berlin ?d2))
  )

  ;; Warsaw -> Bucharest
  (:action fly_flight_service_warsaw_to_bucharest
    :parameters (?a - agent ?d - day ?d2 - day)
    :precondition (and (at ?a warsaw ?d) (leg warsaw bucharest) (next ?d ?d2))
    :effect (and (at ?a bucharest ?d2))
  )

  ;; Bucharest -> Warsaw
  (:action fly_flight_service_bucharest_to_warsaw
    :parameters (?a - agent ?d - day ?d2 - day)
    :precondition (and (at ?a bucharest ?d) (leg bucharest warsaw) (next ?d ?d2))
    :effect (and (at ?a warsaw ?d2))
  )
)