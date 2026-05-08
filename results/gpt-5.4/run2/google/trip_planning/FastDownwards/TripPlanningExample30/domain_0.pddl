(define (domain europe_trip_14days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    ist_counter
    tal_counter
    zur_counter
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (show_day ?d - day)

    (remaining_istanbul ?n - ist_counter)
    (next_istanbul ?n1 - ist_counter ?n2 - ist_counter)

    (remaining_tallinn ?n - tal_counter)
    (next_tallinn ?n1 - tal_counter ?n2 - tal_counter)

    (remaining_zurich ?n - zur_counter)
    (next_zurich ?n1 - zur_counter ?n2 - zur_counter)
  )

  (:action end_day_stay_in_istanbul
    :parameters (?d - day ?d_next - day ?b - ist_counter ?a - ist_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at istanbul)
      (remaining_istanbul ?b)
      (next_istanbul ?b ?a)
      (not (show_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (remaining_istanbul ?b))
      (remaining_istanbul ?a)
    )
  )

  (:action end_day_stay_in_tallinn
    :parameters (?d - day ?d_next - day ?b - tal_counter ?a - tal_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at tallinn)
      (remaining_tallinn ?b)
      (next_tallinn ?b ?a)
      (not (show_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (remaining_tallinn ?b))
      (remaining_tallinn ?a)
    )
  )

  (:action end_day_stay_in_zurich
    :parameters (?d - day ?d_next - day ?b - zur_counter ?a - zur_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (remaining_zurich ?b)
      (next_zurich ?b ?a)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (remaining_zurich ?b))
      (remaining_zurich ?a)
    )
  )

  (:action end_day_fly_istanbul_to_tallinn
    :parameters (?d - day ?d_next - day ?b - ist_counter ?a - ist_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at istanbul)
      (direct_flight istanbul tallinn)
      (remaining_istanbul ?b)
      (next_istanbul ?b ?a)
      (not (show_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at istanbul))
      (at tallinn)
      (not (remaining_istanbul ?b))
      (remaining_istanbul ?a)
    )
  )

  (:action end_day_fly_istanbul_to_zurich
    :parameters (?d - day ?d_next - day ?b - ist_counter ?a - ist_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at istanbul)
      (direct_flight istanbul zurich)
      (remaining_istanbul ?b)
      (next_istanbul ?b ?a)
      (not (show_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at istanbul))
      (at zurich)
      (not (remaining_istanbul ?b))
      (remaining_istanbul ?a)
    )
  )

  (:action end_day_fly_tallinn_to_istanbul
    :parameters (?d - day ?d_next - day ?b - tal_counter ?a - tal_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at tallinn)
      (direct_flight tallinn istanbul)
      (remaining_tallinn ?b)
      (next_tallinn ?b ?a)
      (not (show_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at tallinn))
      (at istanbul)
      (not (remaining_tallinn ?b))
      (remaining_tallinn ?a)
    )
  )

  (:action end_day_fly_tallinn_to_zurich
    :parameters (?d - day ?d_next - day ?b - tal_counter ?a - tal_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at tallinn)
      (direct_flight tallinn zurich)
      (remaining_tallinn ?b)
      (next_tallinn ?b ?a)
      (not (show_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at tallinn))
      (at zurich)
      (not (remaining_tallinn ?b))
      (remaining_tallinn ?a)
    )
  )

  (:action end_day_fly_zurich_to_istanbul
    :parameters (?d - day ?d_next - day ?b - zur_counter ?a - zur_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich istanbul)
      (remaining_zurich ?b)
      (next_zurich ?b ?a)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at istanbul)
      (not (remaining_zurich ?b))
      (remaining_zurich ?a)
    )
  )

  (:action end_day_fly_zurich_to_tallinn
    :parameters (?d - day ?d_next - day ?b - zur_counter ?a - zur_counter)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at zurich)
      (direct_flight zurich tallinn)
      (remaining_zurich ?b)
      (next_zurich ?b ?a)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at zurich))
      (at tallinn)
      (not (remaining_zurich ?b))
      (remaining_zurich ?a)
    )
  )
)