(define (domain trip_planning_example_6)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (city_count_at ?c - city ?n - count)
    (next_val ?n1 ?n2 - count)
    (next_day ?d1 ?d2 - day)
    (can_fly ?c1 ?c2 - city)
    (is_last_day ?d - day)
    (trip_complete)
  )

  ;; Stay in the current city while moving to the next day
  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?v_old - count ?v_new - count)
    :precondition (and 
      (at ?c ?d) 
      (next_day ?d ?nd) 
      (city_count_at ?c ?v_old) 
      (next_val ?v_old ?v_new)
    )
    :effect (and 
      (not (at ?c ?d)) 
      (at ?c ?nd) 
      (not (city_count_at ?c ?v_old)) 
      (city_count_at ?c ?v_new) 
      (visited ?c ?nd)
    )
  )

  ;; Fly from one city to another on the same day
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day ?v_old - count ?v_new - count)
    :precondition (and 
      (at ?c_from ?d) 
      (can_fly ?c_from ?c_to) 
      (not (visited ?c_to ?d)) 
      (city_count_at ?c_to ?v_old) 
      (next_val ?v_old ?v_new)
    )
    :effect (and 
      (not (at ?c_from ?d)) 
      (at ?c_to ?d) 
      (not (city_count_at ?c_to ?v_old)) 
      (city_count_at ?c_to ?v_new) 
      (visited ?c_to ?d)
    )
  )

  ;; Finalize the trip on the last day
  (:action finish
    :parameters (?c - city ?d - day)
    :precondition (and (at ?c ?d) (is_last_day ?d))
    :effect (trip_complete)
  )
)