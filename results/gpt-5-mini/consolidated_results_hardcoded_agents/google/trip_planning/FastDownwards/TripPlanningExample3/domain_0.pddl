(define (domain travel-multi-agent)
  (:requirements :typing)
  (:types person city day)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
  )

  ;; Traveler staying in same city from one day to the next
  (:action traveler-stay
    :parameters (?p - person ?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?p ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?p ?c ?d2))
  )

  ;; Direct flight actions provided by flight_service (only the listed connections).
  ;; Berlin -> Warsaw
  (:action flight_service-fly-berlin-to-warsaw
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and (at ?p Berlin ?d1) (next ?d1 ?d2))
    :effect (and (at ?p Warsaw ?d2))
  )

  ;; Warsaw -> Berlin
  (:action flight_service-fly-warsaw-to-berlin
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and (at ?p Warsaw ?d1) (next ?d1 ?d2))
    :effect (and (at ?p Berlin ?d2))
  )

  ;; Warsaw -> Bucharest
  (:action flight_service-fly-warsaw-to-bucharest
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and (at ?p Warsaw ?d1) (next ?d1 ?d2))
    :effect (and (at ?p Bucharest ?d2))
  )

  ;; Bucharest -> Warsaw
  (:action flight_service-fly-bucharest-to-warsaw
    :parameters (?p - person ?d1 - day ?d2 - day)
    :precondition (and (at ?p Bucharest ?d1) (next ?d1 ?d2))
    :effect (and (at ?p Warsaw ?d2))
  )
)