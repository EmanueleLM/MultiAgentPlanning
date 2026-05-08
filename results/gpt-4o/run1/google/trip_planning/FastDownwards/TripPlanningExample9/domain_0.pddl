(define (domain europe_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates 
    (at ?city - city ?day - day)
    (can_fly ?from - city ?to - city)
    (workshop_attended ?day - day)
    (next ?d1 - day ?d2 - day)
    (day_order ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n - day)
    :precondition (and (at ?from ?d) (can_fly ?from ?to) (next ?d ?n))
    :effect (and (not (at ?from ?d)) (at ?to ?n))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and (at stuttgart ?d) (workshop_window ?d))
    :effect (workshop_attended ?d)
  )

  (:action validate_stay
    :parameters (?c - city ?d1 - day ?d2 - day ?d3 - day)
    :precondition (and 
      (at ?c ?d1) (at ?c ?d2) (at ?c ?d3)
      (day_order ?d1) (day_order ?d2) (day_order ?d3))
    :effect (and)
  )
)