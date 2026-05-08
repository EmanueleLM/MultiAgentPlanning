(define (domain tripplanningexample36)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    stay_count
  )

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (used_day ?d - day)

    (florence_stays ?n - stay_count)
    (munich_stays ?n - stay_count)
    (warsaw_stays ?n - stay_count)

    (visited ?c - city)
  )

  (:action start_in_florence
    :parameters ()
    :precondition (and
      (current_day day1)
      (at florence)
      (not (used_day day1))
      (florence_stays s0)
    )
    :effect (and
      (used_day day1)
      (visited florence)
      (not (florence_stays s0))
      (florence_stays s1)
    )
  )

  (:action stay_florence
    :parameters (?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (florence_stays ?n1)
      (next_stay ?n1 ?n2)
      (not (used_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (used_day ?d2)
      (not (florence_stays ?n1))
      (florence_stays ?n2)
      (visited florence)
    )
  )

  (:action stay_munich
    :parameters (?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at munich)
      (munich_stays ?n1)
      (next_stay ?n1 ?n2)
      (not (used_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (used_day ?d2)
      (not (munich_stays ?n1))
      (munich_stays ?n2)
      (visited munich)
    )
  )

  (:action stay_warsaw
    :parameters (?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at warsaw)
      (warsaw_stays ?n1)
      (next_stay ?n1 ?n2)
      (not (used_day ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (used_day ?d2)
      (not (warsaw_stays ?n1))
      (warsaw_stays ?n2)
      (visited warsaw)
    )
  )

  (:action fly_to_munich
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at munich))
      (flight ?from munich)
      (munich_stays ?n1)
      (next_stay ?n1 ?n2)
      (not (used_day ?d2))
    )
    :effect (and
      (not (at ?from))
      (at munich)
      (not (current_day ?d1))
      (current_day ?d2)
      (used_day ?d2)
      (not (munich_stays ?n1))
      (munich_stays ?n2)
      (visited munich)
    )
  )

  (:action fly_to_warsaw
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at warsaw))
      (flight ?from warsaw)
      (warsaw_stays ?n1)
      (next_stay ?n1 ?n2)
      (not (used_day ?d2))
    )
    :effect (and
      (not (at ?from))
      (at warsaw)
      (not (current_day ?d1))
      (current_day ?d2)
      (used_day ?d2)
      (not (warsaw_stays ?n1))
      (warsaw_stays ?n2)
      (visited warsaw)
    )
  )
)