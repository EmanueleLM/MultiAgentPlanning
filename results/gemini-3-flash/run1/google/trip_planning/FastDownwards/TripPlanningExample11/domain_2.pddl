(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (count ?c - city ?n - count)
    (visited_at ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (trip_done)
  )

  ;; Action to stay in the current city, advancing the day and incrementing the city's visit count.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?n_curr - count ?n_next - count)
    :precondition (and 
      (at ?c ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (count ?c ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (at ?c ?d_curr)) 
      (at ?c ?d_next) 
      (not (count ?c ?n_curr)) 
      (count ?c ?n_next) 
      (visited_at ?c ?d_curr)
    )
  )

  ;; Action to fly from one city to another, advancing the day and incrementing both cities' visit counts for that day.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_curr - day ?d_next - day ?nf_curr - count ?nf_next - count ?nt_curr - count ?nt_next - count)
    :precondition (and 
      (at ?c_from ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (can_fly ?c_from ?c_to)
      (count ?c_from ?nf_curr) 
      (next_count ?nf_curr ?nf_next)
      (count ?c_to ?nt_curr) 
      (next_count ?nt_curr ?nt_next)
    )
    :effect (and 
      (not (at ?c_from ?d_curr)) 
      (at ?c_to ?d_next)
      (not (count ?c_from ?nf_curr)) 
      (count ?c_from ?nf_next)
      (not (count ?c_to ?nt_curr)) 
      (count ?c_to ?nt_next)
      (visited_at ?c_from ?d_curr) 
      (visited_at ?c_to ?d_curr)
    )
  )

  ;; Action to finalize the trip on the 15th day, recording the final visit and count increment.
  (:action finish
    :parameters (?c - city ?n_curr - count ?n_next - count)
    :precondition (and 
      (at ?c d15) 
      (count ?c ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (at ?c d15)) 
      (not (count ?c ?n_curr)) 
      (count ?c ?n_next) 
      (visited_at ?c d15) 
      (trip_done)
    )
  )
)