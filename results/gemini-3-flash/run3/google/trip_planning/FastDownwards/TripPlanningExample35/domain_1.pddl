(define (domain trip_planning_example_35)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at_city_on_day ?c - city ?d - day)
    (current_city ?c - city)
    (current_day ?d - day)
    (day_processed ?d - day)
    (next ?d1 ?d2 - day)
    (can_fly ?c1 ?c2 - city)
  )

  ;; Action to spend a full day in the current city
  (:action stay
    :parameters (?c - city ?d - day)
    :precondition (and (current_day ?d) (current_city ?c) (not (day_processed ?d)))
    :effect (and (at_city_on_day ?c ?d) (day_processed ?d))
  )

  ;; Action to fly from one city to another, counting the day for both cities
  (:action fly
    :parameters (?from ?to - city ?d - day)
    :precondition (and (current_day ?d) (current_city ?from) (can_fly ?from ?to) (not (day_processed ?d)))
    :effect (and (at_city_on_day ?from ?d) (at_city_on_day ?to ?d)
                 (not (current_city ?from)) (current_city ?to)
                 (day_processed ?d))
  )

  ;; Action to advance to the next day once the current day has been processed
  (:action next_day
    :parameters (?d ?dn - day)
    :precondition (and (day_processed ?d) (next ?d ?dn))
    :effect (and (not (current_day ?d)) (current_day ?dn))
  )
)