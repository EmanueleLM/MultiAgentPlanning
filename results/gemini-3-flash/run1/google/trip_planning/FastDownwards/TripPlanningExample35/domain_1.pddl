(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count_val)
  (:predicates
    (at_city ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (counted ?c - city ?d - day)
    (current_count ?c - city ?cv - count_val)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?cv1 - count_val ?cv2 - count_val)
    (flight ?c1 - city ?c2 - city)
    (not_started)
  )

  ;; Start the trip on day 1 at a selected city.
  (:action start_trip
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and (at_city ?c d1) (visited ?c d1) (not (not_started)))
  )

  ;; Stay in the current city and move to the next day.
  (:action stay
    :parameters (?c - city ?d_now - day ?d_next - day)
    :precondition (and (at_city ?c ?d_now) (next_day ?d_now ?d_next))
    :effect (and (not (at_city ?c ?d_now)) (at_city ?c ?d_next) (visited ?c ?d_next))
  )

  ;; Take a direct flight between cities on the same day.
  ;; This allows sharing a calendar day between two cities.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at_city ?from ?d) (flight ?from ?to))
    :effect (and (not (at_city ?from ?d)) (at_city ?to ?d) (visited ?to ?d))
  )

  ;; Count a day of visit towards a city's duration requirement.
  (:action count_visit
    :parameters (?c - city ?d - day ?cv_from - count_val ?cv_to - count_val)
    :precondition (and (visited ?c ?d) (not (counted ?c ?d)) (current_count ?c ?cv_from) (next_count ?cv_from ?cv_to))
    :effect (and (counted ?c ?d) (current_count ?c ?cv_to) (not (current_count ?c ?cv_from)))
  )
)