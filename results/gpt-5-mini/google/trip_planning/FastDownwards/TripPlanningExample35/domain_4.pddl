(define (domain trip_planning_specific)
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

  ;; assign the first day to a city using a non-relative slot
  (:action assign_first_by_slot
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

  ;; assign the first day using a relative slot (day must allow relative visit)
  (:action assign_first_by_rel_slot
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

  ;; stay in same city on successive day using non-relative slot
  (:action stay_by_slot
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

  ;; stay in same city on successive day using relative slot (day must allow relative visit)
  (:action stay_by_rel_slot
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

  ;; fly to another city with a direct flight using non-relative slot on next day
  (:action fly_by_slot
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

  ;; fly to another city with a direct flight using relative slot (day must allow relative visit)
  (:action fly_by_rel_slot
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