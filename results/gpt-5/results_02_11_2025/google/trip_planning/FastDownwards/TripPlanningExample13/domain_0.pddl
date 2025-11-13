(define (domain itinerary-17days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d - day ?dn - day)
    (lastday ?d - day)
    (current ?d - day)
    (unassigned ?d - day)
    (scheduled ?d - day)
    (assigned ?d - day ?c - city)
    (started)
    (last ?c - city)
    (flight ?c1 - city ?c2 - city)
    (require-lyon ?d - day)
  )

  ; Assign first day (no previous city), non-final day, on non-required (non-Lyon-fixed) day
  (:action assign-first-any-mid
    :parameters (?d - day ?c - city ?dn - day)
    :precondition (and (current ?d) (unassigned ?d) (not (started))
                       (not (require-lyon ?d)) (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (started) (last ?c) (not (current ?d)) (current ?dn))
  )

  ; Assign first day (no previous city), final day, on non-required day
  (:action assign-first-any-final
    :parameters (?d - day ?c - city)
    :precondition (and (current ?d) (unassigned ?d) (not (started))
                       (not (require-lyon ?d)) (lastday ?d))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (started) (last ?c) (not (current ?d)))
  )

  ; Continue with same city as previous, non-final day, on non-required day
  (:action assign-same-mid
    :parameters (?d - day ?c - city ?dn - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (last ?c) (not (require-lyon ?d))
                       (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (not (current ?d)) (current ?dn))
  )

  ; Continue with same city as previous, final day, on non-required day
  (:action assign-same-final
    :parameters (?d - day ?c - city)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (last ?c) (not (require-lyon ?d)) (lastday ?d))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (not (current ?d)))
  )

  ; Change city with required direct flight, non-final day, on non-required day
  (:action assign-change-mid
    :parameters (?d - day ?prev - city ?c - city ?dn - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (last ?prev) (not (last ?c)) (flight ?prev ?c)
                       (not (require-lyon ?d)) (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (not (last ?prev)) (last ?c)
                 (not (current ?d)) (current ?dn))
  )

  ; Change city with required direct flight, final day, on non-required day
  (:action assign-change-final
    :parameters (?d - day ?prev - city ?c - city)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (last ?prev) (not (last ?c)) (flight ?prev ?c)
                       (not (require-lyon ?d)) (lastday ?d))
    :effect (and (assigned ?d ?c) (scheduled ?d) (not (unassigned ?d))
                 (not (last ?prev)) (last ?c)
                 (not (current ?d)))
  )

  ; First assignment on a Lyon-required day (no previous city), non-final day
  (:action assign-first-lyon-mid
    :parameters (?d - day ?dn - day)
    :precondition (and (current ?d) (unassigned ?d) (not (started))
                       (require-lyon ?d) (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (started) (last lyon) (not (current ?d)) (current ?dn))
  )

  ; First assignment on a Lyon-required day (no previous city), final day
  (:action assign-first-lyon-final
    :parameters (?d - day)
    :precondition (and (current ?d) (unassigned ?d) (not (started))
                       (require-lyon ?d) (lastday ?d))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (started) (last lyon) (not (current ?d)))
  )

  ; Stay in Lyon on a Lyon-required day, non-final day
  (:action assign-same-lyon-mid
    :parameters (?d - day ?dn - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (require-lyon ?d) (last lyon)
                       (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (not (current ?d)) (current ?dn))
  )

  ; Stay in Lyon on a Lyon-required day, final day
  (:action assign-same-lyon-final
    :parameters (?d - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (require-lyon ?d) (last lyon) (lastday ?d))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (not (current ?d)))
  )

  ; Change to Lyon on a Lyon-required day with a required direct flight, non-final day
  (:action assign-change-to-lyon-mid
    :parameters (?d - day ?prev - city ?dn - day)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (require-lyon ?d) (last ?prev) (not (last lyon))
                       (flight ?prev lyon)
                       (not (lastday ?d)) (next ?d ?dn))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (not (last ?prev)) (last lyon)
                 (not (current ?d)) (current ?dn))
  )

  ; Change to Lyon on a Lyon-required day with a required direct flight, final day
  (:action assign-change-to-lyon-final
    :parameters (?d - day ?prev - city)
    :precondition (and (started) (current ?d) (unassigned ?d)
                       (require-lyon ?d) (last ?prev) (not (last lyon))
                       (flight ?prev lyon)
                       (lastday ?d))
    :effect (and (assigned ?d lyon) (scheduled ?d) (not (unassigned ?d))
                 (not (last ?prev)) (last lyon)
                 (not (current ?d)))
  )
)