(define (domain trip-planning)
  (:requirements :strips :typing :fluents :negative-preconditions)
  (:types city person)
  (:constants traveler - person)

  (:predicates
    (at ?p - person ?c - city)
    (known ?from - city ?to - city)   ; flight_checker knows this direct connection exists (declarative)
    (conn ?from - city ?to - city)    ; connection has been activated/announced by flight_checker (used by traveler)
    (visited ?c - city)
  )

  (:functions
    (days-left) ; remaining days to allocate (numeric)
  )

  ; --- flight_checker actions (keeps actions distinct per agent) ---
  (:action flight_checker-activate-connection
    :parameters (?from - city ?to - city)
    :precondition (and (known ?from ?to))
    :effect (and (conn ?from ?to))
  )

  ; --- traveler actions (keeps actions distinct per agent) ---
  (:action traveler-fly
    :parameters (?from - city ?to - city)
    :precondition (and (at traveler ?from) (conn ?from ?to))
    :effect (and (not (at traveler ?from)) (at traveler ?to))
  )

  ; stay actions for 1..11 days (traveler spends n days in a city; marks the city as visited and reduces days-left)
  (:action traveler-stay-1
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 1))
    :effect (and (visited ?c) (decrease (days-left) 1))
  )
  (:action traveler-stay-2
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 2))
    :effect (and (visited ?c) (decrease (days-left) 2))
  )
  (:action traveler-stay-3
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 3))
    :effect (and (visited ?c) (decrease (days-left) 3))
  )
  (:action traveler-stay-4
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 4))
    :effect (and (visited ?c) (decrease (days-left) 4))
  )
  (:action traveler-stay-5
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 5))
    :effect (and (visited ?c) (decrease (days-left) 5))
  )
  (:action traveler-stay-6
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 6))
    :effect (and (visited ?c) (decrease (days-left) 6))
  )
  (:action traveler-stay-7
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 7))
    :effect (and (visited ?c) (decrease (days-left) 7))
  )
  (:action traveler-stay-8
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 8))
    :effect (and (visited ?c) (decrease (days-left) 8))
  )
  (:action traveler-stay-9
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 9))
    :effect (and (visited ?c) (decrease (days-left) 9))
  )
  (:action traveler-stay-10
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 10))
    :effect (and (visited ?c) (decrease (days-left) 10))
  )
  (:action traveler-stay-11
    :parameters (?c - city)
    :precondition (and (at traveler ?c) (>= (days-left) 11))
    :effect (and (visited ?c) (decrease (days-left) 11))
  )
)