(define (domain trip_planning_domain)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (current_loc ?c - city)
    (current_day ?d - day)
    (at_city_day ?c - city ?d - day)
    (spent_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?c1 ?c2 - count)
    (flight ?c1 ?c2 - city)
  )

  ;; The traveler stays in the same city for the entire day.
  ;; The day counts as one day spent in that city.
  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?old_cnt - count ?new_cnt - count)
    :precondition (and 
      (current_loc ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (spent_count ?c ?old_cnt)
      (next_count ?old_cnt ?new_cnt)
    )
    :effect (and 
      (not (current_day ?d))
      (current_day ?nd)
      (not (spent_count ?c ?old_cnt))
      (spent_count ?c ?new_cnt)
      (at_city_day ?c ?d)
    )
  )

  ;; The traveler takes a direct flight from one city to another.
  ;; The day of the flight counts as one day spent in the origin city
  ;; and one day spent in the destination city.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day ?cf_old - count ?cf_new - count ?ct_old - count ?ct_new - count)
    :precondition (and 
      (current_loc ?from)
      (current_day ?d)
      (next_day ?d ?nd)
      (flight ?from ?to)
      (spent_count ?from ?cf_old)
      (next_count ?cf_old ?cf_new)
      (spent_count ?to ?ct_old)
      (next_count ?ct_old ?ct_new)
    )
    :effect (and 
      (not (current_loc ?from))
      (current_loc ?to)
      (not (current_day ?d))
      (current_day ?nd)
      (not (spent_count ?from ?cf_old))
      (spent_count ?from ?cf_new)
      (not (spent_count ?to ?ct_old))
      (spent_count ?to ?ct_new)
      (at_city_day ?from ?d)
      (at_city_day ?to ?d)
    )
  )
)