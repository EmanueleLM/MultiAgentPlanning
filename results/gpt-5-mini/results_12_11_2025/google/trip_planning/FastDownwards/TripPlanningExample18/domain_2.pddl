(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)               ; located in city ?c on day ?d
    (next ?d1 - day ?d2 - day)           ; successor day relation
    (connected ?c1 - city ?c2 - city)    ; direct flight exists between cities
    (allowed ?c - city ?d - day)         ; city ?c is allowed to be occupied on day ?d (structural constraint)
    (assigned ?d - day)                  ; day ?d has been assigned a city (prevents double-assignment)
    (start-day ?d - day)                 ; marks the unique valid start day (day1)
  )

  ;; Start the itinerary by placing the traveler in an allowed city on the designated start day.
  (:action start
    :parameters (?c - city ?d - day)
    :precondition (and
      (start-day ?d)
      (allowed ?c ?d)
      (not (assigned ?d))
    )
    :effect (and
      (at ?c ?d)
      (assigned ?d)
    )
  )

  ;; Stay in the same city from day d to its successor day dn
  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (at ?c ?d)
      (next ?d ?dn)
      (allowed ?c ?dn)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?c ?dn)
      (assigned ?dn)
    )
  )

  ;; Fly along a direct connection from city c1 on day d to city c2 on successor day dn
  (:action fly
    :parameters (?c1 - city ?c2 - city ?d - day ?dn - day)
    :precondition (and
      (at ?c1 ?d)
      (connected ?c1 ?c2)
      (next ?d ?dn)
      (allowed ?c2 ?dn)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?c2 ?dn)
      (assigned ?dn)
    )
  )
)