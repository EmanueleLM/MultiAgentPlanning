(define (domain jack_of_all_trades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (next ?d1 - day ?d2 - day)
    (flight ?c1 - city ?c2 - city)
    (in_meet_window ?d - day)
    (slot_for ?s - slot ?c - city)
    (slot_unfilled ?s - slot)
    (slot_filled ?s - slot ?d - day)
    (meet_satisfied)
  )

  ;; start-in when starting in venice on day1 and meeting window satisfied
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

  ;; start-in general (any city) for day1 (no meet flag)
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

  ;; stay action when arriving on a venice day inside meet window: sets meet_satisfied
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

  ;; stay general (remain in same city, no meet flag)
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

  ;; fly action when arriving to venice on a meet-window day: sets meet_satisfied
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

  ;; fly general (move between different cities using declared flights)
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

)