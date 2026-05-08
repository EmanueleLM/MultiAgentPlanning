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

  ;; Action to spend the entire day in the current city.
  ;; The count for that city is incremented by one.
  (:action stay
    :parameters (?c - city ?d - day ?d_next - day ?n - count ?n_next - count)
    :precondition (and
      (current_day ?d)
      (at_city ?c)
      (can_visit ?c ?d)
      (city_count ?c ?n)
      (next_day ?d ?d_next)
      (next_count ?n ?n_next)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (city_count ?c ?n))
      (city_count ?c ?n_next)
    )
  )

  ;; Action to fly from one city to another.
  ;; The day of the flight counts toward the stay duration of both cities.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day ?d_next - day ?n_from - count ?n_from_next - count ?n_to - count ?n_to_next - count)
    :precondition (and
      (current_day ?d)
      (at_city ?c_from)
      (can_visit ?c_from ?d)
      (flight ?c_from ?c_to)
      (next_day ?d ?d_next)
      (city_count ?c_from ?n_from)
      (next_count ?n_from ?n_from_next)
      (city_count ?c_to ?n_to)
      (next_count ?n_to ?n_to_next)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at_city ?c_from))
      (at_city ?c_to)
      (not (city_count ?c_from ?n_from))
      (city_count ?c_from ?n_from_next)
      (not (city_count ?c_to ?n_to))
      (city_count ?c_to ?n_to_next)
    )
  )
)