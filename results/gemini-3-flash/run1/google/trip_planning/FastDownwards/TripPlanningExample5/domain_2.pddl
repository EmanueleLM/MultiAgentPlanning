(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count_num
  )
  (:predicates
    (at ?c - city ?d - day)
    (has_count ?c - city ?n - count_num)
    (flight ?c1 - city ?c2 - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count_num ?n2 - count_num)
    (conf_d12_attended)
    (conf_d16_attended)
    (is_dubrovnik ?c - city)
    (is_d12 ?d - day)
    (is_d16 ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d_from - day ?d_to - day ?c_from - count_num ?c_to - count_num)
    :precondition (and
      (at ?c ?d_from)
      (next_day ?d_from ?d_to)
      (has_count ?c ?c_from)
      (next_count ?c_from ?c_to)
    )
    :effect (and
      (not (at ?c ?d_from))
      (at ?c ?d_to)
      (not (has_count ?c ?c_from))
      (has_count ?c ?c_to)
    )
  )

  (:action travel
    :parameters (?from - city ?to - city ?d_from - day ?d_to - day ?cf_from - count_num ?cf_to - count_num ?ct_from - count_num ?ct_to - count_num)
    :precondition (and
      (at ?from ?d_from)
      (flight ?from ?to)
      (next_day ?d_from ?d_to)
      (has_count ?from ?cf_from)
      (next_count ?cf_from ?cf_to)
      (has_count ?to ?ct_from)
      (next_count ?ct_from ?ct_to)
    )
    :effect (and
      (not (at ?from ?d_from))
      (at ?to ?d_to)
      (not (has_count ?from ?cf_from))
      (has_count ?from ?cf_to)
      (not (has_count ?to ?ct_from))
      (has_count ?to ?ct_to)
    )
  )

  (:action attend_conference_d12
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c ?d)
      (is_dubrovnik ?c)
      (is_d12 ?d)
    )
    :effect (conf_d12_attended)
  )

  (:action attend_conference_d16
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c ?d)
      (is_dubrovnik ?c)
      (is_d16 ?d)
    )
    :effect (conf_d16_attended)
  )
)