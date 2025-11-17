(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)
  (:predicates
    (available ?s - slot)
    (earliest_preferred ?s - slot)
    (chosen ?s - slot)
    (chosen_done)
    (earliest_preferred_chosen)
  )

  ;; Choose a slot that is marked as the earliest preference-compliant slot.
  ;; This action can only be applied once because it requires (not (chosen_done))
  ;; and establishes (chosen_done). It also establishes (earliest_preferred_chosen).
  (:action choose_preferred
    :parameters (?s - slot)
    :precondition (and (available ?s) (earliest_preferred ?s) (not (chosen_done)))
    :effect (and
      (not (available ?s))
      (chosen ?s)
      (chosen_done)
      (earliest_preferred_chosen)
    )
  )

  ;; Choose a non-preferred slot. Also only applicable if no slot has been chosen yet.
  (:action choose_nonpreferred
    :parameters (?s - slot)
    :precondition (and (available ?s) (not (earliest_preferred ?s)) (not (chosen_done)))
    :effect (and
      (not (available ?s))
      (chosen ?s)
      (chosen_done)
    )
  )
)