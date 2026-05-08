(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (is_last_day ?d - day)
    (not_started)
    (trip_done)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and 
      (not (not_started))
      (at ?c d1)
    )
  )

  (:action spend_day_and_stay
    :parameters (?c - city ?d - day ?nd - day ?n_old ?n_new - count)
    :precondition (and 
      (at ?c ?d) 
      (next_day ?d ?nd) 
      (city_count ?c ?n_old) 
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (not (at ?c ?d)) 
      (at ?c ?nd) 
      (not (city_count ?c ?n_old)) 
      (city_count ?c ?n_new)
    )
  )

  (:action spend_day_and_fly
    :parameters (?c1 ?c2 - city ?d - day ?nd - day ?n1_old ?n1_new ?n2_old ?n2_new - count)
    :precondition (and 
      (at ?c1 ?d) 
      (flight ?c1 ?c2) 
      (next_day ?d ?nd) 
      (city_count ?c1 ?n1_old) 
      (next_count ?n1_old ?n1_new)
      (city_count ?c2 ?n2_old) 
      (next_count ?n2_old ?n2_new)
    )
    :effect (and 
      (not (at ?c1 ?d)) 
      (at ?c2 ?nd) 
      (not (city_count ?c1 ?n1_old)) 
      (city_count ?c1 ?n1_new)
      (not (city_count ?c2 ?n2_old)) 
      (city_count ?c2 ?n2_new)
    )
  )

  (:action finish_trip
    :parameters (?c - city ?d - day ?n_old ?n_new - count)
    :precondition (and 
      (at ?c ?d) 
      (is_last_day ?d) 
      (city_count ?c ?n_old) 
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (not (at ?c ?d)) 
      (not (city_count ?c ?n_old)) 
      (city_count ?c ?n_new)
      (trip_done)
    )
  )
)