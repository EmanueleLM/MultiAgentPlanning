(define (domain trip_planning_example_31)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)
  (:predicates
    (at_city ?c - city)
    (day_at ?d - day)
    (visited_on ?c - city ?d - day)
    (city_visit_count ?c - city ?n - count)
    (next_day ?d1 ?d2 - day)
    (next_count ?n1 ?n2 - count)
    (connected ?c1 ?c2 - city)
  )

  ;; Mark the current city as visited on the current day.
  ;; This increments the total count of distinct days spent in that city.
  ;; A city must be visited on a day for that day to count toward its total.
  (:action record_visit
    :parameters (?c - city ?d - day ?n_old ?n_new - count)
    :precondition (and (at_city ?c)
                       (day_at ?d)
                       (city_visit_count ?c ?n_old)
                       (next_count ?n_old ?n_new)
                       (not (visited_on ?c ?d)))
    :effect (and (visited_on ?c ?d)
                 (city_visit_count ?c ?n_new)
                 (not (city_visit_count ?c ?n_old)))
  )

  ;; Advance to the next day.
  ;; To finish a day, you must have recorded a visit for the city you are currently in.
  (:action advance_day
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and (day_at ?d)
                       (next_day ?d ?d_next)
                       (at_city ?c)
                       (visited_on ?c ?d))
    :effect (and (day_at ?d_next)
                 (not (day_at ?d)))
  )

  ;; Travel between cities using direct flights.
  ;; Commuting between cities counts as spending time in both the origin and destination city for that day.
  ;; You must record the visit in the origin city before you can fly out.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at_city ?from)
                       (day_at ?d)
                       (connected ?from ?to)
                       (visited_on ?from ?d))
    :effect (and (at_city ?to)
                 (not (at_city ?from)))
  )
)