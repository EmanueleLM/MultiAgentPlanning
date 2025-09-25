(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (agent ?a - agent)
    (slot ?s - slot)
    (available ?a - agent ?s - slot)
    (agreed ?a - agent ?s - slot)
    (meeting-scheduled)
  )

  ;; Actions distinct per agent for recording agreement on a slot
  (:action agree-kathryn
    :parameters (?s - slot)
    :precondition (available kathryn ?s)
    :effect (agreed kathryn ?s)
  )

  (:action agree-charlotte
    :parameters (?s - slot)
    :precondition (available charlotte ?s)
    :effect (agreed charlotte ?s)
  )

  (:action agree-lauren
    :parameters (?s - slot)
    :precondition (available lauren ?s)
    :effect (agreed lauren ?s)
  )

  ;; Finalize the meeting when all three have agreed on the same slot
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and (agreed kathryn ?s) (agreed charlotte ?s) (agreed lauren ?s))
    :effect (meeting-scheduled)
  )
)