(define (domain trip_planning_example46)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (in_city_on ?d - day ?c - city)

    (need_seville_5)
    (need_seville_4)
    (need_seville_3)
    (need_seville_2)
    (need_seville_1)
    (need_seville_0)

    (need_manchester_5)
    (need_manchester_4)
    (need_manchester_3)
    (need_manchester_2)
    (need_manchester_1)
    (need_manchester_0)

    (need_stockholm_3)
    (need_stockholm_2)
    (need_stockholm_1)
    (need_stockholm_0)

    (finished)
  )

  (:action stay
    :parameters (?d - day ?dn - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at ?c)
      (not (in_city_on ?d ?c))
    )
    :effect (and
      (in_city_on ?d ?c)
      (not (current_day ?d))
      (current_day ?dn)
    )
  )

  (:action fly
    :parameters (?d - day ?dn - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dn)
      (at ?from)
      (direct ?from ?to)
      (not (in_city_on ?d ?from))
    )
    :effect (and
      (in_city_on ?d ?from)
      (not (current_day ?d))
      (current_day ?dn)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_last
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (not (in_city_on ?d ?c))
    )
    :effect (and
      (in_city_on ?d ?c)
      (not (current_day ?d))
      (finished)
    )
  )

  (:action consume_seville_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_seville_5)
      (in_city_on ?d seville)
    )
    :effect (and
      (not (need_seville_5))
      (need_seville_4)
    )
  )

  (:action consume_seville_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_seville_4)
      (in_city_on ?d seville)
    )
    :effect (and
      (not (need_seville_4))
      (need_seville_3)
    )
  )

  (:action consume_seville_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_seville_3)
      (in_city_on ?d seville)
    )
    :effect (and
      (not (need_seville_3))
      (need_seville_2)
    )
  )

  (:action consume_seville_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_seville_2)
      (in_city_on ?d seville)
    )
    :effect (and
      (not (need_seville_2))
      (need_seville_1)
    )
  )

  (:action consume_seville_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_seville_1)
      (in_city_on ?d seville)
    )
    :effect (and
      (not (need_seville_1))
      (need_seville_0)
    )
  )

  (:action consume_manchester_5
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_manchester_5)
      (in_city_on ?d manchester)
    )
    :effect (and
      (not (need_manchester_5))
      (need_manchester_4)
    )
  )

  (:action consume_manchester_4
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_manchester_4)
      (in_city_on ?d manchester)
    )
    :effect (and
      (not (need_manchester_4))
      (need_manchester_3)
    )
  )

  (:action consume_manchester_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_manchester_3)
      (in_city_on ?d manchester)
    )
    :effect (and
      (not (need_manchester_3))
      (need_manchester_2)
    )
  )

  (:action consume_manchester_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_manchester_2)
      (in_city_on ?d manchester)
    )
    :effect (and
      (not (need_manchester_2))
      (need_manchester_1)
    )
  )

  (:action consume_manchester_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_manchester_1)
      (in_city_on ?d manchester)
    )
    :effect (and
      (not (need_manchester_1))
      (need_manchester_0)
    )
  )

  (:action consume_stockholm_3
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_stockholm_3)
      (in_city_on ?d stockholm)
    )
    :effect (and
      (not (need_stockholm_3))
      (need_stockholm_2)
    )
  )

  (:action consume_stockholm_2
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_stockholm_2)
      (in_city_on ?d stockholm)
    )
    :effect (and
      (not (need_stockholm_2))
      (need_stockholm_1)
    )
  )

  (:action consume_stockholm_1
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (need_stockholm_1)
      (in_city_on ?d stockholm)
    )
    :effect (and
      (not (need_stockholm_1))
      (need_stockholm_0)
    )
  )
)