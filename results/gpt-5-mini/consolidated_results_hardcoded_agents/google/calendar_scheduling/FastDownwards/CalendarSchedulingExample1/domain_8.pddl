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
  )

  ;; Choose a single slot by deleting availability and making it chosen.
  ;; Requiring slot_start/slot_end and next enforces contiguous occupancy for the slot duration.
  (:action choose_slot
    :parameters (?s - slot ?ts - time ?te - time)
    :precondition (and
      (available ?s)
      (within_workhours ?s)
      (slot_start ?s ?ts)
      (slot_end ?s ?te)
      (next ?ts ?te)
    )
    :effect (and
      (not (available ?s))
      (chosen ?s)
    )
  )
)