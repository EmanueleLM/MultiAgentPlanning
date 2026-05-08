(define (domain trip_planner)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (flight ?from - city ?to - city)   ;; direct flight exists between two cities
    (succ ?d - day ?dnext - day)       ;; temporal successor relation between days
    (at ?c - city ?d - day)            ;; traveler is in city c on day d
    (assigned ?d - day)                ;; day d has been assigned to some city (mutual exclusion enforced by actions)
    (start_day ?d - day)               ;; allowed start day for the trip (initially day1)
  )

  ;; Start the trip on the designated start day by assigning that day to a city (only if not yet assigned).
  (:action start_at
    :parameters (?c - city ?d - day)
    :precondition (and (start_day ?d) (not (assigned ?d)))
    :effect (and (at ?c ?d) (assigned ?d))
  )

  ;; Remain in the same city from one day to the next.
  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and (at ?c ?d) (succ ?d ?dnext) (not (assigned ?dnext)))
    :effect (and (at ?c ?dnext) (assigned ?dnext))
  )

  ;; Fly from one city to another between consecutive days if a direct flight exists.
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and (at ?from ?d) (succ ?d ?dnext) (flight ?from ?to) (not (assigned ?dnext)))
    :effect (and (at ?to ?dnext) (assigned ?dnext))
  )
)