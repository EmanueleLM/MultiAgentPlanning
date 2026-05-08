(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day step_count)
  (:predicates
    (at ?c - city ?d - day)
    (has_count ?c - city ?n - step_count)
    (visited_at ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_step_count ?n1 ?n2 - step_count)
    (can_fly ?c1 ?c2 - city)
    (is_last_day ?d - day)
    (trip_done)
  )

  ;; Action to stay in the current city, advancing the day and incrementing the city's visit count.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?n_curr - step_count ?n_next - step_count)
    :precondition (and 
      (at ?c ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (has_count ?c ?n_curr) 
      (next_step_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (at ?c ?d_curr)) 
      (at ?c ?d_next) 
      (not (has_count ?c ?n_curr)) 
      (has_count ?c ?n_next) 
      (visited_at ?c ?d_curr)
    )
  )

  ;; Action to fly from one city to another, advancing the day and incrementing both cities' visit counts.
  ;; This models travel days that are partially spent in both the departure and arrival cities.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_curr - day ?d_next - day ?nf_curr - step_count ?nf_next - step_count ?nt_curr - step_count ?nt_next - step_count)
    :precondition (and 
      (at ?c_from ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (can_fly ?c_from ?c_to)
      (has_count ?c_from ?nf_curr) 
      (next_step_count ?nf_curr ?nf_next)
      (has_count ?c_to ?nt_curr) 
      (next_step_count ?nt_curr ?nt_next)
    )
    :effect (and 
      (not (at ?c_from ?d_curr)) 
      (at ?c_to ?d_next)
      (not (has_count ?c_from ?nf_curr)) 
      (has_count ?c_from ?nf_next)
      (not (has_count ?c_to ?nt_curr)) 
      (has_count ?c_to ?nt_next)
      (visited_at ?c_from ?d_curr) 
      (visited_at ?c_to ?d_curr)
    )
  )

  ;; Action to finalize the trip on the 15th day, recording the final visit and count increment.
  (:action finish
    :parameters (?c - city ?d - day ?n_curr - step_count ?n_next - step_count)
    :precondition (and 
      (at ?c ?d) 
      (is_last_day ?d)
      (has_count ?c ?n_curr) 
      (next_step_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (at ?c ?d)) 
      (not (has_count ?c ?n_curr)) 
      (has_count ?c ?n_next) 
      (visited_at ?c ?d) 
      (trip_done)
    )
  )
)