(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (flight ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (not_started)
  )

  ;; Initialize the trip by picking an initial city on Day 1.
  (:action pick_start
    :parameters (?c - city)
    :precondition (and (not_started))
    :effect (and
      (not (not_started))
      (at_city ?c)
    )
  )

  ;; Move between cities using a direct flight. 
  ;; Commuting is assumed to be instantaneous between the stays.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and 
      (at_city ?from) 
      (flight ?from ?to)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
    )
  )

  ;; Spend one day in the current city. 
  ;; This action increments the trip's clock and the specific city's stay count.
  (:action spend_day
    :parameters (?c - city ?d_now - day ?d_next - day ?c_now - count ?c_next - count)
    :precondition (and
      (at_city ?c)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (stay_count ?c ?c_now)
      (next_count ?c_now ?c_next)
    )
    :effect (and
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (stay_count ?c ?c_now))
      (stay_count ?c ?c_next)
    )
  )
)