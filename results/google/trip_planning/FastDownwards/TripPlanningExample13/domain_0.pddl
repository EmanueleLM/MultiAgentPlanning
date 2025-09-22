(define (domain integrated-trip)
  (:requirements :typing :fluents :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)         ; at city ?c on day ?d (end of that day slot)
    (direct ?c1 - city ?c2 - city) ; direct flight exists from ?c1 to ?c2
    (next ?d1 - day ?d2 - day)     ; day successor
    (trip-started)                 ; trip has been started (one of the start actions)
  )

  ;; numeric function counts days spent (staying overnight) in each city
  (:functions
    (days-in ?c - city)
  )

  ;; --- Start actions (kept distinct per agent) ---
  (:action man_start-at
    :parameters (?c - city)
    :precondition (not (trip-started))
    :effect (and (trip-started) (at ?c day1))
  )

  (:action buch_start-trip-from
    :parameters (?c - city)
    :precondition (not (trip-started))
    :effect (and (trip-started) (at ?c day1))
  )

  (:action lyon_start-at
    :parameters (?c - city)
    :precondition (not (trip-started))
    :effect (and (trip-started) (at ?c day1))
  )

  ;; --- Fly actions (distinct per agent but same semantics) ---
  ;; Flights are instantaneous within the same day (do not advance day).
  (:action man_fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  (:action buch_fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  (:action lyon_fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and (at ?from ?d) (direct ?from ?to))
    :effect (and (not (at ?from ?d)) (at ?to ?d))
  )

  ;; --- Stay actions (advance to next day and increment city's days-in counter) ---
  ;; Manchester agent: provides a stay action specifically for Manchester (reflecting its special requirement).
  (:action man_stay-manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at manchester ?d1) (next ?d1 ?d2))
    :effect (and (not (at manchester ?d1)) (at manchester ?d2) (increase (days-in manchester) 1))
  )

  ;; Bucharest agent: generic one-day stay action (as in the Bucharest model)
  (:action buch_stay-one-day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (not (at ?c ?d1)) (at ?c ?d2) (increase (days-in ?c) 1))
  )

  ;; Lyon agent: stay action for Lyon (reflects the Lyon model emphasis)
  (:action lyon_stay-lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at lyon ?d1) (next ?d1 ?d2))
    :effect (and (not (at lyon ?d1)) (at lyon ?d2) (increase (days-in lyon) 1))
  )
)