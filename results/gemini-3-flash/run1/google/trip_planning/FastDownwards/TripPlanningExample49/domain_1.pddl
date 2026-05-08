(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day step)
  (:predicates
    (at ?c - city ?d - day)
    (count ?c - city ?s - step)
    (connected ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_step ?s1 - step ?s2 - step)
    (is_split_window ?d - day)
    (visited_relatives ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?s_from - step ?s_to - step)
    :precondition (and 
      (at ?c ?d_from) 
      (next_day ?d_from ?d_to) 
      (count ?c ?s_from) 
      (next_step ?s_from ?s_to)
    )
    :effect (and 
      (not (at ?c ?d_from)) 
      (at ?c ?d_to) 
      (not (count ?c ?s_from)) 
      (count ?c ?s_to)
    )
  )

  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day ?s_from - step ?s_to - step)
    :precondition (and 
      (at ?c_from ?d) 
      (connected ?c_from ?c_to) 
      (count ?c_to ?s_from) 
      (next_step ?s_from ?s_to)
    )
    :effect (and 
      (not (at ?c_from ?d)) 
      (at ?c_to ?d) 
      (not (count ?c_to ?s_from)) 
      (count ?c_to ?s_to)
    )
  )

  (:action meet_relatives
    :parameters (?d - day)
    :precondition (and 
      (at split ?d) 
      (is_split_window ?d)
    )
    :effect (visited_relatives ?d)
  )
)