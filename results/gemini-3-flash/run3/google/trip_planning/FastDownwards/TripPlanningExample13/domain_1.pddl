(define (domain trip_planning_example_13)
  (:requirements :strips :typing)
  (:types
    city day count_val
  )
  (:predicates
    (at ?c - city)
    (day_at ?d - day)
    (count ?c - city ?cv - count_val)
    (visited ?c - city ?d - day)
    (flight ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?cv1 - count_val ?cv2 - count_val)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day ?cv_old - count_val ?cv_new - count_val)
    :precondition (and 
      (at ?c)
      (day_at ?d)
      (next_day ?d ?dn)
      (count ?c ?cv_old)
      (next_count ?cv_old ?cv_new)
    )
    :effect (and 
      (not (day_at ?d))
      (day_at ?dn)
      (not (count ?c ?cv_old))
      (count ?c ?cv_new)
      (visited ?c ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day ?cf_old - count_val ?cf_new - count_val ?ct_old - count_val ?ct_new - count_val)
    :precondition (and 
      (at ?from)
      (flight ?from ?to)
      (day_at ?d)
      (next_day ?d ?dn)
      (count ?from ?cf_old)
      (next_count ?cf_old ?cf_new)
      (count ?to ?ct_old)
      (next_count ?ct_old ?ct_new)
    )
    :effect (and 
      (not (at ?from))
      (at ?to)
      (not (day_at ?d))
      (day_at ?dn)
      (not (count ?from ?cf_old))
      (count ?from ?cf_new)
      (not (count ?to ?ct_old))
      (count ?to ?ct_new)
      (visited ?from ?d)
      (visited ?to ?d)
    )
  )
)