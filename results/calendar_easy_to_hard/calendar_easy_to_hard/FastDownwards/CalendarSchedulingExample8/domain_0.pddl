(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent slot)

  (:predicates
    (slot ?s - slot)
    (agent ?a - agent)
    (available ?a - agent ?s - slot)        ; agent ?a is available at slot ?s
    (agreed ?a - agent ?s - slot)           ; agent ?a agreed to slot ?s
    (meeting-scheduled ?s - slot)           ; meeting finalized at slot ?s
    (day ?d)                                ; day facts (informational)
    (meeting-duration ?n)                   ; meeting duration in minutes (informational)
  )

  ;; Each agent has its own "agree" action (keeps actions distinct per agent).
  (:action adam-agree
    :parameters (?s - slot)
    :precondition (available adam ?s)
    :effect (agreed adam ?s)
  )

  (:action jerry-agree
    :parameters (?s - slot)
    :precondition (available jerry ?s)
    :effect (agreed jerry ?s)
  )

  (:action matthew-agree
    :parameters (?s - slot)
    :precondition (available matthew ?s)
    :effect (agreed matthew ?s)
  )

  ;; Finalize the meeting only when all three agents have agreed to the same slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and (agreed adam ?s) (agreed jerry ?s) (agreed matthew ?s))
    :effect (meeting-scheduled ?s)
  )
)