(define (domain multi-agent-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot)

  (:predicates
    ;; Agent 1 predicates (from first agent)
    (available_a1 ?s - slot)
    (fits_duration_a1 ?s - slot)
    (on_monday_a1 ?s - slot)
    (within_window_a1 ?s - slot)   ; between 09:00 and 17:00 for agent1
    (scheduled_a1 ?s - slot)
    (meeting_scheduled_a1)

    ;; Agent 2 predicates (from second agent)
    (available_a2 ?s - slot)
    (fits_a2 ?s - slot)
    (within_hours_a2 ?s - slot)    ; between 09:00 and 17:00 for agent2
    (duration30_a2 ?s - slot)
    (scheduled_a2 ?s - slot)
    (meeting_scheduled_a2)

    ;; Agent 3 predicates (from third agent)
    (unscheduled_a3)               ; agent3's initial state marker
    (available_a3 ?s - slot)
    (meeting_at_a3 ?s - slot)

    ;; Global predicates to coordinate the orchestration
    (scheduled_global ?s - slot)
    (meeting_scheduled_global)
  )

  ;; Actions kept distinct per agent (preserve each agent's action names and preconditions)
  (:action schedule_by_agent1
    :parameters (?s - slot)
    :precondition (and
      (available_a1 ?s)
      (fits_duration_a1 ?s)
      (on_monday_a1 ?s)
      (within_window_a1 ?s)
      (not (meeting_scheduled_a1))
    )
    :effect (and
      (meeting_scheduled_a1)
      (scheduled_a1 ?s)
      (not (available_a1 ?s))
    )
  )

  (:action schedule_by_agent2
    :parameters (?s - slot)
    :precondition (and
      (available_a2 ?s)
      (fits_a2 ?s)
      (within_hours_a2 ?s)
      (duration30_a2 ?s)
      (not (meeting_scheduled_a2))
    )
    :effect (and
      (meeting_scheduled_a2)
      (scheduled_a2 ?s)
      (not (available_a2 ?s))
    )
  )

  (:action schedule_by_agent3
    :parameters (?s - slot)
    :precondition (and
      (unscheduled_a3)
      (available_a3 ?s)
    )
    :effect (and
      (not (unscheduled_a3))
      (meeting_at_a3 ?s)
      (not (available_a3 ?s))
    )
  )

  ;; Finalize action: commit a single common slot as the globally scheduled meeting.
  ;; This action requires that all agents have effectively marked the same slot.
  (:action finalize_meeting
    :parameters (?s - slot)
    :precondition (and
      (scheduled_a1 ?s)
      (scheduled_a2 ?s)
      (meeting_at_a3 ?s)
      (not (meeting_scheduled_global))
    )
    :effect (and
      (meeting_scheduled_global)
      (scheduled_global ?s)
    )
  )
)