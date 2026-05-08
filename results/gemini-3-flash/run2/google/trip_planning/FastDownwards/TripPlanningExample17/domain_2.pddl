(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (stay_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (flight ?c1 ?c2 - city)
    (visited ?c - city ?d - day)
  )

  ;; Action to stay in a city for a day.
  ;; This advances the timeline and increases the stay count for the current city.
  (:action stay_in_city
    :parameters (?city - city ?d_now - day ?d_next - day ?c_pre - count ?c_post - count)
    :precondition (and
      (at_city ?city)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (stay_count ?city ?c_pre)
      (next_count ?c_pre ?c_post)
    )
    :effect (and
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (stay_count ?city ?c_pre))
      (stay_count ?city ?c_post)
      (visited ?city ?d_now)
    )
  )

  ;; Action to fly from one city to another.
  ;; In this model, a flight day counts as a visit day for both the departure and arrival cities.
  ;; This allows 13 city-days to be fulfilled within an 11-day calendar duration.
  (:action fly_to_city
    :parameters (?from - city ?to - city ?d_now - day ?d_next - day ?cf_pre - count ?cf_post - count ?ct_pre - count ?ct_post - count)
    :precondition (and
      (at_city ?from)
      (flight ?from ?to)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (stay_count ?from ?cf_pre)
      (next_count ?cf_pre ?cf_post)
      (stay_count ?to ?ct_pre)
      (next_count ?ct_pre ?ct_post)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d_now))
      (current_day ?d_next)
      (not (stay_count ?from ?cf_pre))
      (stay_count ?from ?cf_post)
      (not (stay_count ?to ?ct_pre))
      (stay_count ?to ?ct_post)
      (visited ?from ?d_now)
      (visited ?to ?d_now)
    )
  )
)