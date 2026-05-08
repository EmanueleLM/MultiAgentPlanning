(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types slot)
  (:predicates
    (available_jesse ?s - slot)
    (available_kathryn ?s - slot)
    (available_megan ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (current_slot ?s - slot)
    (scheduled)
  )

  ;; Action to move from the current time slot to the next one.
  ;; This effectively advances time in the search.
  (:action skip
    :parameters (?s - slot ?sn - slot)
    :precondition (and (current_slot ?s) (next ?s ?sn))
    :effect (and (not (current_slot ?s)) (current_slot ?sn))
  )

  ;; Action to schedule the meeting at the current slot.
  ;; It requires all participants to be available during that slot.
  (:action schedule
    :parameters (?s - slot)
    :precondition (and (current_slot ?s)
                       (available_jesse ?s)
                       (available_kathryn ?s)
                       (available_megan ?s))
    :effect (scheduled)
  )
)