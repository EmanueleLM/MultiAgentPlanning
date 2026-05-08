(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count_step
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (count ?c - city ?s - count_step)
    (visited ?c - city ?d - day)
    (conn ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_count ?s1 ?s2 - count_step)
  )

  ;; Stay in a city for the day. Advances day and increments that city's count.
  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?co - count_step ?cn - count_step)
    :precondition (and 
      (at ?c) 
      (current_day ?d) 
      (next_day ?d ?nd) 
      (count ?c ?co) 
      (next_count ?co ?cn)
    )
    :effect (and 
      (not (current_day ?d)) 
      (current_day ?nd) 
      (not (count ?c ?co)) 
      (count ?c ?cn) 
      (visited ?c ?d)
    )
  )

  ;; Travel between cities. A travel day counts as a visit to both the origin and destination city.
  ;; This allows overlapping stays to fit within the total trip duration.
  (:action travel
    :parameters (?f - city ?t - city ?d - day ?nd - day ?fco - count_step ?fcn - count_step ?tco - count_step ?tcn - count_step)
    :precondition (and 
      (at ?f) 
      (current_day ?d) 
      (next_day ?d ?nd) 
      (conn ?f ?t) 
      (count ?f ?fco) 
      (next_count ?fco ?fcn)
      (count ?t ?tco)
      (next_count ?tco ?tcn)
    )
    :effect (and 
      (not (at ?f)) 
      (at ?t) 
      (not (current_day ?d)) 
      (current_day ?nd) 
      (not (count ?f ?fco)) 
      (count ?f ?fcn)
      (not (count ?t ?tco))
      (count ?t ?tcn)
      (visited ?f ?d) 
      (visited ?t ?d)
    )
  )
)