(define (domain travel-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (connected ?c1 - city ?c2 - city)
    (assigned ?d - day)
  )

  ;; Choose an initial city for day1 (only if day1 is not yet assigned)
  (:action choose-initial
    :parameters (?c - city ?d - day)
    :precondition (and
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
      (not (assigned ?dn))
    )
    :effect (and
      (at ?c ?dn)
      (assigned ?dn)
    )
  )

  ;; Fly from city c1 on day d to directly connected city c2 on successor day dn
  (:action fly
    :parameters (?c1 - city ?c2 - city ?d - day ?dn - day)
    :precondition (and
      (at ?c1 ?d)
      (connected ?c1 ?c2)
      (next ?d ?dn)
      (not (assigned ?dn))
    )
    :effect (and
      (at ?c2 ?dn)
      (assigned ?dn)
    )
  )
)