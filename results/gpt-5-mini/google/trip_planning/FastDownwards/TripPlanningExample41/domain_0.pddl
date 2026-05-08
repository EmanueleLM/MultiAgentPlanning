(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    day
    slot_stockholm
    slot_athens
    slot_mykonos
  )

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (free_day ?d - day)
    (flight ?from - city ?to - city)

    (slot_free_stockholm ?s - slot_stockholm)
    (slot_filled_stockholm ?s - slot_stockholm)
    (filled_by_stockholm ?s - slot_stockholm ?d - day)

    (slot_free_athens ?s - slot_athens)
    (slot_filled_athens ?s - slot_athens)
    (filled_by_athens ?s - slot_athens ?d - day)

    (slot_free_mykonos ?s - slot_mykonos)
    (slot_filled_mykonos ?s - slot_mykonos)
    (filled_by_mykonos ?s - slot_mykonos ?d - day)
  )

  ;; Stay in stockholm (same-city next-day assignment)
  (:action stay_in_stockholm
    :parameters (?d1 - day ?d2 - day ?s - slot_stockholm)
    :precondition (and
      (at stockholm ?d1)
      (next_day ?d1 ?d2)
      (free_day ?d2)
      (slot_free_stockholm ?s)
    )
    :effect (and
      (at stockholm ?d2)
      (filled_by_stockholm ?s ?d2)
      (slot_filled_stockholm ?s)
      (not (slot_free_stockholm ?s))
      (not (free_day ?d2))
    )
  )

  ;; Fly to stockholm from athens
  (:action fly_to_stockholm_from_athens
    :parameters (?d1 - day ?d2 - day ?s - slot_stockholm)
    :precondition (and
      (at athens ?d1)
      (next_day ?d1 ?d2)
      (flight athens stockholm)
      (free_day ?d2)
      (slot_free_stockholm ?s)
    )
    :effect (and
      (at stockholm ?d2)
      (filled_by_stockholm ?s ?d2)
      (slot_filled_stockholm ?s)
      (not (slot_free_stockholm ?s))
      (not (free_day ?d2))
    )
  )

  ;; Stay in athens
  (:action stay_in_athens
    :parameters (?d1 - day ?d2 - day ?s - slot_athens)
    :precondition (and
      (at athens ?d1)
      (next_day ?d1 ?d2)
      (free_day ?d2)
      (slot_free_athens ?s)
    )
    :effect (and
      (at athens ?d2)
      (filled_by_athens ?s ?d2)
      (slot_filled_athens ?s)
      (not (slot_free_athens ?s))
      (not (free_day ?d2))
    )
  )

  ;; Fly to athens from stockholm
  (:action fly_to_athens_from_stockholm
    :parameters (?d1 - day ?d2 - day ?s - slot_athens)
    :precondition (and
      (at stockholm ?d1)
      (next_day ?d1 ?d2)
      (flight stockholm athens)
      (free_day ?d2)
      (slot_free_athens ?s)
    )
    :effect (and
      (at athens ?d2)
      (filled_by_athens ?s ?d2)
      (slot_filled_athens ?s)
      (not (slot_free_athens ?s))
      (not (free_day ?d2))
    )
  )

  ;; Fly to athens from mykonos
  (:action fly_to_athens_from_mykonos
    :parameters (?d1 - day ?d2 - day ?s - slot_athens)
    :precondition (and
      (at mykonos ?d1)
      (next_day ?d1 ?d2)
      (flight mykonos athens)
      (free_day ?d2)
      (slot_free_athens ?s)
    )
    :effect (and
      (at athens ?d2)
      (filled_by_athens ?s ?d2)
      (slot_filled_athens ?s)
      (not (slot_free_athens ?s))
      (not (free_day ?d2))
    )
  )

  ;; Stay in mykonos
  (:action stay_in_mykonos
    :parameters (?d1 - day ?d2 - day ?s - slot_mykonos)
    :precondition (and
      (at mykonos ?d1)
      (next_day ?d1 ?d2)
      (free_day ?d2)
      (slot_free_mykonos ?s)
    )
    :effect (and
      (at mykonos ?d2)
      (filled_by_mykonos ?s ?d2)
      (slot_filled_mykonos ?s)
      (not (slot_free_mykonos ?s))
      (not (free_day ?d2))
    )
  )

  ;; Fly to mykonos from athens
  (:action fly_to_mykonos_from_athens
    :parameters (?d1 - day ?d2 - day ?s - slot_mykonos)
    :precondition (and
      (at athens ?d1)
      (next_day ?d1 ?d2)
      (flight athens mykonos)
      (free_day ?d2)
      (slot_free_mykonos ?s)
    )
    :effect (and
      (at mykonos ?d2)
      (filled_by_mykonos ?s ?d2)
      (slot_filled_mykonos ?s)
      (not (slot_free_mykonos ?s))
      (not (free_day ?d2))
    )
  )
)