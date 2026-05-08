```lisp
(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates 
    (at ?c - city ?d - day)
    (flown ?src - city ?dst - city ?d - day)
    (visited_relatives ?d - day)
    (available_flight ?src ?dst - city)
    (next_day ?d ?d_next - day)
  )
  
  (:action fly
    :parameters (?src ?dst - city ?d ?d_next - day)
    :precondition (and 
      (at ?src ?d)
      (next_day ?d ?d_next)
      (available_flight ?src ?dst)
      (not (flown ?src ?dst ?d))
    )
    :effect (and 
      (not (at ?src ?d))
      (at ?dst ?d_next)
      (flown ?src ?dst ?d)
    )
  )
  
  (:action visit_relatives
    :parameters (?d - day)
    :precondition (at valencia ?d)
    :effect (visited_relatives ?d)
  )
)
```