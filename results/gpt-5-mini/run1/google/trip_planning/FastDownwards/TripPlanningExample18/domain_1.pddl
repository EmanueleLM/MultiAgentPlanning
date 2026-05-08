(define (domain trip_planning_example18)
  (:requirements :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (assigned ?d - day ?c - city)     ; day ?d is assigned to city ?c
    (unassigned ?d - day)            ; day ?d is not yet assigned
    (flight ?from - city ?to - city) ; direct flight exists from -> to
    (next ?d1 - day ?d2 - day)       ; ?d2 is the immediate successor of ?d1
    (first_day ?d - day)             ; marks the first day of the trip
  )

  ; assign the first day to a city
  (:action assign_first
    :parameters (?d - day ?c - city)
    :precondition (and (unassigned ?d) (first_day ?d))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)))
  )

  ; stay in the same city from one day to the next
  (:action assign_next_stay
    :parameters (?dprev - day ?dnext - day ?c - city)
    :precondition (and (assigned ?dprev ?c) (next ?dprev ?dnext) (unassigned ?dnext))
    :effect (and (assigned ?dnext ?c) (not (unassigned ?dnext)))
  )

  ; take a direct flight from the city on the previous day to a (different) city on the next day
  (:action assign_next_fly
    :parameters (?dprev - day ?dnext - day ?cprev - city ?cnext - city)
    :precondition (and (assigned ?dprev ?cprev) (flight ?cprev ?cnext) (next ?dprev ?dnext) (unassigned ?dnext))
    :effect (and (assigned ?dnext ?cnext) (not (unassigned ?dnext)))
  )
)