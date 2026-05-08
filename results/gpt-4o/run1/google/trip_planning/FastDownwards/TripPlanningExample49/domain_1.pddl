(define (domain european_trip)
  (:requirements :strips :typing)
  (:types city day)
  (:predicates 
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
  )

  (:action fly_milan_reykjavik
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at milan ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at milan ?d1)) (at reykjavik ?d2))
  )

  (:action fly_reykjavik_milan
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at reykjavik ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at reykjavik ?d1)) (at milan ?d2))
  )

  (:action fly_milan_split
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at milan ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at milan ?d1)) (at split ?d2))
  )

  (:action fly_split_milan
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at split ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at split ?d1)) (at milan ?d2))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next_day ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2))
  )
)