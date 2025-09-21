(define (domain combined-meeting-schedule)
  (:requirements :typing :strips)
  (:types participant slot)

  (:predicates
    ;; temporal adjacency for 30-minute slots
    (next ?s1 - slot ?s2 - slot)

    ;; agent-specific availability predicates (kept distinct per-agent)
    (avail_bobby ?s - slot)        ; agent1's "available"
    (free_scott ?s - slot)         ; agent2's "free"
    (free_kimberly ?s - slot)      ; agent3's "free"

    ;; per-agent scheduling markers (actions remain distinct)
    (scheduled_a1 ?s1 - slot ?s2 - slot)
    (scheduled_a2 ?s1 - slot ?s2 - slot)
    (scheduled_a3 ?s1 - slot ?s2 - slot)

    ;; agent2 bookkeeping predicate (keeps agent2 semantics)
    (unscheduled)

    ;; final confirmed meeting marker (goal)
    (meeting_confirmed)
  )

  ;; Agent 1's scheduling action (derived from first agent).
  ;; Agent 1 only knows about its own participant (Bobby); we keep its action distinct.
  (:action schedule_a1
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (avail_bobby ?s1)
      (avail_bobby ?s2)
    )
    :effect (and
      (scheduled_a1 ?s1 ?s2)
    )
  )

  ;; Agent 2's scheduling action (derived from second agent).
  ;; Requires Scott to be free in both slots and that the meeting is not yet scheduled by agent2.
  (:action schedule_a2
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free_scott ?s1)
      (free_scott ?s2)
      (unscheduled)
    )
    :effect (and
      (scheduled_a2 ?s1 ?s2)
      (not (unscheduled))
    )
  )

  ;; Agent 3's scheduling action (derived from third agent).
  ;; Kimberly's local semantics: consumes her free slots when she schedules.
  (:action schedule_a3
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next ?s1 ?s2)
      (free_kimberly ?s1)
      (free_kimberly ?s2)
    )
    :effect (and
      (scheduled_a3 ?s1 ?s2)
      (not (free_kimberly ?s1))
      (not (free_kimberly ?s2))
    )
  )

  ;; Finalizer/coordinator action: only succeeds if all three agents have scheduled the same two consecutive slots.
  ;; When executed it marks the meeting as confirmed (the overall goal).
  (:action finalize_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (scheduled_a1 ?s1 ?s2)
      (scheduled_a2 ?s1 ?s2)
      (scheduled_a3 ?s1 ?s2)
    )
    :effect (and
      (meeting_confirmed)
    )
  )
)