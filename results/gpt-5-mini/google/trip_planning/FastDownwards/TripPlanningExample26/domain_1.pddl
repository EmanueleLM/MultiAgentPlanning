(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day slot)

  (:predicates
    (at ?p - person ?c - city ?d - day)            ; person p is in city c on day d
    (day-occupied ?d - day)                       ; a day has been assigned a location
    (next ?d1 - day ?d2 - day)                    ; immediate successor relation on days
    (flight ?c1 - city ?c2 - city)                ; direct flight exists from c1 to c2
    (slot-belongs ?s - slot ?c - city)            ; slot s belongs to city c
    (slot-available ?s - slot)                    ; slot s is still available (unused)
    (slot-used ?s - slot)                         ; slot s has been used (counts one day in its city)
    (eligible-meet-day ?d - day)                  ; day is in the meeting window
    (met)                                         ; meeting has occurred
  )

  ; stay: remain in the same city from day d to its successor dn, consuming one slot of that city
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

  ; fly: move from one city to another between consecutive days, allowed only if a direct flight exists, consuming one slot of the destination city
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

  ; meet_friend: can be executed exactly once while in reykjavik on an eligible day
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