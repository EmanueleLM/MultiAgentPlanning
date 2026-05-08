(define (domain schedule_meeting)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types slot)
  (:predicates
    (available ?s - slot)
    (earliest_preferred ?s - slot)
    (chosen ?s - slot)
    (chosen-satisfied)
  )
  (:functions (total-cost))
  ;; Single grounded action to choose any available slot.
  ;; Human-readable slot labels are provided as object names in the problem file.
  (:action choose_slot
    :parameters (?s - slot)
    :precondition (available ?s)
    :effect (and
      (not (available ?s))
      (chosen ?s)
      (chosen-satisfied)
      ;; cost effect is zero here; domain keeps (total-cost) for compatibility with a minimize metric.
      (increase (total-cost) 0)
    )
  )
)