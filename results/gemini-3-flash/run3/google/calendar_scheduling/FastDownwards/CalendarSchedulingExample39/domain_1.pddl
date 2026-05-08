(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)

  (:predicates
    (at_slot ?s - slot)
    (next_slot ?s1 ?s2 - slot)
    (is_available ?p - person ?s - slot)
    (meeting_scheduled)
  )

  ;; Advance the time pointer to the next half-hour slot.
  ;; This represents the passage of time without a meeting being scheduled.
  (:action move_to_next_slot
    :parameters (?s_from - slot ?s_to - slot)
    :precondition (and (at_slot ?s_from) (next_slot ?s_from ?s_to))
    :effect (and (not (at_slot ?s_from)) (at_slot ?s_to))
  )

  ;; Schedule the meeting at the current time slot.
  ;; All three participants must be available during this slot.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (at_slot ?s)
      (is_available emily ?s)
      (is_available victoria ?s)
      (is_available nancy ?s)
    )
    :effect (meeting_scheduled)
  )
)