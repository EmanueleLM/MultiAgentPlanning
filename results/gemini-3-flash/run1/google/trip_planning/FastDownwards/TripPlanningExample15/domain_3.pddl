(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at_now ?c - city)
    (at_city ?c - city ?d - day)
    (current_day ?d - day)
    (city_count ?c - city ?n - count)
    (next_day ?d1 - day ?d2 - day)
    (next_count ?n1 - count ?n2 - count)
    (can_fly ?c1 - city ?c2 - city)
    (is_started)
    (day_one ?d - day)
  )

  ;; Start the trip in an initial city on Day 1.
  (:action start_trip
    :parameters (?c - city ?d1 - day)
    :precondition (and 
      (not (is_started))
      (day_one ?d1)
    )
    :effect (and 
      (is_started)
      (at_now ?c)
      (current_day ?d1)
    )
  )

  ;; Record a visit to the current city on the current day, incrementing the stay count.
  (:action visit
    :parameters (?c - city ?d - day ?n_old - count ?n_new - count)
    :precondition (and 
      (at_now ?c)
      (current_day ?d)
      (not (at_city ?c ?d))
      (city_count ?c ?n_old)
      (next_count ?n_old ?n_new)
    )
    :effect (and 
      (at_city ?c ?d)
      (not (city_count ?c ?n_old))
      (city_count ?c ?n_new)
    )
  )

  ;; Fly from one city to another on the same day. 
  ;; You must have "visited" the current city on this day before departing.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and 
      (at_now ?from)
      (at_city ?from ?d)
      (can_fly ?from ?to)
      (current_day ?d)
    )
    :effect (and 
      (not (at_now ?from))
      (at_now ?to)
    )
  )

  ;; Advance the calendar to the next day.
  ;; You must have "visited" the city you are currently in for the day to count toward the total trip.
  (:action advance_day
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and 
      (current_day ?d)
      (next_day ?d ?d_next)
      (at_now ?c)
      (at_city ?c ?d)
    )
    :effect (and 
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )
)