(define (domain orchestrated-meeting)
  (:requirements :strips :negative-preconditions :typing)
  (:types slot1 slot2 slot3 cslot)

  (:predicates
    ;; mapping from each agent's slot names to canonical cslot
    (maps1 ?s - slot1 ?c - cslot)
    (maps2 ?s - slot2 ?c - cslot)
    (maps3 ?s - slot3 ?c - cslot)

    ;; Agent 1 predicates (from agent 1's knowledge)
    (a1_work ?s - slot1)
    (a1_busy ?s - slot1)

    ;; Agent 2 predicates (from agent 2's knowledge)
    (a2_free ?s - slot2)

    ;; Agent 3 predicates (from agent 3's knowledge)
    (a3_free ?s - slot3)
    (a3_within ?s - slot3)

    ;; canonical adjacency between canonical slots (30-min successors)
    (cnext ?c ?c2 - cslot)

    ;; per-agent scheduling recorded on canonical start slot
    (scheduled_a1 ?c - cslot)
    (scheduled_a2 ?c - cslot)
    (scheduled_a3 ?c - cslot)

    ;; final global flag (meeting agreed by all)
    (global_scheduled)
  )

  ;; Agent 1 schedules using its own slot names, but maps to canonical slots to ensure alignment
  (:action schedule_agent1
    :parameters (?s - slot1 ?s2 - slot1 ?c - cslot ?c2 - cslot)
    :precondition (and
      (maps1 ?s ?c)
      (maps1 ?s2 ?c2)
      (cnext ?c ?c2)
      (a1_work ?s)
      (a1_work ?s2)
      (not (a1_busy ?s))
      (not (a1_busy ?s2))
    )
    :effect (and
      (scheduled_a1 ?c)
    )
  )

  ;; Agent 2 schedules using its own slot names, maps to canonical slots
  (:action schedule_agent2
    :parameters (?s - slot2 ?s2 - slot2 ?c - cslot ?c2 - cslot)
    :precondition (and
      (maps2 ?s ?c)
      (maps2 ?s2 ?c2)
      (cnext ?c ?c2)
      (a2_free ?s)
      (a2_free ?s2)
    )
    :effect (and
      (scheduled_a2 ?c)
      (not (a2_free ?s))
      (not (a2_free ?s2))
    )
  )

  ;; Agent 3 schedules using its own slot names, maps to canonical slots
  (:action schedule_agent3
    :parameters (?s - slot3 ?s2 - slot3 ?c - cslot ?c2 - cslot)
    :precondition (and
      (maps3 ?s ?c)
      (maps3 ?s2 ?c2)
      (cnext ?c ?c2)
      (a3_within ?s)
      (a3_within ?s2)
      (a3_free ?s)
      (a3_free ?s2)
    )
    :effect (and
      (scheduled_a3 ?c)
      (not (a3_free ?s))
      (not (a3_free ?s2))
    )
  )

  ;; Final orchestration: require all three agents to have scheduled the same canonical start slot
  (:action finalize_meeting
    :parameters (?c - cslot)
    :precondition (and
      (scheduled_a1 ?c)
      (scheduled_a2 ?c)
      (scheduled_a3 ?c)
    )
    :effect (and
      (global_scheduled)
    )
  )
)