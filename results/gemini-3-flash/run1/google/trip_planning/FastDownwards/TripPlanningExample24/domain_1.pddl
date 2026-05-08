(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day step)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (stay_count ?c - city ?s - step)
    (next_step ?s1 ?s2 - step)
    (can_fly ?c1 ?c2 - city)
    (visited_at ?c - city ?d - day)
  )

  ;; Action to stay in a city for a day, incrementing the stay count for that city and the current day.
  (:action stay_at_city
    :parameters (?c - city ?d_curr ?d_next - day ?s_curr ?s_next - step)
    :precondition (and 
      (at_city ?c) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (stay_count ?c ?s_curr) 
      (next_step ?s_curr ?s_next)
    )
    :effect (and 
      (not (current_day ?d_curr)) 
      (current_day ?d_next) 
      (not (stay_count ?c ?s_curr)) 
      (stay_count ?c ?s_next) 
      (visited_at ?c ?d_curr)
    )
  )

  ;; Action to travel between cities, counting the day as a stay for both the origin and destination cities.
  (:action travel_between_cities
    :parameters (?from ?to - city ?d_curr ?d_next - day ?s_from_curr ?s_from_next - step ?s_to_curr ?s_to_next - step)
    :precondition (and 
      (at_city ?from) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (can_fly ?from ?to) 
      (stay_count ?from ?s_from_curr) 
      (next_step ?s_from_curr ?s_from_next) 
      (stay_count ?to ?s_to_curr) 
      (next_step ?s_to_curr ?s_to_next)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (not (current_day ?d_curr)) 
      (current_day ?d_next) 
      (not (stay_count ?from ?s_from_curr)) 
      (stay_count ?from ?s_from_next) 
      (not (stay_count ?to ?s_to_curr)) 
      (stay_count ?to ?s_to_next) 
      (visited_at ?from ?d_curr) 
      (visited_at ?to ?d_curr)
    )
  )
)