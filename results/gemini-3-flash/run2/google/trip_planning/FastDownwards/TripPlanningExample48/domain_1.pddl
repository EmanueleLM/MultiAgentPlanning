(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (can_fly ?c1 ?c2 - city)
  )

  ;; A 'stay' action represents spending the whole day in one city.
  ;; The day d_now is spent in city ?c, and the person is still in ?c at the start of d_next.
  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next)
    )
    :effect (and 
      (not (current_day ?d_now)) 
      (current_day ?d_next) 
      (visited ?c ?d_now)
    )
  )

  ;; A 'fly' action represents a transition between cities on a specific day.
  ;; Because travel takes time, the person is considered to have spent time in 
  ;; both the origin and destination cities during that day.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_now - day ?d_next - day)
    :precondition (and 
      (at_city ?c_from) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next) 
      (can_fly ?c_from ?c_to)
    )
    :effect (and 
      (not (at_city ?c_from)) 
      (at_city ?c_to) 
      (not (current_day ?d_now)) 
      (current_day ?d_next) 
      (visited ?c_from ?d_now) 
      (visited ?c_to ?d_now)
    )
  )
)