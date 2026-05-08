(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (at ?c - city ?d - day)                ; you are in city ?c on calendar day ?d
    (assigned ?d - day)                    ; calendar day ?d has been assigned a city
    (next ?d1 - day ?d2 - day)             ; ordering of consecutive days
    (flight ?c1 - city ?c2 - city)         ; direct flight exists from c1 to c2
    (in_meet_window ?d - day)              ; day is inside the friends meet window
    (slot_for ?s - slot ?c - city)         ; slot corresponds to a city (enforces requested day counts)
    (slot_unfilled ?s - slot)              ; slot is still available to consume
    (slot_filled ?s - slot ?d - day)       ; slot was consumed for a specific day
    (meet_satisfied)                       ; a venice day inside the meet window has occurred
  )

  ;; Start the trip by assigning day1 to a city (consumes a slot).
  (:action start_in
    :parameters (?c - city ?s - slot)
    :precondition (and
      (not (assigned day1))
      (slot_for ?s ?c)
      (slot_unfilled ?s)
    )
    :effect (and
      (assigned day1)
      (at ?c day1)
      (not (slot_unfilled ?s))
      (slot_filled ?s day1)
    )
  )

  ;; Start in venice on day1 during the meet window: also satisfy meet.
  (:action start_in_venice_meet
    :parameters (?s - slot)
    :precondition (and
      (not (assigned day1))
      (slot_for ?s venice)
      (slot_unfilled ?s)
      (in_meet_window day1)
    )
    :effect (and
      (assigned day1)
      (at venice day1)
      (not (slot_unfilled ?s))
      (slot_filled ?s day1)
      (meet_satisfied)
    )
  )

  ;; Stay in the same city from day d to next day d2 (consumes a slot for that city).
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day ?s - slot)
    :precondition (and
      (at ?c ?d)
      (next ?d ?d2)
      (not (assigned ?d2))
      (slot_for ?s ?c)
      (slot_unfilled ?s)
    )
    :effect (and
      (assigned ?d2)
      (at ?c ?d2)
      (not (slot_unfilled ?s))
      (slot_filled ?s ?d2)
    )
  )

  ;; Stay in venice and arrive on a meet-window day: satisfy meet.
  (:action stay_venice_meet
    :parameters (?d - day ?d2 - day ?s - slot)
    :precondition (and
      (at venice ?d)
      (next ?d ?d2)
      (not (assigned ?d2))
      (slot_for ?s venice)
      (slot_unfilled ?s)
      (in_meet_window ?d2)
    )
    :effect (and
      (assigned ?d2)
      (at venice ?d2)
      (not (slot_unfilled ?s))
      (slot_filled ?s ?d2)
      (meet_satisfied)
    )
  )

  ;; Fly from current city to a directly connected city (consumes destination city slot).
  (:action fly
    :parameters (?c_from - city ?c_to - city ?d - day ?d2 - day ?s - slot)
    :precondition (and
      (at ?c_from ?d)
      (next ?d ?d2)
      (not (assigned ?d2))
      (flight ?c_from ?c_to)
      (slot_for ?s ?c_to)
      (slot_unfilled ?s)
    )
    :effect (and
      (assigned ?d2)
      (at ?c_to ?d2)
      (not (slot_unfilled ?s))
      (slot_filled ?s ?d2)
    )
  )

  ;; Fly into venice on a meet-window day: also satisfy meet_satisfied.
  (:action fly_to_venice_meet
    :parameters (?c_from - city ?d - day ?d2 - day ?s - slot)
    :precondition (and
      (at ?c_from ?d)
      (next ?d ?d2)
      (not (assigned ?d2))
      (flight ?c_from venice)
      (slot_for ?s venice)
      (slot_unfilled ?s)
      (in_meet_window ?d2)
    )
    :effect (and
      (assigned ?d2)
      (at venice ?d2)
      (not (slot_unfilled ?s))
      (slot_filled ?s ?d2)
      (meet_satisfied)
    )
  )
)