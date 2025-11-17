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
    (chosen_done)
    (earliest_preferred_chosen)
  )

  ;; Choose an earliest preference-compliant slot (marked earliest_preferred).
  (:action choose_preferred
    :parameters (?s - slot ?ts - time ?te - time)
    :precondition (and
      (available ?s)
      (within_workhours ?s)
      (earliest_preferred ?s)
      (slot_start ?s ?ts)
      (slot_end ?s ?te)
      (not (chosen_done))
    )
    :effect (and
      (not (available ?s))
      (chosen ?s)
      (chosen_done)
      (earliest_preferred_chosen)
    )
  )

  ;; Choose a non-preferred slot (only if no choice made yet).
  (:action choose_nonpreferred
    :parameters (?s - slot ?ts - time ?te - time)
    :precondition (and
      (available ?s)
      (within_workhours ?s)
      (slot_start ?s ?ts)
      (slot_end ?s ?te)
      (not (earliest_preferred ?s))
      (not (chosen_done))
    )
    :effect (and
      (not (available ?s))
      (chosen ?s)
      (chosen_done)
    )
  )
)