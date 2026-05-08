(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot time)

  (:predicates
    (available ?s - slot)
    (within_workhours ?s - slot)
    (slot_start ?s - slot ?t - time)
    (slot_end ?s - slot ?t - time)
    (next ?t1 - time ?t2 - time)
    (earliest_preferred ?s - slot)
    (chosen ?s - slot)
  )

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