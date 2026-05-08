(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (visit_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (visited ?c - city ?d - day)
    (started)
    (not_started)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and 
      (not (not_started))
      (started)
      (at ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and 
      (started)
      (at ?from)
      (can_fly ?from ?to)
    )
    :effect (and 
      (not (at ?from))
      (at ?to)
    )
  )

  (:action spend_day
    :parameters (?city - city ?d_now - day ?d_next - day ?c_now - count ?c_next - count)
    :precondition (and 
      (started)
      (at ?city)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (visit_count ?city ?c_now)
      (next_count ?c_now ?c_next)
    )
    :effect (and 
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (visit_count ?city ?c_now))
      (visit_count ?city ?c_next)
      (visited ?city ?d_now)
    )
  )
)