(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day step)

  (:predicates
    (is_at ?c - city ?d - day)
    (connected ?c1 ?c2 - city)
    (next_day ?d1 ?d2 - day)
    (next_step ?s1 ?s2 - step)
    (tally ?c - city ?s - step)
    (day_counted ?c - city ?d - day)
  )

  ;; Action to record that the traveler spent time in a city on a specific day.
  ;; The overlap logic (traveling on a day counts for both cities) is handled
  ;; by allowing multiple counts on the same day if the traveler moves between cities.
  (:action count_day
    :parameters (?c - city ?d - day ?s_prev - step ?s_curr - step)
    :precondition (and 
      (is_at ?c ?d) 
      (tally ?c ?s_prev) 
      (next_step ?s_prev ?s_curr) 
      (not (day_counted ?c ?d))
    )
    :effect (and 
      (not (tally ?c ?s_prev)) 
      (tally ?c ?s_curr) 
      (day_counted ?c ?d)
    )
  )

  ;; Action to fly between two connected cities on the same day.
  (:action travel
    :parameters (?c_from - city ?c_to - city ?d - day)
    :precondition (and 
      (is_at ?c_from ?d) 
      (connected ?c_from ?c_to)
    )
    :effect (and 
      (not (is_at ?c_from ?d)) 
      (is_at ?c_to ?d)
    )
  )

  ;; Action to transition from one day to the next while staying in the same city.
  (:action overnight
    :parameters (?c - city ?d_from - day ?d_to - day)
    :precondition (and 
      (is_at ?c ?d_from) 
      (next_day ?d_from ?d_to)
    )
    :effect (and 
      (not (is_at ?c ?d_from)) 
      (is_at ?c ?d_to)
    )
  )
)