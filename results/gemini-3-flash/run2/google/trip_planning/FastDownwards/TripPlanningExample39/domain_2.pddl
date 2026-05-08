(define (domain trip_planning_example_39)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (is_porto ?c - city)
    (is_barcelona ?c - city)
    (is_florence ?c - city)
    (is_within_visit_window ?d - day)
    (relatives_visited)
    (porto_satisfied)
    (barcelona_satisfied)
    (florence_satisfied)
    (at_least_3 ?n - count)
    (at_least_4 ?n - count)
    (at_least_7 ?n - count)
  )

  ;; Action to visit relatives in Porto - does not advance the clock.
  (:action visit_relatives
    :parameters (?c - city ?d - day)
    :precondition (and 
      (at ?c) 
      (is_porto ?c) 
      (current_day ?d) 
      (is_within_visit_window ?d)
    )
    :effect (relatives_visited)
  )

  ;; Spending a day at the current city.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?n_curr ?n_next - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next)
      (stay_count ?c ?n_curr) 
      (next_count ?n_curr ?n_next)
    )
    :effect (and 
      (not (current_day ?d_curr)) 
      (current_day ?d_next)
      (not (stay_count ?c ?n_curr)) 
      (stay_count ?c ?n_next)
    )
  )

  ;; Flying between cities. The day of the flight counts toward the stay duration for both cities.
  (:action fly
    :parameters (?c_from ?c_to - city ?d_curr ?d_next - day 
                 ?n_from_curr ?n_from_next - count
                 ?n_to_curr ?n_to_next - count)
    :precondition (and 
      (at ?c_from) 
      (can_fly ?c_from ?c_to) 
      (current_day ?d_curr) 
      (next_day ?d_curr ?d_next)
      (stay_count ?c_from ?n_from_curr) 
      (next_count ?n_from_curr ?n_from_next)
      (stay_count ?c_to ?n_to_curr) 
      (next_count ?n_to_curr ?n_to_next)
    )
    :effect (and 
      (not (at ?c_from)) 
      (at ?c_to)
      (not (current_day ?d_curr)) 
      (current_day ?d_next)
      (not (stay_count ?c_from ?n_from_curr)) 
      (stay_count ?c_from ?n_from_next)
      (not (stay_count ?c_to ?n_to_curr)) 
      (stay_count ?c_to ?n_to_next)
    )
  )

  ;; Validating goal requirements for Porto.
  (:action check_porto
    :parameters (?c - city ?n - count)
    :precondition (and (is_porto ?c) (stay_count ?c ?n) (at_least_3 ?n))
    :effect (porto_satisfied)
  )

  ;; Validating goal requirements for Barcelona.
  (:action check_barcelona
    :parameters (?c - city ?n - count)
    :precondition (and (is_barcelona ?c) (stay_count ?c ?n) (at_least_7 ?n))
    :effect (barcelona_satisfied)
  )

  ;; Validating goal requirements for Florence.
  (:action check_florence
    :parameters (?c - city ?n - count)
    :precondition (and (is_florence ?c) (stay_count ?c ?n) (at_least_4 ?n))
    :effect (florence_satisfied)
  )
)