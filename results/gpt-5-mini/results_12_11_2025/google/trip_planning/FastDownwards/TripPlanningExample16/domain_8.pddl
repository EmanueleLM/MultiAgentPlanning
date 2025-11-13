(define (domain travel-integration)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    ; day identity markers
    (is-d1 ?d - day) (is-d2 ?d - day) (is-d3 ?d - day)
    (is-d4 ?d - day) (is-d5 ?d - day) (is-d6 ?d - day)
    (is-d7 ?d - day) (is-d8 ?d - day) (is-d9 ?d - day)

    ; temporal successor relation (contiguous days)
    (next ?d1 - day ?d2 - day)

    ; workshop requirement on some days
    (workshop-day ?d - day)

    ; sequencing control
    (ready ?d - day)
    (unassigned ?d - day)

    ; occupancy: which city a day is assigned to
    (at ?d - day ?c - city)

    ; direct flight adjacency (symmetric edges provided in problem)
    (direct ?c1 - city ?c2 - city)

    ; last-city marker to represent the most recently assigned city
    (last ?c - city)

    ; city identity helpers (true only for the named city objects in the problem)
    (is-prague ?c - city)
    (is-vienna ?c - city)
    (is-porto ?c - city)
  )

  ; --------------------
  ; Non-final day actions (consume ready on day d and enable ready on next day nd)
  ; Two kinds: staying in the same city, or moving to a different city (requires direct flight).
  ; Each kind has a workshop-day variant (which forces assignment to Prague) and a non-workshop variant.
  ; --------------------

  (:action assign-stay-nonworkshop
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (ready ?d) (unassigned ?d) (next ?d ?nd)
      (last ?c)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (not (ready ?d))
      (ready ?nd)
      ; last stays the same (?c remains last)
      (last ?c)
    )
  )

  (:action assign-move-nonworkshop
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (ready ?d) (unassigned ?d) (next ?d ?nd)
      (last ?from)
      (direct ?from ?to)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?to)
      (not (ready ?d))
      (ready ?nd)
      (not (last ?from))
      (last ?to)
    )
  )

  (:action assign-stay-workshop
    :parameters (?d - day ?nd - day ?c - city)
    :precondition (and
      (ready ?d) (unassigned ?d) (next ?d ?nd)
      (last ?c)
      (workshop-day ?d)
      (is-prague ?c)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (not (ready ?d))
      (ready ?nd)
      (last ?c)
    )
  )

  (:action assign-move-workshop
    :parameters (?d - day ?nd - day ?from - city ?to - city)
    :precondition (and
      (ready ?d) (unassigned ?d) (next ?d ?nd)
      (last ?from)
      (direct ?from ?to)
      (workshop-day ?d)
      (is-prague ?to)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?to)
      (not (ready ?d))
      (ready ?nd)
      (not (last ?from))
      (last ?to)
    )
  )

  ; --------------------
  ; Final day actions (day d9). These do not require a successor; they consume ready and finish.
  ; Workshop variant included but in this domain workshop days are d1-d3; d9 is handled as non-workshop here.
  ; --------------------

  (:action assign-final-stay
    :parameters (?d - day ?c - city)
    :precondition (and
      (is-d9 ?d)
      (ready ?d) (unassigned ?d)
      (last ?c)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?c)
      (not (ready ?d))
      (last ?c)
    )
  )

  (:action assign-final-move
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (is-d9 ?d)
      (ready ?d) (unassigned ?d)
      (last ?from)
      (direct ?from ?to)
      (not (workshop-day ?d))
    )
    :effect (and
      (not (unassigned ?d))
      (at ?d ?to)
      (not (ready ?d))
      (not (last ?from))
      (last ?to)
    )
  )
)