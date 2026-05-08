(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)
  (:predicates
    (is_free_emily ?s - slot)
    (is_free_victoria ?s - slot)
    (is_free_nancy ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (available_to_check ?s - slot)
    (meeting_scheduled)
  )

  ;; Action to schedule the meeting if all participants are free at the current slot.
  ;; Because we check slots sequentially, this will naturally find the earliest availability.
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (available_to_check ?s)
      (is_free_emily ?s)
      (is_free_victoria ?s)
      (is_free_nancy ?s)
    )
    :effect (meeting_scheduled)
  )

  ;; Actions to skip a slot if any of the participants is busy.
  ;; If a slot is skipped, the next slot becomes available for checking.
  (:action skip_slot_emily_busy
    :parameters (?s - slot ?s_next - slot)
    :precondition (and
      (available_to_check ?s)
      (next ?s ?s_next)
      (not (is_free_emily ?s))
    )
    :effect (and
      (not (available_to_check ?s))
      (available_to_check ?s_next)
    )
  )

  (:action skip_slot_victoria_busy
    :parameters (?s - slot ?s_next - slot)
    :precondition (and
      (available_to_check ?s)
      (next ?s ?s_next)
      (not (is_free_victoria ?s))
    )
    :effect (and
      (not (available_to_check ?s))
      (available_to_check ?s_next)
    )
  )

  (:action skip_slot_nancy_busy
    :parameters (?s - slot ?s_next - slot)
    :precondition (and
      (available_to_check ?s)
      (next ?s ?s_next)
      (not (is_free_nancy ?s))
    )
    :effect (and
      (not (available_to_check ?s))
      (available_to_check ?s_next)
    )
  )
)