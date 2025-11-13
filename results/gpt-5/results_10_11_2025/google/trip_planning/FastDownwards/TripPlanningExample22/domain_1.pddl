(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city day slot
  )
  (:predicates
    ; timeline
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)

    ; per-day assignment
    (assigned ?d - day)
    (unassigned ?d - day)
    (claim-open ?d - day)  ; allows at most one city-slot claim per assigned day

    ; location facts
    (at ?c - city ?d - day)
    (visited ?c - city)

    ; flight network (only direct flights are allowed for changes)
    (flight ?from - city ?to - city)

    ; show attendance tracking
    (show-day ?d - day)
    (attended ?d - day)
    (waived_show ?d - day)
    (show-covered ?d - day)  ; either attended or waived

    ; requested city-day slots (soft)
    (claimed-slot ?s - slot)
    (waived-slot ?s - slot)
    (slot-covered ?s - slot)

    (ber-slot ?s - slot)
    (fra-slot ?s - slot)
    (buc-slot ?s - slot)

    ; last assigned city and start marker
    (last ?c - city)
    (start)
  )
  (:functions
    (total-cost)
  )

  ; Assign the first day to any city (no previous city constraint).
  (:action assign_first_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (current-day ?d)
      (unassigned ?d)
      (start)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at ?c ?d)
      (visited ?c)
      (last ?c)
      (not (start))
    )
  )

  ; Stay in the same city as the last assigned city.
  (:action assign_stay
    :parameters (?c - city ?d - day)
    :precondition (and
      (current-day ?d)
      (unassigned ?d)
      (last ?c)
      (not (start))
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at ?c ?d)
      (visited ?c)
    )
  )

  ; Move to a different city using a direct flight from the last city.
  (:action assign_move
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (current-day ?d)
      (unassigned ?d)
      (not (start))
      (last ?from)
      (flight ?from ?to)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at ?to ?d)
      (visited ?to)
      (not (last ?from))
      (last ?to)
    )
  )

  ; Advance to the next day once the current day is assigned.
  (:action advance_day
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current-day ?d)
      (assigned ?d)
      (next ?d ?d2)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
    )
  )

  ; Mark attendance for a Berlin show day (zero cost).
  (:action mark_attended
    :parameters (?d - day)
    :precondition (and
      (show-day ?d)
      (at berlin ?d)
      (not (attended ?d))
    )
    :effect (and
      (attended ?d)
      (show-covered ?d)
    )
  )

  ; Waive show attendance at a penalty cost.
  (:action waive_show_day
    :parameters (?d - day)
    :precondition (and
      (show-day ?d)
      (not (attended ?d))
      (not (waived_show ?d))
      (not (show-covered ?d))
    )
    :effect (and
      (waived_show ?d)
      (show-covered ?d)
      (increase (total-cost) 100)
    )
  )

  ; Claim one Berlin city-day slot using a specific assigned Berlin day.
  (:action claim_city_slot_berlin
    :parameters (?s - slot ?d - day)
    :precondition (and
      (ber-slot ?s)
      (at berlin ?d)
      (claim-open ?d)
      (not (claimed-slot ?s))
      (not (waived-slot ?s))
    )
    :effect (and
      (claimed-slot ?s)
      (slot-covered ?s)
      (not (claim-open ?d))
    )
  )

  ; Claim one Frankfurt city-day slot using a specific assigned Frankfurt day.
  (:action claim_city_slot_frankfurt
    :parameters (?s - slot ?d - day)
    :precondition (and
      (fra-slot ?s)
      (at frankfurt ?d)
      (claim-open ?d)
      (not (claimed-slot ?s))
      (not (waived-slot ?s))
    )
    :effect (and
      (claimed-slot ?s)
      (slot-covered ?s)
      (not (claim-open ?d))
    )
  )

  ; Claim one Bucharest city-day slot using a specific assigned Bucharest day.
  (:action claim_city_slot_bucharest
    :parameters (?s - slot ?d - day)
    :precondition (and
      (buc-slot ?s)
      (at bucharest ?d)
      (claim-open ?d)
      (not (claimed-slot ?s))
      (not (waived-slot ?s))
    )
    :effect (and
      (claimed-slot ?s)
      (slot-covered ?s)
      (not (claim-open ?d))
    )
  )

  ; Waive a Berlin city-day slot at penalty cost.
  (:action waive_city_slot_berlin
    :parameters (?s - slot)
    :precondition (and
      (ber-slot ?s)
      (not (claimed-slot ?s))
      (not (waived-slot ?s))
    )
    :effect (and
      (waived-slot ?s)
      (slot-covered ?s)
      (increase (total-cost) 10)
    )
  )

  ; Waive a Frankfurt city-day slot at penalty cost.
  (:action waive_city_slot_frankfurt
    :parameters (?s - slot)
    :precondition (and
      (fra-slot ?s)
      (not (claimed-slot ?s))
      (not (waived-slot ?s))
    )
    :effect (and
      (waived-slot ?s)
      (slot-covered ?s)
      (increase (total-cost) 10)
    )
  )

  ; Waive a Bucharest city-day slot at penalty cost.
  (:action waive_city_slot_bucharest
    :parameters (?s - slot)
    :precondition (and
      (buc-slot ?s)
      (not (claimed-slot ?s))
      (not (waived-slot ?s))
    )
    :effect (and
      (waived-slot ?s)
      (slot-covered ?s)
      (increase (total-cost) 10)
    )
  )
)