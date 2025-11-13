(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot time)

  (:predicates
    (available ?s - slot)
    (within_workhours ?s - slot)
    (slot_start ?s - slot ?t - time)
    (slot_end ?s - slot ?t - time)
    (next ?t1 - time ?t2 - time)         ; explicit contiguous time successor relation
    (earliest_preferred ?s - slot)       ; marked for the earliest preference-compliant slot
    (chosen ?s - slot)                   ; selection result
    (selection_open)                     ; allows exactly one selection when true
  )

  ;; Choose exactly one slot: requires selection_open and deletes it to prevent further choices.
  (:action choose_slot
    :parameters (?s - slot ?ts - time ?te - time)
    :precondition (and
      (selection_open)
      (available ?s)
      (within_workhours ?s)
      (slot_start ?s ?ts)
      (slot_end ?s ?te)
      (next ?ts ?te)                     ; enforces contiguous occupancy for the slot duration
    )
    :effect (and
      (not (available ?s))
      (not (selection_open))
      (chosen ?s)
    )
  )
)