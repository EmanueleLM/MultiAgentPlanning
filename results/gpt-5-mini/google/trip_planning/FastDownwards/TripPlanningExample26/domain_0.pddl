(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person city day slot)

  (:predicates
    (at ?p - person ?c - city ?d - day)                ; person p is in city c on day d
    (day-occupied ?d - day)                           ; a location has been set for day d
    (next ?d1 - day ?d2 - day)                        ; d2 is the immediate successor of d1
    (flight ?c1 - city ?c2 - city)                    ; there is a direct flight from c1 to c2
    (slot-available ?s - slot ?c - city)              ; slot s for city c is still available (unused)
    (slot-used ?s - slot ?c - city)                   ; slot s for city c has been consumed
    (slot-belongs ?s - slot ?c - city)                ; slot s is labeled for city c (static)
    (eligible-meet-day ?d - day)                      ; day d is in the allowed meeting window
    (met)                                             ; meet_friend has occurred (exactly once)
  )

  ; STAY action: remain in the same city for the next day, consuming one city-slot for that city
  (:action stay
    :parameters (?p - person ?c - city ?d - day ?dn - day ?s - slot)
    :precondition (and
      (at ?p ?c ?d)
      (next ?d ?dn)
      (day-occupied ?d)
      (not (day-occupied ?dn))
      (slot-available ?s ?c)
      (slot-belongs ?s ?c)
    )
    :effect (and
      (not (at ?p ?c ?d))
      (not (slot-available ?s ?c))
      (at ?p ?c ?dn)
      (slot-used ?s ?c)
      (day-occupied ?dn)
    )
  )

  ; FLY action: move from one city to another between consecutive days, requires a flight edge and consumes a destination slot
  (:action fly
    :parameters (?p - person ?from - city ?to - city ?d - day ?dn - day ?s - slot)
    :precondition (and
      (at ?p ?from ?d)
      (flight ?from ?to)
      (next ?d ?dn)
      (day-occupied ?d)
      (not (day-occupied ?dn))
      (slot-available ?s ?to)
      (slot-belongs ?s ?to)
    )
    :effect (and
      (not (at ?p ?from ?d))
      (not (slot-available ?s ?to))
      (at ?p ?to ?dn)
      (slot-used ?s ?to)
      (day-occupied ?dn)
    )
  )

  ; MEET action: occurs exactly once on an eligible day in Reykjavik
  (:action meet_friend
    :parameters (?p - person ?d - day)
    :precondition (and
      (at ?p Reykjavik ?d)
      (eligible-meet-day ?d)
      (not (met))
    )
    :effect (and
      (met)
    )
  )
)