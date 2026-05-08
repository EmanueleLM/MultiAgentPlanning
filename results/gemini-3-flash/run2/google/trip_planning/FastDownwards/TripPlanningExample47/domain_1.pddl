(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day step)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (has_flight ?c1 ?c2 - city)
    (stayed_at ?c - city ?d - day)
    (count ?c - city ?s - step)
    (next_step ?s1 ?s2 - step)
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?s_from - step ?s_to - step)
    :precondition (and 
      (at ?c) 
      (current_day ?d_from) 
      (next_day ?d_from ?d_to) 
      (count ?c ?s_from) 
      (next_step ?s_from ?s_to)
    )
    :effect (and 
      (not (current_day ?d_from)) 
      (current_day ?d_to) 
      (not (count ?c ?s_from)) 
      (count ?c ?s_to) 
      (stayed_at ?c ?d_from)
    )
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_from - day ?d_to - day ?s_from - step ?s_to - step)
    :precondition (and 
      (at ?c_from) 
      (current_day ?d_from) 
      (next_day ?d_from ?d_to) 
      (has_flight ?c_from ?c_to) 
      (count ?c_from ?s_from) 
      (next_step ?s_from ?s_to)
    )
    :effect (and 
      (not (at ?c_from)) 
      (at ?c_to) 
      (not (current_day ?d_from)) 
      (current_day ?d_to) 
      (not (count ?c_from ?s_from)) 
      (count ?c_from ?s_to) 
      (stayed_at ?c_from ?d_from)
    )
  )
)