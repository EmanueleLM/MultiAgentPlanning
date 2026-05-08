(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; calendar
    (first_day ?d - day)
    (next ?d1 - day ?d2 - day)

    ;; day assignment bookkeeping
    (free ?d - day)
    (assigned ?d - day)
    (in_city ?c - city ?d - day)
    (visited ?c - city)

    ;; direct flight connectivity
    (direct ?from - city ?to - city)

    ;; travel marker: a direct flight from ?from to ?to departing on day ?d
    (travel_leg ?from - city ?to - city ?d - day)
  )

  ;; assign the first day to a city
  (:action assign_start
    :parameters (?d - day ?c - city)
    :precondition (and (first_day ?d) (free ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (in_city ?c ?d) (visited ?c) (not (free ?d)))
  )

  ;; assign a subsequent day to a city (requires previous day already assigned)
  (:action assign_next
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and (next ?prev ?d) (assigned ?prev) (free ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (in_city ?c ?d) (visited ?c) (not (free ?d)))
  )

  ;; record a direct travel leg between connected cities when the departure and arrival days are already assigned
  (:action record_travel
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (next ?d ?d2) (in_city ?from ?d) (in_city ?to ?d2) (direct ?from ?to) (not (travel_leg ?from ?to ?d)))
    :effect (travel_leg ?from ?to ?d)
  )
)