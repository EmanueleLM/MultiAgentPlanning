(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day step)
    (:predicates
      (at ?c - city)
      (current_day ?d - day)
      (count ?c - city ?s - step)
      (spent ?c - city ?d - day)
      (next_day ?d1 ?d2 - day)
      (next_step ?s1 ?s2 - step)
      (can_fly ?c1 ?c2 - city)
    )

    (:action spend_time
      :parameters (?c - city ?d - day ?s1 - step ?s2 - step)
      :precondition (and 
        (at ?c) 
        (current_day ?d) 
        (count ?c ?s1) 
        (next_step ?s1 ?s2) 
        (not (spent ?c ?d))
      )
      :effect (and 
        (count ?c ?s2) 
        (not (count ?c ?s1)) 
        (spent ?c ?d)
      )
    )

    (:action fly
      :parameters (?from - city ?to - city ?d - day)
      :precondition (and 
        (at ?from) 
        (current_day ?d) 
        (can_fly ?from ?to)
      )
      :effect (and 
        (at ?to) 
        (not (at ?from))
      )
    )

    (:action advance_day
      :parameters (?d1 - day ?d2 - day)
      :precondition (and 
        (current_day ?d1) 
        (next_day ?d1 ?d2)
      )
      :effect (and 
        (current_day ?d2) 
        (not (current_day ?d1))
      )
    )
  )