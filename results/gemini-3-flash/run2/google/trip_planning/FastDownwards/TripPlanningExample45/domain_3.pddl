(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day step)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (count ?c - city ?s - step)
    (next_step ?s1 ?s2 - step)
    (at_city_day ?c - city ?d - day)
    (can_fly ?c1 ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d1 ?d2 - day ?s1 ?s2 - step)
    :precondition (and 
        (at ?c) 
        (current_day ?d1) 
        (next_day ?d1 ?d2) 
        (count ?c ?s1) 
        (next_step ?s1 ?s2)
    )
    :effect (and 
        (not (current_day ?d1)) 
        (current_day ?d2) 
        (not (count ?c ?s1)) 
        (count ?c ?s2) 
        (at_city_day ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from ?to - city ?d - day ?s1 ?s2 - step)
    :precondition (and 
        (at ?from) 
        (current_day ?d) 
        (can_fly ?from ?to) 
        (count ?to ?s1) 
        (next_step ?s1 ?s2)
    )
    :effect (and 
        (not (at ?from)) 
        (at ?to) 
        (not (count ?to ?s1)) 
        (count ?to ?s2) 
        (at_city_day ?to ?d)
    )
  )
)