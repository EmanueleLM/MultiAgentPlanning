(define (domain trip_planning_example_43)
  (:requirements :strips :typing)
  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (flight ?c1 ?c2 - city)
    (visited ?c - city ?d - day)
    (visit_count ?c - city ?n - count)
    (successor ?n1 ?n2 - count)
    (at_least_4 ?n - count)
    (satisfied ?c - city)
  )

  ;; Spending the entire day in the current city
  (:action stay
    :parameters (?c - city ?today - day ?tomorrow - day ?old_cnt - count ?new_cnt - count)
    :precondition (and
      (at ?c)
      (current_day ?today)
      (next_day ?today ?tomorrow)
      (visit_count ?c ?old_cnt)
      (successor ?old_cnt ?new_cnt)
    )
    :effect (and
      (not (current_day ?today))
      (current_day ?tomorrow)
      (visited ?c ?today)
      (not (visit_count ?c ?old_cnt))
      (visit_count ?c ?new_cnt)
    )
  )

  ;; Flying from one city to another, counting as visiting both on the day of travel
  (:action fly
    :parameters (?from - city ?to - city ?today - day ?tomorrow - day ?old_cnt_from - count ?new_cnt_from - count ?old_cnt_to - count ?new_cnt_to - count)
    :precondition (and
      (at ?from)
      (current_day ?today)
      (next_day ?today ?tomorrow)
      (flight ?from ?to)
      (visit_count ?from ?old_cnt_from)
      (successor ?old_cnt_from ?new_cnt_from)
      (visit_count ?to ?old_cnt_to)
      (successor ?old_cnt_to ?new_cnt_to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?today))
      (current_day ?tomorrow)
      (visited ?from ?today)
      (visited ?to ?today)
      (not (visit_count ?from ?old_cnt_from))
      (visit_count ?from ?new_cnt_from)
      (not (visit_count ?to ?old_cnt_to))
      (visit_count ?to ?new_cnt_to)
    )
  )

  ;; Checking if the minimum stay requirement of 4 days is met for a city
  (:action complete_city_stay
    :parameters (?c - city ?cnt - count)
    :precondition (and
      (visit_count ?c ?cnt)
      (at_least_4 ?cnt)
    )
    :effect (satisfied ?c)
  )
)