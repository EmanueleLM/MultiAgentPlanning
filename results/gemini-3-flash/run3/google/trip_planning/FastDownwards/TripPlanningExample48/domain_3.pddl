(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at_city ?c - city)
    (day_is ?d - day)
    (next_day ?d1 ?d2 - day)
    (stay_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (visited_at ?c - city ?d - day)
    (can_fly ?c1 ?c2 - city)
  )

  ;; The stay action represents spending a whole day in a single city.
  ;; It increments the city's stay count and advances the day.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and 
      (at_city ?c) 
      (day_is ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (stay_count ?c ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (visited_at ?c ?d_curr) 
      (not (day_is ?d_curr)) 
      (day_is ?d_next) 
      (not (stay_count ?c ?n_curr)) 
      (stay_count ?c ?n_next)
    )
  )

  ;; The fly action represents traveling between cities.
  ;; In this model, the travel day counts as a visit to both the departure and arrival cities,
  ;; reflecting a morning/afternoon split within a single calendar day.
  ;; This allows a 4-day trip to satisfy 6 city-day requirements.
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?n_f_curr ?n_f_next ?n_t_curr ?n_t_next - count)
    :precondition (and 
      (at_city ?from) 
      (can_fly ?from ?to) 
      (day_is ?d_curr) 
      (next_day ?d_curr ?d_next)
      (stay_count ?from ?n_f_curr) 
      (next_count ?n_f_curr ?n_f_next)
      (stay_count ?to ?n_t_curr) 
      (next_count ?n_t_curr ?n_t_next)
    )
    :effect (and 
      (not (at_city ?from)) 
      (at_city ?to) 
      (not (day_is ?d_curr)) 
      (day_is ?d_next)
      (not (stay_count ?from ?n_f_curr)) 
      (stay_count ?from ?n_f_next)
      (not (stay_count ?to ?n_t_curr)) 
      (stay_count ?to ?n_t_next)
      (visited_at ?from ?d_curr) 
      (visited_at ?to ?d_curr)
    )
  )
)