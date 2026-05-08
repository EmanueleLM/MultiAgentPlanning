(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (spent_day_in ?d - day ?c - city)

    (counted_for_venice ?d - day)
    (counted_for_florence ?d - day)
    (counted_for_zurich ?d - day)

    (venice_day_1)
    (venice_day_2)
    (venice_day_3)
    (venice_day_4)
    (venice_day_5)
    (venice_day_6)

    (florence_day_1)
    (florence_day_2)
    (florence_day_3)
    (florence_day_4)
    (florence_day_5)
    (florence_day_6)

    (zurich_day_1)
    (zurich_day_2)
  )

  (:action spend_day_stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (spent_day_in ?d1 ?c))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_day_in ?d1 ?c)
    )
  )

  (:action spend_day_fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
      (not (spent_day_in ?d1 ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (spent_day_in ?d1 ?to)
    )
  )

  (:action credit_venice_1
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d venice)
      (not (counted_for_venice ?d))
      (not (venice_day_1))
    )
    :effect (and
      (counted_for_venice ?d)
      (venice_day_1)
    )
  )

  (:action credit_venice_2
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d venice)
      (not (counted_for_venice ?d))
      (venice_day_1)
      (not (venice_day_2))
    )
    :effect (and
      (counted_for_venice ?d)
      (venice_day_2)
    )
  )

  (:action credit_venice_3
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d venice)
      (not (counted_for_venice ?d))
      (venice_day_2)
      (not (venice_day_3))
    )
    :effect (and
      (counted_for_venice ?d)
      (venice_day_3)
    )
  )

  (:action credit_venice_4
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d venice)
      (not (counted_for_venice ?d))
      (venice_day_3)
      (not (venice_day_4))
    )
    :effect (and
      (counted_for_venice ?d)
      (venice_day_4)
    )
  )

  (:action credit_venice_5
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d venice)
      (not (counted_for_venice ?d))
      (venice_day_4)
      (not (venice_day_5))
    )
    :effect (and
      (counted_for_venice ?d)
      (venice_day_5)
    )
  )

  (:action credit_venice_6
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d venice)
      (not (counted_for_venice ?d))
      (venice_day_5)
      (not (venice_day_6))
    )
    :effect (and
      (counted_for_venice ?d)
      (venice_day_6)
    )
  )

  (:action credit_florence_1
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d florence)
      (not (counted_for_florence ?d))
      (not (florence_day_1))
    )
    :effect (and
      (counted_for_florence ?d)
      (florence_day_1)
    )
  )

  (:action credit_florence_2
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d florence)
      (not (counted_for_florence ?d))
      (florence_day_1)
      (not (florence_day_2))
    )
    :effect (and
      (counted_for_florence ?d)
      (florence_day_2)
    )
  )

  (:action credit_florence_3
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d florence)
      (not (counted_for_florence ?d))
      (florence_day_2)
      (not (florence_day_3))
    )
    :effect (and
      (counted_for_florence ?d)
      (florence_day_3)
    )
  )

  (:action credit_florence_4
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d florence)
      (not (counted_for_florence ?d))
      (florence_day_3)
      (not (florence_day_4))
    )
    :effect (and
      (counted_for_florence ?d)
      (florence_day_4)
    )
  )

  (:action credit_florence_5
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d florence)
      (not (counted_for_florence ?d))
      (florence_day_4)
      (not (florence_day_5))
    )
    :effect (and
      (counted_for_florence ?d)
      (florence_day_5)
    )
  )

  (:action credit_florence_6
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d florence)
      (not (counted_for_florence ?d))
      (florence_day_5)
      (not (florence_day_6))
    )
    :effect (and
      (counted_for_florence ?d)
      (florence_day_6)
    )
  )

  (:action credit_zurich_1
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d zurich)
      (not (counted_for_zurich ?d))
      (not (zurich_day_1))
    )
    :effect (and
      (counted_for_zurich ?d)
      (zurich_day_1)
    )
  )

  (:action credit_zurich_2
    :parameters (?d - day)
    :precondition (and
      (spent_day_in ?d zurich)
      (not (counted_for_zurich ?d))
      (zurich_day_1)
      (not (zurich_day_2))
    )
    :effect (and
      (counted_for_zurich ?d)
      (zurich_day_2)
    )
  )
)