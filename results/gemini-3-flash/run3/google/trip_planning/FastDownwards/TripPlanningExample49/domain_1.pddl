(define (domain trip_planning_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (is_at ?c - city)
    (is_current_day ?d - day)
    (is_next_day ?d1 ?d2 - day)
    (has_day_count ?c - city ?n - count)
    (is_next_count ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (must_be_in_split ?d - day)
    (not_must_be_in_split ?d - day)
  )

  ;; Move between cities. This does not advance time.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (is_at ?from) (can_fly ?from ?to))
    :effect (and (not (is_at ?from)) (is_at ?to))
  )

  ;; Spend a day in Split when it is required.
  (:action spend_day_split_req
    :parameters (?d - day ?dn - day ?n - count ?nn - count)
    :precondition (and 
      (is_at split) 
      (is_current_day ?d) 
      (must_be_in_split ?d)
      (is_next_day ?d ?dn)
      (has_day_count split ?n)
      (is_next_count ?n ?nn)
    )
    :effect (and 
      (not (is_current_day ?d)) 
      (is_current_day ?dn)
      (not (has_day_count split ?n))
      (has_day_count split ?nn)
    )
  )

  ;; Spend a day in any city when there is no specific Split requirement.
  (:action spend_day_no_req
    :parameters (?c - city ?d - day ?dn - day ?n - count ?nn - count)
    :precondition (and 
      (is_at ?c) 
      (is_current_day ?d) 
      (not_must_be_in_split ?d)
      (is_next_day ?d ?dn)
      (has_day_count ?c ?n)
      (is_next_count ?n ?nn)
    )
    :effect (and 
      (not (is_current_day ?d)) 
      (is_current_day ?dn)
      (not (has_day_count ?c ?n))
      (has_day_count ?c ?nn)
    )
  )
)