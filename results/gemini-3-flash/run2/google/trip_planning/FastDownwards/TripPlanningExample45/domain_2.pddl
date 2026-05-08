(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day step)
  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_step ?s1 ?s2 - step)
    (count ?c - city ?s - step)
    (can_fly ?c1 ?c2 - city)
  )

  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?s_old ?s_new - step)
    :precondition (and 
        (at ?c ?d_curr) 
        (next_day ?d_curr ?d_next) 
        (count ?c ?s_old) 
        (next_step ?s_old ?s_new)
    )
    :effect (and 
        (not (at ?c ?d_curr)) 
        (at ?c ?d_next) 
        (not (count ?c ?s_old)) 
        (count ?c ?s_new)
    )
  )

  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?s_old ?s_new - step)
    :precondition (and 
        (at ?from ?d_curr) 
        (can_fly ?from ?to) 
        (next_day ?d_curr ?d_next) 
        (count ?to ?s_old) 
        (next_step ?s_old ?s_new)
    )
    :effect (and 
        (not (at ?from ?d_curr)) 
        (at ?to ?d_next) 
        (not (count ?to ?s_old)) 
        (count ?to ?s_new)
    )
  )
)