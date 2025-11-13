(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot time)

  (:predicates
    (available ?s - slot)
    (within_workhours ?s - slot)
    (earliest_preferred ?s - slot)
    (starts ?s - slot ?t - time)
    (ends ?s - slot ?t - time)
    (chosen ?s - slot)
    (chosen_done)
    (earliest_preferred_chosen)
  )

  ;; Choose an earliest preference-compliant slot (marked earliest_preferred).
  (:action choose_preferred
    :parameters (?s - slot)
    :precondition (and
      (available ?s)
      (within_workhours ?s)
      (earliest_preferred ?s)
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
    :parameters (?s - slot)
    :precondition (and
      (available ?s)
      (within_workhours ?s)
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