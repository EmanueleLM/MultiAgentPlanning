(define (domain trip-planning)
  ;; Domain for visiting three cities using only direct flights and consuming day tokens for stays.
  ;; Note: This domain intentionally models city-specific stay tokens (ctok) to encode the stated
  ;; hard preferences for stays per city. The corresponding problem below encodes those preferences
  ;; as hard goals; because the stated desired stays (Venice 6 + Dubrovnik 4 + Istanbul 3 = 13)
  ;; exceed the available total days (11), the problem is unsolvable. The unsolvability is
  ;; deliberate to reflect the irreconcilable oversubscription in the human specification.
  (:requirements :typing :negative-preconditions)
  (:types city day ctok)

  (:predicates
    (at ?c - city)                      ; current location
    (direct ?from ?to - city)           ; direct flight from -> to
    (day-available ?d - day)            ; a global day token available for assignment
    (ctok-of ?t - ctok ?c - city)       ; city-specific stay token t belongs to city c
    (free-ctok ?t - ctok)               ; city-specific stay token not yet used
    (used-ctok ?t - ctok)               ; city-specific stay token has been used (one stay day assigned)
    (visited ?c - city)                 ; city has been visited at least once by staying
  )

  ;; Fly action: allowed only where a direct flight exists.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and (at ?from) (direct ?from ?to))
    :effect (and (not (at ?from)) (at ?to))
  )

  ;; Stay action: consume one global day token and one city-specific stay token for the current city.
  ;; This encodes assigning one of the available trip days to a specific city's desired-stay quota.
  (:action stay
    :parameters (?d - day ?t - ctok ?c - city)
    :precondition (and (at ?c) (day-available ?d) (ctok-of ?t ?c) (free-ctok ?t))
    :effect (and
              (not (day-available ?d))
              (not (free-ctok ?t))
              (used-ctok ?t)
              (visited ?c)
            )
  )
)