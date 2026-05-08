(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (is_last_day ?d - day)
    (visited_count ?c - city ?n - count)
    (next_val ?n1 ?n2 - count)
    (can_fly ?c1 ?c2 - city)
    (trip_done)
  )

  ;; Action to stay in the current city for one day.
  ;; Increases the stay count for that city and moves to the next day.
  (:action stay
    :parameters (?c - city ?d_curr ?d_next - day ?c_curr ?c_next - count)
    :precondition (and
      (at ?c)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (visited_count ?c ?c_curr)
      (next_val ?c_curr ?c_next)
    )
    :effect (and
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (visited_count ?c ?c_curr))
      (visited_count ?c ?c_next)
    )
  )

  ;; Action to fly from one city to another.
  ;; In our model, a flight day counts for both the departure and arrival cities.
  ;; Increases stay counts for both cities and moves to the next day.
  (:action fly
    :parameters (?from ?to - city ?d_curr ?d_next - day ?c_from_curr ?c_from_next ?c_to_curr ?c_to_next - count)
    :precondition (and
      (at ?from)
      (can_fly ?from ?to)
      (current_day ?d_curr)
      (next_day ?d_curr ?d_next)
      (visited_count ?from ?c_from_curr)
      (next_val ?c_from_curr ?c_from_next)
      (visited_count ?to ?c_to_curr)
      (next_val ?c_to_curr ?c_to_next)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d_curr))
      (current_day ?d_next)
      (not (visited_count ?from ?c_from_curr))
      (visited_count ?from ?c_from_next)
      (not (visited_count ?to ?c_to_curr))
      (visited_count ?to ?c_to_next)
    )
  )

  ;; Final action to count the last day and complete the trip.
  (:action complete
    :parameters (?c - city ?d - day ?c_curr ?c_next - count)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (is_last_day ?d)
      (visited_count ?c ?c_curr)
      (next_val ?c_curr ?c_next)
    )
    :effect (and
      (not (visited_count ?c ?c_curr))
      (visited_count ?c ?c_next)
      (trip_done)
    )
  )
)