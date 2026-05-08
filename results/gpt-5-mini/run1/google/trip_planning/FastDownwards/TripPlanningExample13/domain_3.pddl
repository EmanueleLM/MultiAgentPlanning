(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; calendar
    (first_day ?d - day)
    (next ?d1 - day ?d2 - day)

    ;; day assignment bookkeeping
    (free ?d - day)
    (in_city ?c - city ?d - day)
    (visited ?c - city)

    ;; direct flight connectivity
    (direct ?from - city ?to - city)

    ;; travel marker: a direct flight from ?from to ?to departing on day ?d (arrival on next day)
    (travel_leg ?from - city ?to - city ?d - day)
  )

  ;; assign a city to a single day (consumes the free marker so each day can be assigned at most once)
  (:action assign_day
    :parameters (?d - day ?c - city)
    :precondition (free ?d)
    :effect (and (in_city ?c ?d) (visited ?c) (not (free ?d)))
  )

  ;; record a direct travel leg that departs on day ?d and arrives the next day ?d2
  (:action record_travel
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (next ?d ?d2) (in_city ?from ?d) (in_city ?to ?d2) (direct ?from ?to) (not (travel_leg ?from ?to ?d)))
    :effect (travel_leg ?from ?to ?d)
  )
)