(define (domain TripPlanningExample17-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (current ?d - day)
    (next ?d1 ?d2 - day)
    (at ?d - day ?c - city)                ; at(day, city) — you are in city on that day
    (direct ?c1 ?c2 - city)               ; allowed direct flight c1 -> c2
    (conf_day ?d - day)                   ; this day has a conference obligation
    (conf_city ?c - city)                 ; city that hosts the conference (copenhagen)
    (ready ?d - day)                      ; this day is "ready" to advance (set initially or by attend_conf)
  )

  ;; Attend the conference on a conference day at the conference city.
  ;; This action prepares the same day to be advanced (sets ready).
  (:action attend_conf
    :parameters (?d - day ?c - city)
    :precondition (and (current ?d) (conf_day ?d) (at ?d ?c) (conf_city ?c))
    :effect (and (ready ?d))
  )

  ;; Stay in the same city to the next day.
  ;; It records occupancy for the successor day and advances the current day.
  (:action stay
    :parameters (?d ?d2 - day ?c - city)
    :precondition (and (current ?d) (ready ?d) (at ?d ?c) (next ?d ?d2))
    :effect (and
      (not (current ?d))
      (current ?d2)
      (at ?d2 ?c)
    )
  )

  ;; Fly using a direct flight from the current city's day to the next day at the destination city.
  ;; Advances the current day and sets destination occupancy for the successor day.
  (:action fly
    :parameters (?d ?d2 - day ?c1 ?c2 - city)
    :precondition (and (current ?d) (ready ?d) (at ?d ?c1) (direct ?c1 ?c2) (next ?d ?d2))
    :effect (and
      (not (current ?d))
      (current ?d2)
      (at ?d2 ?c2)
    )
  )
)