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

  ;; Choose a single contiguous slot of exactly one time-unit (30 minutes).
  ;; Preconditions require the slot to be available, within workhours, and its start and end
  ;; times to be contiguous via the next relation (enforcing contiguous occupancy).
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