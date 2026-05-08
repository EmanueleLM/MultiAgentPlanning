(define (domain jackofalltrades_trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day slot)

  (:predicates
    (unassigned ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)

    (slot_for ?s - slot ?c - city)
    (slot_available ?s - slot)
    (used_slot ?s - slot)

    (direct_flight ?c1 - city ?c2 - city)

    (is_rel_slot ?s - slot)
    (rel_slot_allowed ?d - day)

    (day_succ ?d1 - day ?d2 - day)
    (day_is_first ?d - day)
  )

  ; assign day1 using a non-relatives slot
  (:action assign_day1_by_slot_general
    :parameters (?d - day ?c - city ?s - slot)
    :precondition (and
      (unassigned ?d)
      (slot_for ?s ?c)
      (slot_available ?s)
      (not (is_rel_slot ?s))
      (day_is_first ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d)
      (at ?d ?c)
      (not (slot_available ?s))
      (used_slot ?s)
    )
  )

  ; assign day1 using the relatives slot (only allowed on rel_slot_allowed days)
  (:action assign_day1_by_rel_slot
    :parameters (?d - day ?c - city ?s - slot)
    :precondition (and
      (unassigned ?d)
      (slot_for ?s ?c)
      (slot_available ?s)
      (is_rel_slot ?s)
      (rel_slot_allowed ?d)
      (day_is_first ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d)
      (at ?d ?c)
      (not (slot_available ?s))
      (used_slot ?s)
    )
  )

  ; stay: assign successor day to the same city using a non-relatives slot
  (:action stay_assign_by_slot_general
    :parameters (?dprev - day ?d - day ?c - city ?s - slot)
    :precondition (and
      (assigned ?dprev)
      (at ?dprev ?c)
      (unassigned ?d)
      (slot_for ?s ?c)
      (slot_available ?s)
      (not (is_rel_slot ?s))
      (day_succ ?dprev ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d)
      (at ?d ?c)
      (not (slot_available ?s))
      (used_slot ?s)
    )
  )

  ; stay: assign successor day to the same city using the relatives slot (only allowed on rel_slot_allowed days)
  (:action stay_assign_by_rel_slot
    :parameters (?dprev - day ?d - day ?c - city ?s - slot)
    :precondition (and
      (assigned ?dprev)
      (at ?dprev ?c)
      (unassigned ?d)
      (slot_for ?s ?c)
      (slot_available ?s)
      (is_rel_slot ?s)
      (rel_slot_allowed ?d)
      (day_succ ?dprev ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d)
      (at ?d ?c)
      (not (slot_available ?s))
      (used_slot ?s)
    )
  )

  ; fly: assign successor day to a different city reachable by direct flight using a non-relatives slot
  (:action fly_assign_by_slot_general
    :parameters (?dprev - day ?d - day ?cfrom - city ?cto - city ?s - slot)
    :precondition (and
      (assigned ?dprev)
      (at ?dprev ?cfrom)
      (direct_flight ?cfrom ?cto)
      (unassigned ?d)
      (slot_for ?s ?cto)
      (slot_available ?s)
      (not (is_rel_slot ?s))
      (day_succ ?dprev ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d)
      (at ?d ?cto)
      (not (slot_available ?s))
      (used_slot ?s)
    )
  )

  ; fly: assign successor day to a different city reachable by direct flight using the relatives slot (only allowed on rel_slot_allowed days)
  (:action fly_assign_by_rel_slot
    :parameters (?dprev - day ?d - day ?cfrom - city ?cto - city ?s - slot)
    :precondition (and
      (assigned ?dprev)
      (at ?dprev ?cfrom)
      (direct_flight ?cfrom ?cto)
      (unassigned ?d)
      (slot_for ?s ?cto)
      (slot_available ?s)
      (is_rel_slot ?s)
      (rel_slot_allowed ?d)
      (day_succ ?dprev ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (assigned ?d)
      (at ?d ?cto)
      (not (slot_available ?s))
      (used_slot ?s)
    )
  )

)