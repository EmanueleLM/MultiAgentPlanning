; PDDL domain for Fast Downward: direct-flight trip planning, enforces direct-flight-only moves and workshop window
(define (domain trip-direct-flights)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)                 ; traveler is at city c on day d
    (next ?d1 - day ?d2 - day)             ; temporal successor relation d1 -> d2
    (left-bucharest)                       ; traveller has left Bucharest (prevents re-entry)
    (left-stuttgart)                       ; traveller has left Stuttgart (prevents re-entry)
    (visited-bucharest)                    ; Bucharest was visited at least once
    (visited-frankfurt)                    ; Frankfurt was visited at least once
    (visited-stuttgart)                    ; Stuttgart was visited at least once
    (attended-workshop)                    ; workshop in Stuttgart was attended
    (workshop-day ?d - day)                ; day is valid workshop day (5..10)
  )

  ; Stay in the same city from one day to the next
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and (at ?c ?d1) (next ?d1 ?d2))
    :effect (and (at ?c ?d2))
  )

  ; Flight: Frankfurt -> Bucharest (direct)
  ; Disallow re-entry to Bucharest once left (enforces a single contiguous Bucharest stay)
  (:action fly-frankfurt-to-bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at frankfurt ?d1) (next ?d1 ?d2) (not (left-bucharest)))
    :effect (and (at bucharest ?d2) (visited-bucharest))
  )

  ; Flight: Bucharest -> Frankfurt (direct)
  ; Leaving Bucharest sets left-bucharest to prevent later re-entry; arrival marks Frankfurt visited
  (:action fly-bucharest-to-frankfurt
    :parameters (?d1 - day ?d2 - day)
    :precondition (and (at bucharest ?d1) (next ?d1 ?d2))
    :effect (and (at frankfurt ?d2) (left-bucharest) (visited-frankfurt))
  )

  ; Flight: Frankfurt -> Stuttgart (direct)
  ; Disallow re-entry to Stuttgart once left (enforces a single contiguous Stuttgart stay)
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
    :effect (and (at frankfurt ?d2) (left-stuttgart) (visited-frankfurt))
  )

  ; Attend the required Stuttgart workshop on one of the workshop days (days 5..10).
  ; This action enforces the hard requirement "attend workshop between day 5 and day 10 inclusive".
  (:action attend-workshop
    :parameters (?d - day)
    :precondition (and (at stuttgart ?d) (workshop-day ?d) (not (attended-workshop)))
    :effect (and (attended-workshop))
  )
)