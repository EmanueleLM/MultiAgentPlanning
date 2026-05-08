(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day slot)

  (:predicates
    (at ?p - person ?c - city ?d - day)
    (day-occupied ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
    (slot-belongs ?s - slot ?c - city)
    (slot-available ?s - slot)
    (slot-used ?s - slot)
    (eligible-meet-day ?d - day)
    (met)
  )

  (:action stay
    :parameters (?p - person ?c - city ?d - day ?dn - day ?s - slot)
    :precondition (and
      (at ?p ?c ?d)
      (next ?d ?dn)
      (day-occupied ?d)
      (not (day-occupied ?dn))
      (slot-available ?s)
      (slot-belongs ?s ?c)
    )
    :effect (and
      (not (at ?p ?c ?d))
      (not (slot-available ?s))
      (at ?p ?c ?dn)
      (slot-used ?s)
      (day-occupied ?dn)
    )
  )

  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?dn - day ?s - slot)
    :precondition (and
      (at ?p ?from ?d)
      (flight ?from ?to)
      (next ?d ?dn)
      (day-occupied ?d)
      (not (day-occupied ?dn))
      (slot-available ?s)
      (slot-belongs ?s ?to)
    )
    :effect (and
      (not (at ?p ?from ?d))
      (not (slot-available ?s))
      (at ?p ?to ?dn)
      (slot-used ?s)
      (day-occupied ?dn)
    )
  )

  (:action meet_friend
    :parameters (?p - person ?d - day)
    :precondition (and
      (at ?p reykjavik ?d)
      (eligible-meet-day ?d)
      (not (met))
    )
    :effect (met)
  )
)