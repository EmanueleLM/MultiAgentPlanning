(define (domain trip-orchestration-17)
  (:requirements :typing :negative-preconditions)
  (:types city day)
  (:constants copenhagen vienna lyon - city)

  (:predicates
    (at ?c - city ?d - day)                 ; traveler is in city ?c on day ?d
    (visited ?d - day)                     ; day ?d has been assigned (traveler is somewhere that day)
    (day_next ?d1 - day ?d2 - day)         ; day order relation
    (direct_flight ?from - city ?to - city) ; a direct flight exists
  )

  ;; Stay actions (advance one day, remain in same city)
  (:action stay_copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at copenhagen ?d1)
      (day_next ?d1 ?d2)
      (not (visited ?d2))
    )
    :effect (and
      (at copenhagen ?d2)
      (visited ?d2)
    )
  )

  (:action stay_vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (day_next ?d1 ?d2)
      (not (visited ?d2))
    )
    :effect (and
      (at vienna ?d2)
      (visited ?d2)
    )
  )

  (:action stay_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at lyon ?d1)
      (day_next ?d1 ?d2)
      (not (visited ?d2))
    )
    :effect (and
      (at lyon ?d2)
      (visited ?d2)
    )
  )

  ;; Flight actions (advance one day, must be a direct flight)
  (:action fly_copenhagen_to_vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at copenhagen ?d1)
      (day_next ?d1 ?d2)
      (not (visited ?d2))
      (direct_flight copenhagen vienna)
    )
    :effect (and
      (at vienna ?d2)
      (visited ?d2)
    )
  )

  (:action fly_vienna_to_copenhagen
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (day_next ?d1 ?d2)
      (not (visited ?d2))
      (direct_flight vienna copenhagen)
    )
    :effect (and
      (at copenhagen ?d2)
      (visited ?d2)
    )
  )

  (:action fly_vienna_to_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at vienna ?d1)
      (day_next ?d1 ?d2)
      (not (visited ?d2))
      (direct_flight vienna lyon)
    )
    :effect (and
      (at lyon ?d2)
      (visited ?d2)
    )
  )

  (:action fly_lyon_to_vienna
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at lyon ?d1)
      (day_next ?d1 ?d2)
      (not (visited ?d2))
      (direct_flight lyon vienna)
    )
    :effect (and
      (at vienna ?d2)
      (visited ?d2)
    )
  )
)