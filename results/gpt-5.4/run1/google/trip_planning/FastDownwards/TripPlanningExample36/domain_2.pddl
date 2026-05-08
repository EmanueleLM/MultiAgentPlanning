(define (domain tripplanningexample36)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?c1 - count ?c2 - count)

    (current_day ?d - day)
    (at ?c - city)
    (visited ?c - city)

    (florence_days ?n - count)
    (munich_days ?n - count)
    (warsaw_days ?n - count)

    (day_used ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (day_used day1))
      (at ?c)
    )
    :effect (and
      (day_used day1)
      (visited ?c)
    )
  )

  (:action stay_in_florence
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (florence_days ?n1)
      (next_count ?n1 ?n2)
      (not (day_used ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (day_used ?d2)
      (not (florence_days ?n1))
      (florence_days ?n2)
      (visited florence)
    )
  )

  (:action stay_in_munich
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at munich)
      (munich_days ?n1)
      (next_count ?n1 ?n2)
      (not (day_used ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (day_used ?d2)
      (not (munich_days ?n1))
      (munich_days ?n2)
      (visited munich)
    )
  )

  (:action stay_in_warsaw
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at warsaw)
      (warsaw_days ?n1)
      (next_count ?n1 ?n2)
      (not (day_used ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (day_used ?d2)
      (not (warsaw_days ?n1))
      (warsaw_days ?n2)
      (visited warsaw)
    )
  )

  (:action fly_to_florence
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (= ?from florence))
      (direct_flight ?from florence)
      (florence_days ?n1)
      (next_count ?n1 ?n2)
      (not (day_used ?d2))
    )
    :effect (and
      (not (at ?from))
      (at florence)
      (not (current_day ?d1))
      (current_day ?d2)
      (day_used ?d2)
      (not (florence_days ?n1))
      (florence_days ?n2)
      (visited florence)
    )
  )

  (:action fly_to_munich
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (= ?from munich))
      (direct_flight ?from munich)
      (munich_days ?n1)
      (next_count ?n1 ?n2)
      (not (day_used ?d2))
    )
    :effect (and
      (not (at ?from))
      (at munich)
      (not (current_day ?d1))
      (current_day ?d2)
      (day_used ?d2)
      (not (munich_days ?n1))
      (munich_days ?n2)
      (visited munich)
    )
  )

  (:action fly_to_warsaw
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (= ?from warsaw))
      (direct_flight ?from warsaw)
      (warsaw_days ?n1)
      (next_count ?n1 ?n2)
      (not (day_used ?d2))
    )
    :effect (and
      (not (at ?from))
      (at warsaw)
      (not (current_day ?d1))
      (current_day ?d2)
      (day_used ?d2)
      (not (warsaw_days ?n1))
      (warsaw_days ?n2)
      (visited warsaw)
    )
  )
)