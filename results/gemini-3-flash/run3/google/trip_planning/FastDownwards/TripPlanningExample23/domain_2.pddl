(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day step)

  (:predicates
    (is_at ?c - city ?d - day)
    (day_counted ?c - city ?d - day)
    (tally ?c - city ?s - step)
    (next_step ?s1 ?s2 - step)
    (next_day ?d1 ?d2 - day)
    (connected ?c1 ?c2 - city)
  )

  ;; Records that the traveler spent time in a specific city on a specific day.
  ;; To count a day for a city, the traveler must be currently located in that city on that day.
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

  ;; Travel between two connected cities on the same day.
  ;; This allows a single day to be counted for both the origin and destination cities.
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

  ;; Progress from one day to the next while remaining in the same city.
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