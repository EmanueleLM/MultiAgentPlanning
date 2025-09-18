(define (domain integrated-meeting)
  (:requirements :strips :typing)
  (:types timeslot)

  (:predicates
    ;; Agent-specific availability predicates (keeps agents' actions distinct)
    (a1_available ?t - timeslot)    ;; from agent 1 (used with adjacent)
    (a2_free ?t - timeslot)         ;; from agent 2 (used with next)
    (a3_available ?t - timeslot)    ;; from agent 3 (used with next)

    ;; adjacency relations (agent 1 used "adjacent", agents 2/3 used "next")
    (adjacent ?t1 - timeslot ?t2 - timeslot)
    (next ?t1 - timeslot ?t2 - timeslot)

    ;; per-agent scheduled/confirmed facts
    (scheduled_a1 ?t - timeslot)
    (scheduled_a2 ?t - timeslot)
    (scheduled_a3 ?t - timeslot)

    (proposed ?t1 - timeslot ?t2 - timeslot)
    (confirmed_a1 ?t - timeslot)
    (confirmed_a2 ?t - timeslot)
    (confirmed_a3 ?t - timeslot)

    ;; final meeting facts
    (meeting-scheduled)
    (meeting-start ?t - timeslot)

    ;; negotiation/support flags
    (flexible_a3)
  )

  ;; Agent 1's scheduling action (keeps agent1 action distinct)
  (:action a1_schedule
    :parameters (?t1 ?t2 - timeslot)
    :precondition (and (a1_available ?t1) (a1_available ?t2) (adjacent ?t1 ?t2))
    :effect (and
              (scheduled_a1 ?t1)
              (not (a1_available ?t1))
              (not (a1_available ?t2))
            )
  )

  ;; Agent 2's scheduling action (keeps agent2 action distinct)
  (:action a2_schedule
    :parameters (?s1 ?s2 - timeslot)
    :precondition (and (a2_free ?s1) (a2_free ?s2) (next ?s1 ?s2))
    :effect (and
              (scheduled_a2 ?s1)
              (not (a2_free ?s1))
              (not (a2_free ?s2))
            )
  )

  ;; Agent 3's scheduling action (keeps agent3 action distinct)
  (:action a3_schedule
    :parameters (?t ?t2 - timeslot)
    :precondition (and (a3_available ?t) (a3_available ?t2) (next ?t ?t2))
    :effect (and
              (scheduled_a3 ?t)
              (not (a3_available ?t))
              (not (a3_available ?t2))
            )
  )

  ;; A proposer action: propose a candidate start + next slot (no agent-specific requirement)
  (:action propose_time
    :parameters (?t ?t2 - timeslot)
    :precondition (next ?t ?t2)
    :effect (proposed ?t ?t2)
  )

  ;; Agent confirmations: each agent confirms the proposed window if they are (or become) available.
  (:action a1_confirm
    :parameters (?t ?t2 - timeslot)
    :precondition (and (proposed ?t ?t2) (a1_available ?t) (a1_available ?t2))
    :effect (confirmed_a1 ?t)
  )

  (:action a2_confirm
    :parameters (?t ?t2 - timeslot)
    :precondition (and (proposed ?t ?t2) (a2_free ?t) (a2_free ?t2) (next ?t ?t2))
    :effect (confirmed_a2 ?t)
  )

  (:action a3_confirm
    :parameters (?t ?t2 - timeslot)
    :precondition (and (proposed ?t ?t2) (a3_available ?t) (a3_available ?t2) (next ?t ?t2))
    :effect (confirmed_a3 ?t)
  )

  ;; Agent 3 can reschedule/flex to make two consecutive slots available (allows negotiation)
  ;; This action models that agent 3 is willing to free/reschedule other commitments (flag flexible_a3)
  (:action a3_reschedule
    :parameters (?t ?t2 - timeslot)
    :precondition (flexible_a3)
    :effect (and (a3_available ?t) (a3_available ?t2))
  )

  ;; Finalize: requires all agents to have confirmed the same start slot; then set global meeting
  (:action finalize_meeting
    :parameters (?t ?t2 - timeslot)
    :precondition (and (confirmed_a1 ?t) (confirmed_a2 ?t) (confirmed_a3 ?t) (next ?t ?t2))
    :effect (and (meeting-scheduled) (meeting-start ?t))
  )
)