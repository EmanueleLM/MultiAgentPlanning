(define (domain trip_planning)
  (:requirements :typing)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (free ?d - day)
    (first ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?from - city ?to - city)
  )

  (:action start
    :parameters (?c - city ?d - day)
    :precondition (and (free ?d) (first ?d))
    :effect (and (not (free ?d)) (at ?c ?d))
  )

  (:action move
    :parameters (?prev - city ?cur - city ?dprev - day ?dcur - day)
    :precondition (and (at ?prev ?dprev) (free ?dcur) (next ?dprev ?dcur) (flight ?prev ?cur))
    :effect (and (not (free ?dcur)) (at ?cur ?dcur))
  )
)