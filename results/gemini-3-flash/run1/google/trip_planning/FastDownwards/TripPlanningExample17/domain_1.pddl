(define (domain trip_planning_example_17)
  (:requirements :strips :typing)
  (:types
    city
    day
    count
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (can_visit ?c - city ?d - day)
  )

  ;; Action to spend a day in a city and remain there for the next day
  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day ?n_now - count ?n_next - count)
    :precondition (and
      (current_day ?d_now)
      (at_city ?c)
      (can_visit ?c ?d_now)
      (city_count ?c ?n_now)
      (next_day ?d_now ?d_next)
      (next_count ?n_now ?n_next)
    )
    :effect (and
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (city_count ?c ?n_now))
      (city_count ?c ?n_next)
    )
  )

  ;; Action to spend a day in a city and fly to a different city for the next day
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_now - day ?d_next - day ?n_now - count ?n_next - count)
    :precondition (and
      (current_day ?d_now)
      (at_city ?c_from)
      (can_visit ?c_from ?d_now)
      (flight ?c_from ?c_to)
      (city_count ?c_from ?n_now)
      (next_day ?d_now ?d_next)
      (next_count ?n_now ?n_next)
    )
    :effect (and
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (at_city ?c_from))
      (at_city ?c_to)
      (not (city_count ?c_from ?n_now))
      (city_count ?c_from ?n_next)
    )
  )
)