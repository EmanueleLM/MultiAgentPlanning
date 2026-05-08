(define (domain trip_planning_3cities)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (unassigned ?d - day)
    (assigned ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (can_travel ?from - city ?to - city)
  )

  ;; assign the first day (day1) to a city
  (:action assign_day1
    :parameters (?c - city)
    :precondition (unassigned day1)
    :effect (and (assigned day1 ?c) (not (unassigned day1)))
  )

  ;; assign a next day to a city only if the previous day was assigned
  ;; and there is a direct flight (or staying in the same city) from prev city
  (:action assign_next
    :parameters (?pd - day ?pc - city ?d - day ?c - city)
    :precondition (and (assigned ?pd ?pc) (next ?pd ?d) (unassigned ?d) (can_travel ?pc ?c))
    :effect (and (assigned ?d ?c) (not (unassigned ?d)))
  )
)