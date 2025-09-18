(define (domain meeting-orchestration)
  (:requirements :strips :typing)
  (:types slot)

  (:predicates
    ;; time topology
    (next ?s1 ?s2 - slot)

    ;; per-agent availability predicates (keep agents' actions distinct)
    (free-a1 ?s - slot)    ; availability according to agent 1
    (free-a2 ?s - slot)    ; availability according to agent 2
    (free-a3 ?s - slot)    ; availability according to agent 3

    ;; per-agent meeting markers (created when that agent "accepts" scheduling)
    (meeting-a1 ?s - slot)
    (meeting-start-a1 ?s - slot)

    (meeting-a2 ?s - slot)
    (meeting-start-a2 ?s - slot)

    (meeting-a3 ?s - slot)
    (meeting-start-a3 ?s - slot)

    ;; final orchestrated outcome
    (scheduled-global)
  )

  ;; Agent 1's scheduling action (keeps their action distinct)
  (:action schedule-agent1
    :parameters (?s ?t - slot)
    :precondition (and (next ?s ?t) (free-a1 ?s) (free-a1 ?t))
    :effect (and
      (not (free-a1 ?s)) (not (free-a1 ?t))
      (meeting-a1 ?s) (meeting-start-a1 ?s)
    )
  )

  ;; Agent 2's scheduling action (keeps their action distinct)
  (:action schedule-agent2
    :parameters (?s ?t - slot)
    :precondition (and (next ?s ?t) (free-a2 ?s) (free-a2 ?t))
    :effect (and
      (not (free-a2 ?s)) (not (free-a2 ?t))
      (meeting-a2 ?s) (meeting-start-a2 ?s)
    )
  )

  ;; Agent 3's scheduling action (keeps their action distinct)
  (:action schedule-agent3
    :parameters (?s ?t - slot)
    :precondition (and (next ?s ?t) (free-a3 ?s) (free-a3 ?t))
    :effect (and
      (not (free-a3 ?s)) (not (free-a3 ?t))
      (meeting-a3 ?s) (meeting-start-a3 ?s)
    )
  )

  ;; Coordinator/orchestrator action: finalize the meeting once all agents agree on same start slot
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (meeting-start-a1 ?s) (meeting-start-a2 ?s) (meeting-start-a3 ?s))
    :effect (scheduled-global)
  )
)