(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day value
  )

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (city_visited_day ?c - city ?d - day)
    (count ?c - city ?v - value)
    (next_val ?v1 - value ?v2 - value)
    (next_day ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
  )

  (:action visit
    :parameters (?c - city ?d - day ?v_old - value ?v_new - value)
    :precondition (and 
      (current_day ?d)
      (at_city ?c)
      (not (city_visited_day ?c ?d))
      (count ?c ?v_old)
      (next_val ?v_old ?v_new)
    )
    :effect (and 
      (city_visited_day ?c ?d)
      (not (count ?c ?v_old))
      (count ?c ?v_new)
    )
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day)
    :precondition (and 
      (current_day ?d)
      (at_city ?c_from)
      (flight ?c_from ?c_to)
    )
    :effect (and 
      (not (at_city ?c_from))
      (at_city ?c_to)
    )
  )

  (:action advance_day
    :parameters (?d_old - day ?d_new - day)
    :precondition (and 
      (current_day ?d_old)
      (next_day ?d_old ?d_new)
    )
    :effect (and 
      (not (current_day ?d_old))
      (current_day ?d_new)
    )
  )
)