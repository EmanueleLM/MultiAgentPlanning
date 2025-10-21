(define (domain itinerary)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)            ; traveler is in city on day
    (occupied ?d - day)               ; a day has been assigned a city
    (flight ?c1 - city ?c2 - city)    ; direct flight exists between two cities (bidirectional facts provided in problem)
    (next ?d1 - day ?d2 - day)        ; day successor relation
    (first ?d - day)                  ; marks the first day of the trip
    (not_started)                     ; true until a start action chooses the city for day1
  )

  ; Start the trip by choosing the city for the first day (any city can be chosen).
  (:action start
    :parameters (?c - city ?d - day)
    :precondition (and (first ?d) (not (occupied ?d)) (not_started))
    :effect (and (at ?c ?d) (occupied ?d) (not (not_started)))
  )

  ; Stay in the same city from one day to the next.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2) (not (occupied ?d2)))
    :effect (and (at ?c ?d2) (occupied ?d2))
  )

  ; Fly between two cities on consecutive days, allowed only on direct flights.
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and (at ?from ?d1) (next ?d1 ?d2) (flight ?from ?to) (not (occupied ?d2)))
    :effect (and (at ?to ?d2) (occupied ?d2))
  )
)