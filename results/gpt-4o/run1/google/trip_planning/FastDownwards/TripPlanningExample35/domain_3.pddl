(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (in_city ?c - city)
    (current_day ?d - day)
    (next_day ?d - day ?nd - day)
    (has_visited ?c - city)
    (at_relatives)
  )
  
  (:action fly_bucharest_to_zurich
    :precondition (and (in_city bucharest))
    :effect (and (not (in_city bucharest)) (in_city zurich) (has_visited bucharest))
  )

  (:action fly_zurich_to_dubrovnik
    :precondition (and (in_city zurich))
    :effect (and (not (in_city zurich)) (in_city dubrovnik) (has_visited zurich))
  )

  (:action fly_dubrovnik_to_zurich
    :precondition (and (in_city dubrovnik))
    :effect (and (not (in_city dubrovnik)) (in_city zurich) (has_visited dubrovnik))
  )

  (:action fly_zurich_to_bucharest
    :precondition (and (in_city zurich))
    :effect (and (not (in_city zurich)) (in_city bucharest))
  )

  (:action spend_day
    :parameters (?d - day ?nd - day)
    :precondition (and (current_day ?d) (next_day ?d ?nd))
    :effect (and (not (current_day ?d)) (current_day ?nd))
  )
)