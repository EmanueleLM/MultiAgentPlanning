(define (domain trip_planner)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count_step)
  
  (:predicates
    (at_city ?c - city)
    (day_at ?d - day)
    (city_count ?c - city ?n - count_step)
    (visited_day ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count_step)
    (flight ?c1 ?c2 - city)
  )

  ;; The wait action advances the clock and increments the count for the current city.
  (:action wait
    :parameters (?c - city ?d - day ?next_d - day ?n - count_step ?next_n - count_step)
    :precondition (and 
      (at_city ?c) 
      (day_at ?d) 
      (next_day ?d ?next_d) 
      (city_count ?c ?n) 
      (next_count ?n ?next_n)
    )
    :effect (and 
      (not (day_at ?d)) 
      (day_at ?next_d) 
      (not (city_count ?c ?n)) 
      (city_count ?c ?next_n) 
      (visited_day ?c ?next_d)
    )
  )

  ;; The fly action changes location and increments the count for the destination city for that day.
  ;; We must not have already visited the destination city on the same day.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?n - count_step ?next_n - count_step)
    :precondition (and 
      (at_city ?from) 
      (day_at ?d) 
      (flight ?from ?to) 
      (city_count ?to ?n) 
      (next_count ?n ?next_n) 
      (not (visited_day ?to ?d))
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (not (city_count ?to ?n)) 
      (city_count ?to ?next_n) 
      (visited_day ?to ?d)
    )
  )
)