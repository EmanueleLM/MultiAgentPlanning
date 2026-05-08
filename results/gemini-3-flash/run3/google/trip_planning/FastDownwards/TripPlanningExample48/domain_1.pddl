(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (visited_at ?c - city ?d - day)
    (visited_count ?c - city ?n - count)
    (on_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (started)
  )

  ;; Action to establish the starting city on the first day of the trip.
  (:action start
    :parameters (?c - city ?n0 ?n1 - count ?d1 ?d2 - day)
    :precondition (and 
      (not (started)) 
      (on_day ?d1) 
      (visited_count ?c ?n0) 
      (next_count ?n0 ?n1) 
      (next_day ?d1 ?d2)
    )
    :effect (and 
      (started) 
      (at ?c) 
      (visited_at ?c ?d1) 
      (visited_count ?c ?n1) 
      (on_day ?d2) 
      (not (on_day ?d1)) 
      (not (visited_count ?c ?n0))
    )
  )

  ;; Action to stay in the current city for another day.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?c_curr ?c_next - count)
    :precondition (and 
      (started) 
      (at ?c) 
      (on_day ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (visited_count ?c ?c_curr) 
      (next_count ?c_curr ?c_next)
    )
    :effect (and 
      (on_day ?d_next) 
      (visited_at ?c ?d_next) 
      (visited_count ?c ?c_next) 
      (not (on_day ?d_curr)) 
      (not (visited_count ?c ?c_curr))
    )
  )

  ;; Action to fly from one city to another, occupying the next day in the new city.
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?c_curr ?c_next - count)
    :precondition (and 
      (started) 
      (at ?from) 
      (can_fly ?from ?to) 
      (on_day ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (visited_count ?to ?c_curr) 
      (next_count ?c_curr ?c_next)
    )
    :effect (and 
      (not (at ?from)) 
      (at ?to) 
      (on_day ?d_next) 
      (visited_at ?to ?d_next) 
      (visited_count ?to ?c_next) 
      (not (on_day ?d_curr)) 
      (not (visited_count ?to ?c_curr))
    )
  )
)