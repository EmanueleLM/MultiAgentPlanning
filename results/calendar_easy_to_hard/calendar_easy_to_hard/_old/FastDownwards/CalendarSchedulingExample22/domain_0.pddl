(define (domain multiagent-meeting)
  (:requirements :strips :typing)
  (:types slot)

  (:predicates
    ;; global temporal adjacency (30-min increments)
    (next ?s - slot ?t - slot)        ;; used by agent1 and agent3
    (consecutive ?s - slot ?t - slot) ;; used by agent2 (mirrors next)

    ;; agent-specific availability predicates (keeps agents' actions distinct)
    (available_a1 ?s - slot)  ;; agent1's "available"
    (free_a2 ?s - slot)       ;; agent2's "free"
    (free_a3 ?s - slot)       ;; agent3's "free"

    ;; proposal/coordination predicates
    (proposed ?s - slot)

    ;; per-agent confirmation that they accept the proposed meeting
    (meeting_scheduled_a1)
    (meeting_scheduled_a2)
    (meeting_scheduled_a3)
  )

  ;; Agent 1: uses 'next' and 'available'
  (:action propose_a1
    :parameters (?s - slot ?t - slot)
    :precondition (and (available_a1 ?s) (available_a1 ?t) (next ?s ?t))
    :effect (proposed ?s)
  )

  (:action confirm_a1
    :parameters (?s - slot ?t - slot)
    :precondition (and (proposed ?s) (available_a1 ?s) (available_a1 ?t) (next ?s ?t))
    :effect (and
              (meeting_scheduled_a1)
              (not (available_a1 ?s))
              (not (available_a1 ?t))
            )
  )

  ;; Agent 2: uses 'consecutive' and 'free_a2'
  (:action propose_a2
    :parameters (?s - slot ?n - slot)
    :precondition (and (free_a2 ?s) (free_a2 ?n) (consecutive ?s ?n))
    :effect (proposed ?s)
  )

  (:action confirm_a2
    :parameters (?s - slot ?n - slot)
    :precondition (and (proposed ?s) (free_a2 ?s) (free_a2 ?n) (consecutive ?s ?n))
    :effect (and
              (meeting_scheduled_a2)
              (not (free_a2 ?s))
              (not (free_a2 ?n))
            )
  )

  ;; Agent 3: uses 'next' and 'free_a3'
  (:action propose_a3
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and (free_a3 ?s1) (free_a3 ?s2) (next ?s1 ?s2))
    :effect (proposed ?s1)
  )

  (:action confirm_a3
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and (proposed ?s1) (free_a3 ?s1) (free_a3 ?s2) (next ?s1 ?s2))
    :effect (and
              (meeting_scheduled_a3)
              (not (free_a3 ?s1))
              (not (free_a3 ?s2))
            )
  )
)