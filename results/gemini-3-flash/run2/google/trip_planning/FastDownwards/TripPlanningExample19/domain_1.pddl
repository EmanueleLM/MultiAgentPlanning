(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (next ?d1 ?d2 - day)
    (connected ?c1 ?c2 - city)
  )

  ;; Stay in the current city on the current day to record a visit.
  (:action stay
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c) (current_day ?d))
    :effect (visited ?c ?d)
  )

  ;; Fly from one city to another on the current day. 
  ;; This records a visit to both cities on that day (overlap) 
  ;; and updates the traveler's current location.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from) (current_day ?d) (connected ?from ?to))
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (visited ?from ?d) 
      (visited ?to ?d)
    )
  )

  ;; Move the timeline to the next day.
  (:action advance_day
    :parameters (?d_now - day ?d_next - day)
    :precondition (and (current_day ?d_now) (next ?d_now ?d_next))
    :effect (and 
      (not (current_day ?d_now)) 
      (current_day ?d_next)
    )
  )
)