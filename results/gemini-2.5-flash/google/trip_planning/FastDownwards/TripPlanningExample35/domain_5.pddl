(define (domain trip-planning-example35)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types
    city
    day
    bucharest_count
    zurich_count
    dubrovnik_count
  )

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (has_flight ?from - city ?to - city)
    (current_bucharest_count ?bc - bucharest_count)
    (next_bucharest_count ?bc1 - bucharest_count ?bc2 - bucharest_count)
    (current_zurich_count ?zc - zurich_count)
    (next_zurich_count ?zc1 - zurich_count ?zc2 - zurich_count)
    (current_dubrovnik_count ?dc - dubrovnik_count)
    (next_dubrovnik_count ?dc1 - dubrovnik_count ?dc2 - dubrovnik_count)
    (visited_relatives_in_dubrovnik)
    (day_is_4_to_10 ?d - day)
  )

  (:action travel
    :parameters (?from - city ?to - city ?d_curr - day ?d_next - day)
    :precondition (and
      (current_day ?d_curr)
      (at_city ?from)
      (has_flight ?from ?to)
      (next_day ?d_curr ?d_next)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
    )
  )

  (:action stay_in_bucharest
    :parameters (?d_curr - day ?d_next - day ?bc_curr - bucharest_count ?bc_next - bucharest_count)
    :precondition (and
      (at_city bucharest)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (current_bucharest_count ?bc_curr)
      (next_bucharest_count ?bc_curr ?bc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (current_bucharest_count ?bc_curr))
      (current_bucharest_count ?bc_next)
    )
  )

  (:action stay_in_zurich
    :parameters (?d_curr - day ?d_next - day ?zc_curr - zurich_count ?zc_next - zurich_count)
    :precondition (and
      (at_city zurich)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (current_zurich_count ?zc_curr)
      (next_zurich_count ?zc_curr ?zc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (current_zurich_count ?zc_curr))
      (current_zurich_count ?zc_next)
    )
  )

  (:action stay_in_dubrovnik
    :parameters (?d_curr - day ?d_next - day ?dc_curr - dubrovnik_count ?dc_next - dubrovnik_count)
    :precondition (and
      (at_city dubrovnik)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (current_dubrovnik_count ?dc_curr)
      (next_dubrovnik_count ?dc_curr ?dc_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (current_dubrovnik_count ?dc_curr))
      (current_dubrovnik_count ?dc_next)
    )
  )

  (:action visit_relatives
    :parameters (?d_curr - day)
    :precondition (and
      (at_city dubrovnik)
      (current_day ?d_curr)
      (not (visited_relatives_in_dubrovnik))
      (day_is_4_to_10 ?d_curr)
    )
    :effect (and
      (visited_relatives_in_dubrovnik)
    )
  )
)