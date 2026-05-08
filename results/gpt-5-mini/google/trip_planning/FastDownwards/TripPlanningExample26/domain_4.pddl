(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day slot)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
    (day_free ?d - day)
    (slot_belongs ?s - slot ?c - city)
    (slot_available ?s - slot)
    (slot_used ?s - slot)
    (eligible_meet_day ?d - day)
    (met)
  )

  (:action stay
    :parameters (?p - person ?c - city ?d - day ?dn - day ?s - slot)
    :precondition (and
      (at ?p ?c ?d)
      (next ?d ?dn)
      (day_free ?dn)
      (slot_available ?s)
      (slot_belongs ?s ?c)
    )
    :effect (and
      (not (at ?p ?c ?d))
      (at ?p ?c ?dn)
      (not (slot_available ?s))
      (slot_used ?s)
      (not (day_free ?dn))
    )
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?dn - day ?s - slot)
    :precondition (and
      (at ?p ?from ?d)
      (flight ?from ?to)
      (next ?d ?dn)
      (day_free ?dn)
      (slot_available ?s)
      (slot_belongs ?s ?to)
    )
    :effect (and
      (not (at ?p ?from ?d))
      (at ?p ?to ?dn)
      (not (slot_available ?s))
      (slot_used ?s)
      (not (day_free ?dn))
    )
  )

  (:action meet_friend
    :parameters (?p - person ?d - day)
    :precondition (and
      (at ?p reykjavik ?d)
      (eligible_meet_day ?d)
      (not (met))
    )
    :effect (met)
  )
)