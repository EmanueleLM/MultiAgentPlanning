(define (domain integrated-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot day)

  ;; Agent 1 (scott) predicates/actions (namespaced with a1_)
  (:predicates
    (a1_available ?p - person ?s - slot)    ; Agent1: participant available at slot
    (a1_slot ?s - slot)                     ; Agent1: slot identifier (work hours as known to agent1)
    (a1_occupied ?s - slot)                 ; Agent1: slot taken by meeting (per agent1)
    (a1_meeting_scheduled)                  ; Agent1: meeting scheduled (agent1's view)
  )

  (:action a1_schedule
    :parameters (?p - person ?s - slot)
    :precondition (and (a1_available ?p ?s) (a1_slot ?s))
    :effect (and
              (a1_meeting_scheduled)
              (a1_occupied ?s)
              (not (a1_available ?p ?s))
            )
  )

  ;; Agent 2 predicates/actions (namespaced with a2_)
  (:predicates
    (a2_slot_of ?s - slot ?d - day)   ; Agent2: timeslot belongs to a day
    (a2_work_hour ?s - slot)          ; Agent2: timeslot is within work hours
    (a2_scheduled ?s - slot)          ; Agent2: meeting scheduled at this timeslot (agent2's view)
    (a2_no_meetings ?d - day)         ; Agent2: "no meetings" constraint for a day
  )

  (:action a2_schedule_meeting
    :parameters (?s - slot ?d - day)
    :precondition (and
                    (a2_slot_of ?s ?d)
                    (a2_work_hour ?s)
                    (not (a2_no_meetings ?d))   ; agent2's constraint (if present)
                    (not (a2_scheduled ?s))
                  )
    :effect (and
              (a2_scheduled ?s)
            )
  )

  ;; Agent 3 predicates/actions (namespaced with a3_)
  (:predicates
    (a3_slot ?s - slot)               ; Agent3: valid slot identifiers (agent3's view)
    (a3_busy ?s - slot)               ; Agent3: slot is busy (unavailable) for agent3
    (a3_scheduled ?s - slot)          ; Agent3: meeting scheduled at this slot (agent3's view)
    (a3_meeting_scheduled)            ; Agent3: meeting scheduled (agent3's view, ensures only one)
  )

  (:action a3_schedule
    :parameters (?s - slot)
    :precondition (and
                    (a3_slot ?s)
                    (not (a3_busy ?s))
                    (not (a3_scheduled ?s))
                    (not (a3_meeting_scheduled))
                  )
    :effect (and
              (a3_scheduled ?s)
              (a3_meeting_scheduled)
            )
  )

  ;; Orchestrator action (combines the agents' knowledge to schedule a meeting that fits all)
  ;; Namespaced as orchestrator_ to remain distinct from agents' actions/predicates.
  (:predicates
    (orchestrator_confirmed ?s - slot)   ; orchestrator: confirmation that slot is chosen
  )

  (:action orchestrator_schedule
    :parameters (?p - person ?s - slot ?d - day)
    :precondition (and
                    ;; the timeslot belongs to the requested day and is a work hour (agent2 public info)
                    (a2_slot_of ?s ?d)
                    (a2_work_hour ?s)

                    ;; agent1 (scott) must be available at the slot
                    (a1_available ?p ?s)

                    ;; agent3 must not be busy at the slot
                    (a3_slot ?s)
                    (not (a3_busy ?s))

                    ;; slot must not already be recorded as scheduled/occupied in any agent's view
                    (not (a1_occupied ?s))
                    (not (a2_scheduled ?s))
                    (not (a3_scheduled ?s))

                    ;; avoid double-scheduling from agent1/agent3 perspectives
                    (not (a1_meeting_scheduled))
                    (not (a3_meeting_scheduled))
                  )
    :effect (and
              ;; mark the meeting scheduled in each agent's viewpoint
              (a1_meeting_scheduled)
              (a1_occupied ?s)
              (not (a1_available ?p ?s))

              (a2_scheduled ?s)

              (a3_scheduled ?s)
              (a3_meeting_scheduled)

              (orchestrator_confirmed ?s)
            )
  )
)