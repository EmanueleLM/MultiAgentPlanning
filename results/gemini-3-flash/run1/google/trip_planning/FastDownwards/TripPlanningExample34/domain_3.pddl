(define (domain trip_planning)
  (:requirements :strips :typing)
  (:types city day count)

  (:predicates
    (at ?c - city ?d - day)             ;; The traveler is in city ?c on calendar day ?d
    (visited ?c - city ?d - day)        ;; Calendar day ?d has been counted toward the stay duration of city ?c
    (stay_count ?c - city ?n - count)   ;; City ?c has been visited for ?n distinct days
    (day_adj ?d1 ?d2 - day)             ;; Sequential calendar days
    (count_adj ?n1 ?n2 - count)         ;; Sequential counters for stay duration
    (flight ?c1 ?c2 - city)             ;; A direct flight exists between city ?c1 and city ?c2
  )

  ;; Count the current day toward the stay duration of the city the traveler is currently in.
  ;; This can only be done once per city per calendar day.
  (:action spend_day
    :parameters (?c - city ?d - day ?old_n - count ?new_n - count)
    :precondition (and 
      (at ?c ?d)
      (stay_count ?c ?old_n)
      (count_adj ?old_n ?new_n)
      (not (visited ?c ?d))
    )
    :effect (and 
      (visited ?c ?d)
      (stay_count ?c ?new_n)
      (not (stay_count ?c ?old_n))
    )
  )

  ;; Move to the next calendar day while remaining in the same city.
  (:action advance_day
    :parameters (?c - city ?d_from - day ?d_to - day)
    :precondition (and 
      (at ?c ?d_from)
      (day_adj ?d_from ?d_to)
    )
    :effect (and 
      (at ?c ?d_to)
      (not (at ?c ?d_from))
    )
  )

  ;; Take a direct flight from one city to another on the current calendar day.
  ;; This does not advance the calendar day, allowing the day to be counted for both cities if desired.
  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and 
      (at ?from ?d)
      (flight ?from ?to)
    )
    :effect (and 
      (at ?to ?d)
      (not (at ?from ?d))
    )
  )
)