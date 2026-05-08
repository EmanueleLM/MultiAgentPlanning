(define (domain trip_planning_example_31)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (visited_on_day ?c - city ?d - day)
    (total_visited_days ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (started)
  )

  ;; Choose an initial starting city to begin the 10-day trip.
  (:action start_trip
    :parameters (?c - city)
    :precondition (and (not (started)) (current_day d1))
    :effect (and (started) (at_city ?c))
  )

  ;; Mark the current city as visited on the current day.
  ;; This increments the total count of distinct days spent in that city.
  (:action mark_visited
    :parameters (?c - city ?d - day ?n_old ?n_new - count)
    :precondition (and (started)
                       (at_city ?c)
                       (current_day ?d)
                       (not (visited_on_day ?c ?d))
                       (total_visited_days ?c ?n_old)
                       (next_count ?n_old ?n_new))
    :effect (and (visited_on_day ?c ?d)
                 (total_visited_days ?c ?n_new)
                 (not (total_visited_days ?c ?n_old)))
  )

  ;; Advance to the next day while staying in the same city.
  ;; Requires that the current day has been counted as a visit for the current city.
  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and (started)
                       (at_city ?c)
                       (current_day ?d)
                       (visited_on_day ?c ?d)
                       (next_day ?d ?d_next))
    :effect (and (not (current_day ?d)) (current_day ?d_next))
  )

  ;; Travel between cities on the current day.
  ;; The travel counts as spending time in both the origin and destination city for that day.
  (:action fly
    :parameters (?c_from ?c_to - city ?d - day)
    :precondition (and (started)
                       (at_city ?c_from)
                       (current_day ?d)
                       (visited_on_day ?c_from ?d)
                       (flight ?c_from ?c_to))
    :effect (and (not (at_city ?c_from)) (at_city ?c_to))
  )
)