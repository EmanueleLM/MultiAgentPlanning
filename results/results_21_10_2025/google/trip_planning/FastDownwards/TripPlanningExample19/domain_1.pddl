(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)               ; traveler is in city c at day d
    (visited ?c - city ?d - day)          ; traveler has visited city c on day d (accumulates)
    (direct ?from - city ?to - city)      ; direct flight exists from -> to (static)
    (next ?d - day ?dn - day)             ; dn is the successor day of d (static)
    (allowed-meet ?d - day)               ; day is within meeting window (static)
    (met)                                 ; meeting in Nice has occurred
  )

  ; Stay in same city from day d to the next day dn
  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and (at ?c ?d) (next ?d ?dn))
    :effect (and
              (not (at ?c ?d))
              (at ?c ?dn)
              (visited ?c ?dn)
            )
  )

  ; Fly from one city to another in one day if a direct flight exists
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dn - day)
    :precondition (and (at ?from ?d) (direct ?from ?to) (next ?d ?dn))
    :effect (and
              (not (at ?from ?d))
              (at ?to ?dn)
              (visited ?to ?dn)
            )
  )

  ; Meet friends in Nice on an allowed meeting day (only once)
  (:action meet-in-nice
    :parameters (?d - day)
    :precondition (and (at nice ?d) (allowed-meet ?d) (not (met)))
    :effect (and (met))
  )
)