(define (domain travel_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city day count
  )

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 ?d2 - day)
    (city_count ?c - city ?v - count)
    (next_count ?v1 ?v2 - count)
    (direct_flight ?c1 ?c2 - city)
    (is_meeting_window ?d - day)
    (met_friend)
    (trip_started)
    (trip_concluded)
  )

  ;; Start the trip at a chosen city on day 1.
  (:action start_trip
    :parameters (?c - city)
    :precondition (not (trip_started))
    :effect (and
      (trip_started)
      (at ?c d01)
    )
  )

  ;; Spend the current day in the same city and move to the next day.
  (:action stay
    :parameters (?c - city ?d_curr - day ?d_next - day ?count_curr - count ?count_next - count)
    :precondition (and
      (trip_started)
      (at ?c ?d_curr)
      (next_day ?d_curr ?d_next)
      (city_count ?c ?count_curr)
      (next_count ?count_curr ?count_next)
    )
    :effect (and
      (not (at ?c ?d_curr))
      (at ?c ?d_next)
      (not (city_count ?c ?count_curr))
      (city_count ?c ?count_next)
    )
  )

  ;; Fly between cities. A flight day counts toward the stay duration of both the origin and destination cities.
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d_curr - day ?d_next - day ?cf_curr - count ?cf_next - count ?ct_curr - count ?ct_next - count)
    :precondition (and
      (trip_started)
      (at ?c_from ?d_curr)
      (next_day ?d_curr ?d_next)
      (direct_flight ?c_from ?c_to)
      (city_count ?c_from ?cf_curr)
      (next_count ?cf_curr ?cf_next)
      (city_count ?c_to ?ct_curr)
      (next_count ?ct_curr ?ct_next)
    )
    :effect (and
      (not (at ?c_from ?d_curr))
      (at ?c_to ?d_next)
      (not (city_count ?c_from ?cf_curr))
      (city_count ?c_from ?cf_next)
      (not (city_count ?c_to ?ct_curr))
      (city_count ?c_to ?ct_next)
    )
  )

  ;; Meet a friend in Florence if the agent is present during the window.
  (:action meet_friend
    :parameters (?d - day)
    :precondition (and
      (trip_started)
      (at florence ?d)
      (is_meeting_window ?d)
    )
    :effect (met_friend)
  )

  ;; Conclude the trip on day 14 to count the final day of stay.
  (:action conclude_trip
    :parameters (?c - city ?curr_count - count ?next_count - count)
    :precondition (and
      (trip_started)
      (not (trip_concluded))
      (at ?c d14)
      (city_count ?c ?curr_count)
      (next_count ?curr_count ?next_count)
    )
    :effect (and
      (trip_concluded)
      (not (city_count ?c ?curr_count))
      (city_count ?c ?next_count)
    )
  )
)