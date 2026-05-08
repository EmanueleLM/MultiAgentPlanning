(define (domain itinerary_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)        ; temporal ordering of days
    (first_day ?d - day)             ; marks the first day of the trip
    (in_day ?d - day ?c - city)      ; being in city ?c on day ?d
    (assigned ?d - day)              ; day already assigned to some city
    (workshop_held)                  ; workshop has been scheduled
    (direct ?from - city ?to - city) ; direct flight connectivity
    (is_florence ?c - city)          ; marks which city is Florence
    (workshop_window ?d - day)       ; allowed workshop days
  )

  ;; start the trip by placing the agent in a city on the first day
  (:action start_in
    :parameters (?d - day ?c - city)
    :precondition (and (first_day ?d) (not (assigned ?d)))
    :effect (and (in_day ?d ?c) (assigned ?d))
  )

  ;; stay in the same city from one day to the next
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and (next ?d1 ?d2) (in_day ?d1 ?c) (not (assigned ?d2)))
    :effect (and (in_day ?d2 ?c) (assigned ?d2))
  )

  ;; travel by direct flight: move from one city on day d1 to a directly connected city on day d2 (next day)
  (:action flight_travel
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and (next ?d1 ?d2) (in_day ?d1 ?from) (direct ?from ?to) (not (assigned ?d2)))
    :effect (and (in_day ?d2 ?to) (assigned ?d2))
  )

  ;; schedule the workshop while in Florence on an allowed workshop window day
  (:action schedule_workshop
    :parameters (?d - day ?c - city)
    :precondition (and (in_day ?d ?c) (is_florence ?c) (workshop_window ?d) (not (workshop_held)))
    :effect (workshop_held)
  )
)