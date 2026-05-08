(define (domain trip_planning_example_46)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; Action to stay in the current city and move to the next day.
  ;; This represents spending the new day in the current city.
  (:action stay
    :parameters (?c - city ?d_from ?d_to - day ?n_from ?n_to - count)
    :precondition (and 
      (at ?c) 
      (current_day ?d_from) 
      (next_day ?d_from ?d_to)
      (stay_count ?c ?n_from) 
      (next_count ?n_from ?n_to)
    )
    :effect (and 
      (not (current_day ?d_from)) 
      (current_day ?d_to)
      (visited ?c ?d_to)
      (not (stay_count ?c ?n_from)) 
      (stay_count ?c ?n_to)
    )
  )

  ;; Action to fly to a new city on the current day.
  ;; This allows visiting multiple cities on the same day, essential for fulfilling
  ;; overlapping stay requirements within the total trip duration.
  (:action fly
    :parameters (?c_from ?c_to - city ?d - day ?n_from ?n_to - count)
    :precondition (and 
      (at ?c_from) 
      (current_day ?d) 
      (flight ?c_from ?c_to)
      (not (visited ?c_to ?d))
      (stay_count ?c_to ?n_from) 
      (next_count ?n_from ?n_to)
    )
    :effect (and 
      (not (at ?c_from)) 
      (at ?c_to)
      (visited ?c_to ?d)
      (not (stay_count ?c_to ?n_from)) 
      (stay_count ?c_to ?n_to)
    )
  )
)