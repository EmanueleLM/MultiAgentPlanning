(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day stage
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (progress ?c - city ?s - stage)
    (next_stage ?s1 ?s2 - stage)
    (visited ?c - city ?d - day)
    (has_flight ?c1 ?c2 - city)
  )

  ;; Stay in the same city for one day.
  ;; This action increments the calendar day and the visit-duration progress for the city.
  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day ?s_now - stage ?s_next - stage)
    :precondition (and 
      (at ?c) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next) 
      (progress ?c ?s_now) 
      (next_stage ?s_now ?s_next)
    )
    :effect (and 
      (not (current_day ?d_now)) 
      (current_day ?d_next) 
      (not (progress ?c ?s_now)) 
      (progress ?c ?s_next) 
      (visited ?c ?d_now)
    )
  )

  ;; Take a direct flight from one city to another.
  ;; This action increments the calendar day and the visit-duration progress for BOTH the origin and destination.
  ;; This overlap allows fitting the 19 days of visits (7+7+5) into a 17-day calendar duration.
  (:action fly
    :parameters (?from - city ?to - city ?d_now - day ?d_next - day ?s_from_now - stage ?s_from_next - stage ?s_to_now - stage ?s_to_next - stage)
    :precondition (and 
      (at ?from) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next) 
      (has_flight ?from ?to) 
      (progress ?from ?s_from_now) 
      (next_stage ?s_from_now ?s_from_next)
      (progress ?to ?s_to_now) 
      (next_stage ?s_to_now ?s_to_next)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (not (current_day ?d_now)) 
      (current_day ?d_next) 
      (not (progress ?from ?s_from_now)) 
      (progress ?from ?s_from_next)
      (not (progress ?to ?s_to_now)) 
      (progress ?to ?s_to_next)
      (visited ?from ?d_now) 
      (visited ?to ?d_now)
    )
  )
)