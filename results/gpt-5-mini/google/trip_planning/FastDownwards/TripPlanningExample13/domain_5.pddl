(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next ?d1 - day ?d2 - day)        ;; successor relation on the calendar
    (free ?d - day)                  ;; day is not yet assigned to a city
    (day_at ?d - day ?c - city)      ;; day is spent in city
    (visited ?c - city)              ;; city has been visited at least once
    (direct ?from - city ?to - city) ;; direct flight connectivity
    (travel_leg ?from - city ?to - city ?d - day) ;; travel departing on day ?d, arriving next day
  )

  ;; assign a city to a free day
  (:action assign_day
    :parameters (?d - day ?c - city)
    :precondition (free ?d)
    :effect (and (day_at ?d ?c) (visited ?c) (not (free ?d)))
  )

  ;; fly overnight from ?from on day ?d to arrive at ?to on next day ?d2
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and (next ?d ?d2) (day_at ?d ?from) (free ?d2) (direct ?from ?to))
    :effect (and (travel_leg ?from ?to ?d) (day_at ?d2 ?to) (visited ?to) (not (free ?d2)))
  )
)