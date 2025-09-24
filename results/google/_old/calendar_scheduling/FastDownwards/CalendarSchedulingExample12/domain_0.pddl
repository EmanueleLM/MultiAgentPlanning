(define (domain integrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant hour slot time meeting)

  (:predicates
    ;; Agent-1 predicates (hour-granularity)
    (agent1_free ?p - participant ?h - hour)
    (scheduled_by_agent1 ?h - hour)

    ;; Agent-2 predicates (half-hour slots)
    (agent2_free ?p - participant ?s - slot)
    (next ?s - slot ?s2 - slot)
    (scheduled_by_agent2 ?s - slot)

    ;; Agent-3 predicates (time tokens t9..t16)
    (agent3_available ?p - participant ?t - time)
    (unscheduled ?m - meeting)
    (scheduled_by_agent3 ?m - meeting ?t - time)

    ;; Mapping and integrated predicates
    (hour_slots ?h - hour ?s1 - slot ?s2 - slot)  ; maps an hour start to the two consecutive half-hour slots
    (hour_time ?h - hour ?t - time)               ; maps an hour start to a time token (t9..t16)

    ;; Unified availability computed from integrating the three agents' knowledge.
    ;; A participant is "unified_free" at an hour if all known information allows them to attend that hour.
    (unified_free ?p - participant ?h - hour)

    ;; Global goal marker set by any scheduling action that successfully reserves the meeting
    (meeting_planned)
  )

  ;; Distinct scheduling actions for each agent are preserved.
  ;; Each action additionally requires the integrated (unified_free) facts so that any agent's scheduling
  ;; respects the combined knowledge of all agents.
  (:action schedule_by_agent1
    :parameters (?h - hour)
    :precondition (and
      ;; agent-1's own availability requirement
      (agent1_free david ?h) (agent1_free debra ?h) (agent1_free kevin ?h)
      ;; integrated constraint: all participants must be unified-free at that hour
      (unified_free david ?h) (unified_free debra ?h) (unified_free kevin ?h)
    )
    :effect (and
      (meeting_planned)
      (scheduled_by_agent1 ?h)
      ;; mark participants no longer free at that hour in the unified view and agent1 view
      (not (unified_free david ?h)) (not (unified_free debra ?h)) (not (unified_free kevin ?h))
      (not (agent1_free david ?h)) (not (agent1_free debra ?h)) (not (agent1_free kevin ?h))
    )
  )

  (:action schedule_by_agent2
    :parameters (?s1 - slot ?s2 - slot ?h - hour)
    :precondition (and
      (next ?s1 ?s2)
      (hour_slots ?h ?s1 ?s2) ; ensure these two slots correspond to a valid hour start ?h
      ;; agent-2 requires that all participants are free in both half-hour slots
      (agent2_free david ?s1) (agent2_free david ?s2)
      (agent2_free debra ?s1) (agent2_free debra ?s2)
      (agent2_free kevin ?s1) (agent2_free kevin ?s2)
      ;; integrated constraint at hour level
      (unified_free david ?h) (unified_free debra ?h) (unified_free kevin ?h)
    )
    :effect (and
      (meeting_planned)
      (scheduled_by_agent2 ?s1)
      ;; remove half-slot availability and unified availability for that hour
      (not (agent2_free david ?s1)) (not (agent2_free david ?s2))
      (not (agent2_free debra ?s1)) (not (agent2_free debra ?s2))
      (not (agent2_free kevin ?s1)) (not (agent2_free kevin ?s2))
      (not (unified_free david ?h)) (not (unified_free debra ?h)) (not (unified_free kevin ?h))
    )
  )

  (:action schedule_by_agent3
    :parameters (?m - meeting ?h - hour ?t - time ?s1 - slot ?s2 - slot)
    :precondition (and
      (unscheduled ?m)
      (hour_time ?h ?t)
      (hour_slots ?h ?s1 ?s2)
      ;; agent-3's syntactic requirement: all participants must be available at the chosen time token
      (agent3_available david ?t) (agent3_available debra ?t) (agent3_available kevin ?t)
      ;; integrated constraint at hour level
      (unified_free david ?h) (unified_free debra ?h) (unified_free kevin ?h)
    )
    :effect (and
      (meeting_planned)
      (scheduled_by_agent3 ?m ?t)
      (not (unscheduled ?m))
      ;; remove agent3 availability and unified availability
      (not (agent3_available david ?t)) (not (agent3_available debra ?t)) (not (agent3_available kevin ?t))
      (not (unified_free david ?h)) (not (unified_free debra ?h)) (not (unified_free kevin ?h))
    )
  )
)