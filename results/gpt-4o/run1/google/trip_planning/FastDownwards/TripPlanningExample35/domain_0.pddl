(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (in_city ?c - city)
    (has_visited ?c - city)
    (day_number ?d - day ?n - number)
    (current_day ?d - day)
    (next_day ?d - day ?nd - day)
  )

  (:action Fly_Bucharest_to_Zurich
    :precondition (and (in_city bucharest) (not (has_visited bucharest)))
    :effect (and (in_city zurich) (not (in_city bucharest)) (has_visited bucharest))
  )

  (:action Fly_Zurich_to_Dubrovnik
    :precondition (and (in_city zurich) (not (has_visited zurich)))
    :effect (and (in_city dubrovnik) (not (in_city zurich)) (has_visited zurich))
  )

  (:action Fly_Zurich_to_Bucharest
    :precondition (and (in_city zurich) (not (has_visited zurich)))
    :effect (and (in_city bucharest) (not (in_city zurich)))
  )

  (:action Fly_Dubrovnik_to_Zurich
    :precondition (and (in_city dubrovnik) (not (has_visited dubrovnik)))
    :effect (and (in_city zurich) (not (in_city dubrovnik)))
  )

  (:action Spend_Day
    :parameters (?d - day ?nd - day)
    :precondition (and (current_day ?d) (next_day ?d ?nd))
    :effect (and (not (current_day ?d)) (current_day ?nd))
  )
)