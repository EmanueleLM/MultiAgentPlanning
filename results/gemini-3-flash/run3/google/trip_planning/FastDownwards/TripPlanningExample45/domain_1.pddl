(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)
  (:predicates
    (at ?c - city ?d - day)
    (count_at ?c - city ?v - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?v1 ?v2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; Action to stay in the same city for another day.
  ;; This increments the stay count for that city and moves to the next calendar day.
  (:action stay
    :parameters (?c - city ?d_pre ?d_post - day ?v_pre ?v_post - count)
    :precondition (and 
      (at ?c ?d_pre) 
      (next_day ?d_pre ?d_post) 
      (count_at ?c ?v_pre) 
      (next_count ?v_pre ?v_post)
    )
    :effect (and 
      (not (at ?c ?d_pre)) 
      (at ?c ?d_post) 
      (not (count_at ?c ?v_pre)) 
      (count_at ?c ?v_post)
    )
  )

  ;; Action to fly to a different city.
  ;; This increments the stay count for the destination city and moves to the next calendar day.
  (:action fly
    :parameters (?from ?to - city ?d_pre ?d_post - day ?v_to_pre ?v_to_post - count)
    :precondition (and 
      (at ?from ?d_pre) 
      (next_day ?d_pre ?d_post) 
      (flight ?from ?to) 
      (count_at ?to ?v_to_pre) 
      (next_count ?v_to_pre ?v_to_post)
    )
    :effect (and 
      (not (at ?from ?d_pre)) 
      (at ?to ?d_post) 
      (not (count_at ?to ?v_to_pre)) 
      (count_at ?to ?v_to_post)
    )
  )
)