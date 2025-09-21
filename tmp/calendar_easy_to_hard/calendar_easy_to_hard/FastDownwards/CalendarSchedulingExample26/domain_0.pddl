(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing)
  (:types meeting slot person)

  (:predicates
    ;; Common/time predicates
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)            ; s2 follows s1 (consecutive 30-min slots)
    (within-work-hours ?s - slot)           ; slot is within allowed work hours
    (start-allowed ?s - slot)               ; a start slot allowed by a participant's private calendar

    ;; Availability per person (each agent uses the free predicate)
    (free ?p - person ?s - slot)            ; person is free at slot

    ;; Per-agent unscheduled flags (used instead of negative preconditions)
    (unscheduled_a1 ?m - meeting)
    (unscheduled_a2 ?m - meeting)
    (unscheduled_a3 ?m - meeting)

    ;; Per-agent scheduling outcomes so we can map which agent scheduled the meeting and the chosen slot
    (scheduled_a1 ?m - meeting)             ; agent1 (Katherine) has scheduled meeting (declarative flag)
    (meeting_at_a1 ?m - meeting ?s - slot)  ; agent1 records meeting start slot
    (scheduled_a2 ?m - meeting ?s - slot)   ; agent2 (Nicole) records meeting start slot
    (meeting_scheduled_a2)                  ; agent2's boolean flag (keeps original agent2 flavor)
    (scheduled_a3 ?m - meeting ?s - slot)   ; agent3 (Kevin) records meeting start slot
  )

  ;; Action from agent 1 (based on the first agent's description)
  (:action schedule_a1
    :parameters (?m - meeting ?p - person ?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled_a1 ?m)
      (next ?s ?s2)
      (free ?p ?s)
      (free ?p ?s2)
    )
    :effect (and
      (scheduled_a1 ?m)
      (meeting_at_a1 ?m ?s)
      (not (unscheduled_a1 ?m))
      (not (free ?p ?s))
      (not (free ?p ?s2))
    )
  )

  ;; Action from agent 2 (based on the second agent's description)
  (:action schedule_a2
    :parameters (?m - meeting ?p - person ?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled_a2 ?m)
      (free ?p ?s)
      (free ?p ?s2)
      (next ?s ?s2)
      (within-work-hours ?s)
      (within-work-hours ?s2)
    )
    :effect (and
      (meeting_scheduled_a2)
      (scheduled_a2 ?m ?s)
      (not (unscheduled_a2 ?m))
      (not (free ?p ?s))
      (not (free ?p ?s2))
    )
  )

  ;; Action from agent 3 (based on the third agent's description)
  (:action schedule_a3
    :parameters (?m - meeting ?s - slot ?s2 - slot)
    :precondition (and
      (unscheduled_a3 ?m)
      (slot ?s)
      (slot ?s2)
      (next ?s ?s2)
      (start-allowed ?s)
    )
    :effect (and
      (scheduled_a3 ?m ?s)
      (not (unscheduled_a3 ?m))
      (not (start-allowed ?s))
    )
  )
)