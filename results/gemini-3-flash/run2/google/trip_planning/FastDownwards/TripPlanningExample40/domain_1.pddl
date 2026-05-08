(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types
    city day count
  )
  (:predicates
    (at_city ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (visited ?c - city ?d - day)
    (counted ?c - city ?d - day)
    (flight ?c1 ?c2 - city)
    (city_stay_count ?c - city ?v - count)
    (next_val ?v1 ?v2 - count)
  )

  ;; Stay in a city for a whole day
  (:action spend_day
    :parameters (?c - city ?d_now - day ?d_next - day)
    :precondition (and
      (at_city ?c)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
    )
    :effect (and
      (not (current_day ?d_now))
      (current_day ?d_next)
      (visited ?c ?d_now)
    )
  )

  ;; Travel from one city to another on a specific day.
  ;; The day of travel counts as being in both cities for stay requirements.
  (:action travel
    :parameters (?from - city ?to - city ?d_now - day ?d_next - day)
    :precondition (and
      (at_city ?from)
      (current_day ?d_now)
      (next_day ?d_now ?d_next)
      (flight ?from ?to)
    )
    :effect (and
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d_now))
      (current_day ?d_next)
      (visited ?from ?d_now)
      (visited ?to ?d_now)
    )
  )

  ;; Count a city-day visit towards the stay requirement.
  (:action count_visit
    :parameters (?c - city ?d - day ?v_old - count ?v_new - count)
    :precondition (and
      (visited ?c ?d)
      (not (counted ?c ?d))
      (city_stay_count ?c ?v_old)
      (next_val ?v_old ?v_new)
    )
    :effect (and
      (not (city_stay_count ?c ?v_old))
      (city_stay_count ?c ?v_new)
      (counted ?c ?d)
    )
  )
)