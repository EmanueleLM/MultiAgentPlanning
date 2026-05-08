(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (in_city ?c - city)
    (has_visited ?c - city)
    (current_day ?d - day)
    (next_day ?d - day ?nd - day)
    (at_relatives ?d - day ?c - city)
  )

  (:action Fly_Bucharest_to_Zurich
    :precondition (and (in_city bucharest))
    :effect (and (in_city zurich) (not (in_city bucharest)) (has_visited bucharest))
  )

  (:action Fly_Zurich_to_Dubrovnik
    :precondition (and (in_city zurich))
    :effect (and (in_city dubrovnik) (not (in_city zurich)) (has_visited zurich))
  )

  (:action Fly_Zurich_to_Bucharest
    :precondition (and (in_city zurich))
    :effect (and (in_city bucharest) (not (in_city zurich)))
  )

  (:action Fly_Dubrovnik_to_Zurich
    :precondition (and (in_city dubrovnik))
    :effect (and (in_city zurich) (not (in_city dubrovnik)) (has_visited dubrovnik))
  )

  (:action Spend_Day
    :parameters (?d - day ?nd - day)
    :precondition (and (current_day ?d) (next_day ?d ?nd))
    :effect (and (not (current_day ?d)) (current_day ?nd))
  )
)