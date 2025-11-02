(define (domain trip-orchestration)
  (:requirements :strips :typing)
  (:types city day)
  (:constants copenhagen vienna lyon - city)
  (:predicates
    (at ?c - city ?d - day)                ; traveler is in city ?c on day ?d
    (direct_flight ?from - city ?to - city)
    (day_next ?d1 - day ?d2 - day)
  )

  ;; Copenhagen agent actions
  (:action stay_copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at copenhagen ?d1) (day_next ?d1 ?d2))
    :effect (and (at copenhagen ?d2))
  )

  (:action fly_copenhagen_to_vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at copenhagen ?d1) (day_next ?d1 ?d2) (direct_flight copenhagen vienna))
    :effect (and (at vienna ?d2))
  )

  ;; Vienna agent actions
  (:action stay_vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at vienna ?d1) (day_next ?d1 ?d2))
    :effect (and (at vienna ?d2))
  )

  (:action fly_vienna_to_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at vienna ?d1) (day_next ?d1 ?d2) (direct_flight vienna lyon))
    :effect (and (at lyon ?d2))
  )

  ;; Lyon agent actions
  (:action stay_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at lyon ?d1) (day_next ?d1 ?d2))
    :effect (and (at lyon ?d2))
  )

  (:action fly_lyon_to_vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at lyon ?d1) (day_next ?d1 ?d2) (direct_flight lyon vienna))
    :effect (and (at vienna ?d2))
  )
)