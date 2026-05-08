(define (domain trip_planning)
  (:requirements :strips :typing :existential-preconditions :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (at_city_day ?c - city ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (connected ?c1 ?c2 - city)
    (at_least_5 ?n - count)
    (at_least_7 ?n - count)
    (at_start)
  )

  ;; Action to begin the trip on Day 1 by arriving at the first city.
  (:action arrive
    :parameters (?c - city ?d1 ?d2 - day ?n0 ?n1 - count)
    :precondition (and 
      (at_start) 
      (next_day ?d1 ?d2) 
      (city_count ?c ?n0) 
      (next_count ?n0 ?n1)
      (forall (?other - count) (not (at_least_5 ?other))) ;; Dummy constraint to ensure n0 is actually 0 if needed, but not strictly required
    )
    :effect (and 
      (not (at_start)) 
      (at ?c ?d2) 
      (not (city_count ?c ?n0)) 
      (city_count ?c ?n1) 
      (at_city_day ?c ?d1)
    )
  )

  ;; Action to stay in the current city for a full day.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and 
      (at ?c ?d_curr) 
      (next_day ?d_curr ?d_next) 
      (city_count ?c ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (city_count ?c ?n_curr)) 
      (city_count ?c ?n_next) 
      (at ?c ?d_next) 
      (at_city_day ?c ?d_curr)
    )
  )

  ;; Action to fly from one city to another, counting as a visit to both cities on the travel day.
  (:action fly
    :parameters (?c_from ?c_to - city ?d_curr ?d_next - day ?nf_curr ?nf_next ?nt_curr ?nt_next - count)
    :precondition (and 
      (at ?c_from ?d_curr) 
      (connected ?c_from ?c_to) 
      (next_day ?d_curr ?d_next)
      (city_count ?c_from ?nf_curr) 
      (next_count ?nf_curr ?nf_next)
      (city_count ?c_to ?nt_curr) 
      (next_count ?nt_curr ?nt_next)
    )
    :effect (and 
      (not (at ?c_from ?d_curr)) 
      (at ?c_to ?d_next)
      (not (city_count ?c_from ?nf_curr)) 
      (city_count ?c_from ?nf_next)
      (not (city_count ?c_to ?nt_curr)) 
      (city_count ?c_to ?nt_next)
      (at_city_day ?c_from ?d_curr) 
      (at_city_day ?c_to ?d_curr)
    )
  )
)