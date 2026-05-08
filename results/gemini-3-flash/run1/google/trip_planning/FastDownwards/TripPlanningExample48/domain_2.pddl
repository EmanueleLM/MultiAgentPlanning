(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (at_end ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
    (started)
    (visited_2_days ?c - city)
    (trip_finished)
    (first_day ?d - day)
    (final_day ?d - day)
  )

  ;; Start the trip on the specified first day.
  (:action start_trip
    :parameters (?c - city ?d - day)
    :precondition (and (not (started)) (first_day ?d))
    :effect (and (started) (at ?c ?d) (at_end ?c ?d))
  )

  ;; Spend the whole next day in the same city.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (started) (at_end ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at_end ?c ?d1)) (at ?c ?d2) (at_end ?c ?d2))
  )

  ;; Fly from one city to another during the transition between days.
  ;; This results in being present in both the 'from' city and the 'to' city 
  ;; on the arrival day (d2), reflecting a realistic trip-planning overlap.
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (started) (at_end ?from ?d1) (next ?d1 ?d2) (flight ?from ?to))
    :effect (and (not (at_end ?from ?d1)) (at ?from ?d2) (at ?to ?d2) (at_end ?to ?d2))
  )

  ;; Check if a city has been visited on two distinct days.
  (:action validate_2_days
    :parameters (?c - city ?d1 ?d2 - day)
    :precondition (and (at ?c ?d1) (at ?c ?d2) (not (= ?d1 ?d2)))
    :effect (visited_2_days ?c)
  )

  ;; Mark the trip as complete once the final day is reached.
  (:action finish_trip
    :parameters (?c - city ?d - day)
    :precondition (and (at_end ?c ?d) (final_day ?d))
    :effect (trip_finished)
  )
)