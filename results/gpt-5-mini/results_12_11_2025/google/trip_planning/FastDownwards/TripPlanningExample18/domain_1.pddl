(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)               ; located in city ?c on day ?d
    (next ?d1 - day ?d2 - day)           ; successor day relation
    (connected ?c1 - city ?c2 - city)    ; direct flight exists between cities
    (assigned ?d - day)                  ; day ?d has been assigned a city
    (allowed ?c - city ?d - day)         ; city ?c is allowed to be assigned on day ?d
  )

  ;; Choose an initial city for an unassigned day (used to assign day1)
  (:action choose-initial
    :parameters (?c - city ?d - day)
    :precondition (and
      (not (assigned ?d))
      (allowed ?c ?d)
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
      (not (assigned ?dn))
      (allowed ?c ?dn)
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
      (not (assigned ?dn))
      (allowed ?c2 ?dn)
    )
    :effect (and
      (at ?c2 ?dn)
      (assigned ?dn)
    )
  )
)