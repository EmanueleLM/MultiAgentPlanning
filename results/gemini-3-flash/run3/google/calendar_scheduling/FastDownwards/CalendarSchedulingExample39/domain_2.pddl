(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types slot)

  (:predicates
    (at_slot ?s - slot)
    (next_slot ?s1 ?s2 - slot)
    (available ?s - slot)
    (meeting_scheduled)
  )

  ;; Advance the time pointer to the next half-hour slot.
  ;; This represents the sequential nature of time and facilitates finding the earliest availability.
  (:action move_to_next_slot
    :parameters (?s_from - slot ?s_to - slot)
    :precondition (and (at_slot ?s_from) (next_slot ?s_from ?s_to))
    :effect (and (not (at_slot ?s_from)) (at_slot ?s_to))
  )

  ;; Schedule the meeting at the current time slot.
  ;; The meeting can only be scheduled if the group is available at that specific slot.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and 
      (at_slot ?s)
      (available ?s)
    )
    :effect (meeting_scheduled)
  )
)