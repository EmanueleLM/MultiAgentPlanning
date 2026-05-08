(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next ?d1 ?d2 - day)
    (connected ?c1 ?c2 - city)
    (visited ?c - city ?d - day)
    (not_started)
  )

  ;; Start the trip by selecting an initial city on the first day.
  (:action arrive_at_first_city
    :parameters (?c - city ?d1 - day)
    :precondition (and (not_started) (current_day ?d1))
    :effect (and (not (not_started)) (at_city ?c))
  )

  ;; Stay in the current city for one day.
  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day)
    :precondition (and (at_city ?c) (current_day ?d_now) (next ?d_now ?d_next))
    :effect (and 
      (visited ?c ?d_now) 
      (not (current_day ?d_now)) 
      (current_day ?d_next)
    )
  )

  ;; Fly from one city to another. The travel day counts as a visit for both locations.
  (:action fly
    :parameters (?from - city ?to - city ?d_now - day ?d_next - day)
    :precondition (and 
      (at_city ?from) 
      (connected ?from ?to) 
      (current_day ?d_now) 
      (next ?d_now ?d_next)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (visited ?from ?d_now) 
      (visited ?to ?d_now) 
      (not (current_day ?d_now)) 
      (current_day ?d_next)
    )
  )
)