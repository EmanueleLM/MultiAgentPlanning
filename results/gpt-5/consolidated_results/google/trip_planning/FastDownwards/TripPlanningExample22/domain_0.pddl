(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    city day slot
  )
  (:predicates
    (current-day ?d - day)
    (next ?d1 - day ?d2 - day)

    (assigned ?d - day)
    (unassigned ?d - day)
    (claim-open ?d - day)

    (at ?c - city ?d - day)
    (visited ?c - city)

    (flight ?from - city ?to - city)

    (show-day ?d - day)
    (attended ?d - day)
    (waived_show ?d - day)
    (show-covered ?d - day)

    (allowed ?c - city)
    (last ?c - city)

    (claimed-slot ?s - slot)
    (waived-slot ?s - slot)
    (slot-covered ?s - slot)

    (ber-slot ?s - slot)
    (fra-slot ?s - slot)
    (buc-slot ?s - slot)
  )
  (:functions
    (total-cost)
  )

  ; Assign the current day to a city (exactly one city per day). This also sets the "last" city for computing allowed next-day choices.
  (:action assign_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (current-day ?d)
      (unassigned ?d)
      (allowed ?c)
    )
    :effect (and
      (assigned ?d)
      (not (unassigned ?d))
      (at ?c ?d)
      (visited ?c)
      ; maintain unique last-city
      (not (last berlin))
      (not (last frankfurt))
      (not (last bucharest))
      (last ?c)
    )
  )

  ; Advance the day pointer, computing the set of cities allowed for the next day based on direct flights from the last assigned city.
  (:action advance_day_from_berlin
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current-day ?d)
      (assigned ?d)
      (next ?d ?d2)
      (last berlin)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      ; reset allowed-set
      (not (allowed berlin))
      (not (allowed frankfurt))
      (not (allowed bucharest))
      ; staying is allowed; direct flights from berlin: frankfurt
      (allowed berlin)
      (allowed frankfurt)
    )
  )

  (:action advance_day_from_frankfurt
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current-day ?d)
      (assigned ?d)
      (next ?d ?d2)
      (last frankfurt)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      ; reset allowed-set
      (not (allowed berlin))
      (not (allowed frankfurt))
      (not (allowed bucharest))
      ; staying is allowed; direct flights from frankfurt: berlin, bucharest
      (allowed frankfurt)
      (allowed berlin)
      (allowed bucharest)
    )
  )

  (:action advance_day_from_bucharest
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current-day ?d)
      (assigned ?d)
      (next ?d ?d2)
      (last bucharest)
    )
    :effect (and
      (not (current-day ?d))
      (current-day ?d2)
      ; reset allowed-set
      (not (allowed berlin))
      (not (allowed frankfurt))
      (not (allowed bucharest))
      ; staying is allowed; direct flights from bucharest: frankfurt
      (allowed bucharest)
      (allowed frankfurt)
    )
  )

  ; Mark attendance on a Berlin show day, enabling zero-cost satisfaction of the show requirement.
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

  ; Waive show attendance for a show day at a penalty cost.
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

  ; Claim one Berlin city-day slot using a specific assigned Berlin day (each day can claim at most one slot).
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