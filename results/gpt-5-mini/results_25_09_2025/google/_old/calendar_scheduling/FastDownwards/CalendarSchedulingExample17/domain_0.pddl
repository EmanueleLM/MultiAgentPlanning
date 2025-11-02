(define (domain meeting-scheduling-orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types time)

  (:predicates
    ;; Agent-specific availability (keeps agents' actions distinct)
    (available_a1 ?t - time)     ; availability according to Agent 1
    (available_a2 ?t - time)     ; availability according to Agent 2
    (available_a3 ?t - time)     ; availability according to Agent 3 (Helen)

    ;; Agent 2 knowledge / constraints
    (within-hours ?t - time)     ; Agent 2 requires times between 09:00 and 17:00
    (meeting-duration-30)        ; Agent 2 enforces 30-minute meeting duration

    ;; Agent 3 preference / state
    (unscheduled)                ; Agent 3 models "no meeting yet"
    (scheduled)                  ; Agent 3 models "a meeting has been scheduled"

    ;; Global flags used by Agent 1 and Agent 2
    (meeting-scheduled)          ; Agent 1/2 "a meeting has been scheduled"
    (scheduled-at ?t - time)     ; record the chosen start time

    ;; Helper predicate for Helen's preference ("do not meet after 13:30")
    (before13_30 ?t - time)
  )

  ;; --- Actions kept distinct for each agent (preserve original agent actions) ---

  ;; Agent 1's action (keeps Agent 1 semantics: allows scheduling if Agent 1 sees time available)
  (:action schedule-meeting-a1
    :parameters (?t - time)
    :precondition (available_a1 ?t)
    :effect (and
              (scheduled-at ?t)
              (meeting-scheduled)
              (not (available_a1 ?t))
            )
  )

  ;; Agent 2's action (keeps Agent 2 semantics: requires available according to Agent 2,
  ;; within-hours, meeting-duration-30, and that no meeting is yet scheduled)
  (:action schedule-a2
    :parameters (?t - time)
    :precondition (and
                    (available_a2 ?t)
                    (within-hours ?t)
                    (meeting-duration-30)
                    (not (meeting-scheduled))
                  )
    :effect (and
              (scheduled-at ?t)
              (meeting-scheduled)
              (not (available_a2 ?t))
            )
  )

  ;; Agent 3's action (Helen): requires available according to Agent 3 and unscheduled flag
  (:action schedule-meeting-a3
    :parameters (?t - time)
    :precondition (and
                    (available_a3 ?t)
                    (unscheduled)
                  )
    :effect (and
              (scheduled)
              (scheduled-at ?t)
              (not (unscheduled))
              (not (available_a3 ?t))
            )
  )

  ;; --- Orchestrator action (keeps agents' actions distinct, but enforces a meeting
  ;; that satisfies the combined constraints/preferences) ---
  ;; Rationale: to satisfy all agents' constraints/preferences we require:
  ;;  - the time be available for Agent 1 and Agent 3 (they provided explicit available times)
  ;;  - the time be within business hours and satisfy meeting-duration-30 (Agent 2 constraints)
  ;;  - the time must satisfy Helen's preference (before13_30)
  ;;  - meeting must be currently unscheduled and not already marked meeting-scheduled
  (:action joint-schedule
    :parameters (?t - time)
    :precondition (and
                    (available_a1 ?t)
                    (available_a3 ?t)
                    (within-hours ?t)
                    (meeting-duration-30)
                    (unscheduled)
                    (not (meeting-scheduled))
                    (before13_30 ?t)
                  )
    :effect (and
              (scheduled)
              (scheduled-at ?t)
              (meeting-scheduled)
              (not (unscheduled))
              (not (available_a1 ?t))
              (not (available_a3 ?t))
            )
  )
)