(define (domain european_trip)
  (:requirements :strips :typing :negative-preconditions)
  
  (:types city day)
  
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited ?c - city)
    (planning_day ?d - day)
    (met_friend_tallinn)
  )
  
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (direct_flight ?from ?to)
      (at ?from ?d1)
      (next ?d1 ?d2)
      (not (visited ?to))
    )
    :effect (and
      (at ?to ?d2)
      (visited ?to)
    )
  )
  
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
    )
    :effect (at ?c ?d2)
  )
  
  (:action meet_friend_tallinn
    :parameters (?d - day)
    :precondition (and
      (at tallinn ?d)
      (or (next day_10 ?d) (next day_11 ?d))
    )
    :effect (met_friend_tallinn)
  )
)