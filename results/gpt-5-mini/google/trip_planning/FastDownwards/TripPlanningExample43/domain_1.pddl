(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    ;; at ?c ?d = you are in city ?c on day ?d (one city per day intended)
    (at ?c - city ?d - day)
    ;; assigned ?d = day ?d has been scheduled/assigned
    (assigned ?d - day)
    ;; next day ordering
    (next ?d1 - day ?d2 - day)
    ;; direct flight connectivity (one-way)
    (flight ?c1 - city ?c2 - city)
    ;; days that lie inside the friends-meet window
    (in_meet_window ?d - day)
    ;; slot bookkeeping to enforce exact number of days per city
    (slot_for ?s - slot ?c - city)
    (slot_unfilled ?s - slot)
    (slot_filled ?s - slot ?d - day)
    ;; true once we have a venice day inside the meet window
    (meet_satisfied)
  )

  ;; start in any city on day1 (consumes a city slot for that city)
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
      ;; if starting in venice on day1 and day1 is inside meet window, satisfy meet
      (when (and) )
    )
  )

  ;; specialized start that sets meet_satisfied when starting in venice on a meet-window day
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

  ;; stay in the same city from day d to next day d2 (consumes a slot for that city)
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

  ;; stay in venice that also may satisfy the meet if the arrival day is in the window
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

  ;; fly from current city to a directly connected city (consumes destination city slot)
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

  ;; fly into venice on a meet-window day: also satisfy meet_satisfied
  (:action fly_venice_meet
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