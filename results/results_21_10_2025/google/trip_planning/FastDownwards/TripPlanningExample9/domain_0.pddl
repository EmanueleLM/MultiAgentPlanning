; Domain crafted for FastDownward
(define (domain trip-direct-flights)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)                 ; traveler is at city c on day d
    (next ?d1 - day ?d2 - day)             ; temporal successor relation d1 -> d2
    (left-bucharest)                       ; traveler has left Bucharest (prevents re-entry -> enforces contiguous Bucharest stay)
    (left-stuttgart)                       ; traveler has left Stuttgart (prevents re-entry -> enforces contiguous Stuttgart stay)
    (visited-bucharest)                    ; Bucharest was visited at least once
    (visited-stuttgart)                    ; Stuttgart was visited at least once
    (attended-workshop)                    ; workshop in Stuttgart was attended (on a workshop-day)
    (workshop-day ?d - day)                ; marks days that are valid workshop days (5..10)
  )

  ; Stay in same city for the next day
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  ; Flight: Frankfurt -> Bucharest (direct)
  ; Disallow re-entry to Bucharest once left (enforces a single contiguous stay in Bucharest)
  (:action fly-frankfurt-to-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at frankfurt ?d1) (next ?d1 ?d2) (not (left-bucharest)))
    :effect (and (at bucharest ?d2) (visited-bucharest))
  )

  ; Flight: Bucharest -> Frankfurt (direct)
  ; Leaving Bucharest sets left-bucharest to prevent later re-entry
  (:action fly-bucharest-to-frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at bucharest ?d1) (next ?d1 ?d2))
    :effect (and (at frankfurt ?d2) (left-bucharest))
  )

  ; Flight: Frankfurt -> Stuttgart (direct)
  ; Disallow re-entry to Stuttgart once left (enforces a single contiguous stay in Stuttgart)
  (:action fly-frankfurt-to-stuttgart
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at frankfurt ?d1) (next ?d1 ?d2) (not (left-stuttgart)))
    :effect (and (at stuttgart ?d2) (visited-stuttgart))
  )

  ; Flight: Stuttgart -> Frankfurt (direct)
  ; Leaving Stuttgart sets left-stuttgart to prevent later re-entry
  (:action fly-stuttgart-to-frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at stuttgart ?d1) (next ?d1 ?d2))
    :effect (and (at frankfurt ?d2) (left-stuttgart))
  )

  ; Attend the required Stuttgart workshop on one of the workshop days (days 5..10).
  ; This action is the mechanism that enforces the hard requirement "attend workshop between day 5 and day 10 inclusive".
  (:action attend-workshop
    :parameters (?d - day)
    :precondition (and (at stuttgart ?d) (workshop-day ?d) (not (attended-workshop)))
    :effect (and (attended-workshop))
  )
)