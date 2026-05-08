(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ;; calendar structure
    (first_day ?d - day)
    (next ?d1 - day ?d2 - day)

    ;; day assignment bookkeeping
    (free ?d - day)            ;; day is not yet assigned to any city
    (assigned ?d - day)        ;; day has been assigned to some city
    (in_city ?c - city ?d - day) ;; city c occupies day d
    (visited ?c - city)        ;; city c has been visited at least once

    ;; travel markers for direct flight legs (departure day)
    (travel_mb ?d - day)       ;; travelled Manchester -> Bucharest departing day ?d
    (travel_bl ?d - day)       ;; travelled Bucharest -> Lyon departing day ?d
  )

  ;; assign the first day to a city
  (:action assign_start
    :parameters (?d - day ?c - city)
    :precondition (and (first_day ?d) (free ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (in_city ?c ?d) (visited ?c) (not (free ?d)))
  )

  ;; assign a next calendar day to a city (requires previous day already assigned)
  (:action assign_next
    :parameters (?prev - day ?d - day ?c - city)
    :precondition (and (next ?prev ?d) (assigned ?prev) (free ?d) (not (assigned ?d)))
    :effect (and (assigned ?d) (in_city ?c ?d) (visited ?c) (not (free ?d)))
  )

  ;; travel Manchester -> Bucharest departing ?d and arriving on next day ?d2
  (:action travel_man_buch
    :parameters (?d - day ?d2 - day)
    :precondition (and (next ?d ?d2) (in_city manchester ?d) (in_city bucharest ?d2) (not (travel_mb ?d)))
    :effect (travel_mb ?d)
  )

  ;; travel Bucharest -> Lyon departing ?d and arriving on next day ?d2
  (:action travel_buch_lyon
    :parameters (?d - day ?d2 - day)
    :precondition (and (next ?d ?d2) (in_city bucharest ?d) (in_city lyon ?d2) (not (travel_bl ?d)))
    :effect (travel_bl ?d)
  )
)