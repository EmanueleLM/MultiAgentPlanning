(define (domain europe_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates 
    (at ?city - city ?day - day)
    (can_fly ?from - city ?to - city)
    (workshop_day ?d - day)
    (next ?d1 - day ?d2 - day)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n - day)
    :precondition (and (at ?from ?d) (can_fly ?from ?to) (next ?d ?n))
    :effect (and (not (at ?from ?d)) (at ?to ?n))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and (at stuttgart ?d) (workshop_day ?d))
    :effect (none) ; Ensures being in Stuttgart during a workshop day
  )
)