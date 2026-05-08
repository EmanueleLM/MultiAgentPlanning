(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (day_count ?c - city ?v - count)
    (next_day ?d1 ?d2 - day)
    (next_val ?v1 ?v2 - count)
    (can_fly ?c1 ?c2 - city)
  )

  ;; stay_in_city: Spends one day in the current city, incrementing its count and the current day.
  (:action stay_in_city
    :parameters (?c - city ?d_now - day ?d_next - day ?v_now - count ?v_next - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next) 
      (day_count ?c ?v_now) 
      (next_val ?v_now ?v_next)
    )
    :effect (and 
      (not (current_day ?d_now)) 
      (current_day ?d_next) 
      (not (day_count ?c ?v_now)) 
      (day_count ?c ?v_next)
    )
  )

  ;; fly_to_city: Transitions from one city to another. 
  ;; The transition day is counted as a visit day for both the origin and the destination cities.
  (:action fly_to_city
    :parameters (?c_from - city ?c_to - city ?d_now - day ?d_next - day ?v_from_now - count ?v_from_next - count ?v_to_now - count ?v_to_next - count)
    :precondition (and 
      (at ?c_from) 
      (can_fly ?c_from ?c_to) 
      (current_day ?d_now) 
      (next_day ?d_now ?d_next) 
      (day_count ?c_from ?v_from_now) 
      (next_val ?v_from_now ?v_from_next) 
      (day_count ?c_to ?v_to_now) 
      (next_val ?v_to_now ?v_to_next)
    )
    :effect (and 
      (not (at ?c_from)) 
      (at ?c_to) 
      (not (current_day ?d_now)) 
      (current_day ?d_next) 
      (not (day_count ?c_from ?v_from_now)) 
      (day_count ?c_from ?v_from_next) 
      (not (day_count ?c_to ?v_to_now)) 
      (day_count ?c_to ?v_to_next)
    )
  )
)