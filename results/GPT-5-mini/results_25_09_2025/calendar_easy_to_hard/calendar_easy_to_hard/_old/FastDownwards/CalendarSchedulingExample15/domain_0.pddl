(define (domain integrated-scheduling)
  (:requirements :typing :strips)
  (:types slot person meeting)

  ;; Canonical slot declarations are objects in the problem.
  (:predicates
    (slot ?s - slot)
    (slot-available ?s - slot)

    ;; Agent-specific availability predicates to keep each agent's knowledge distinct.
    (free-joyce ?s - slot)
    (free-christine ?s - slot)
    (free-alexander ?s - slot)

    ;; Attendance / meeting object (Joyce domain used a meeting object)
    (meeting ?m - meeting)
    (attends ?p - person ?m - meeting)

    ;; Agent-specific acknowledgement that an agent can accept the meeting at a slot
    (ack-joyce ?m - meeting ?s - slot)
    (ack-christine ?m - meeting ?s - slot)
    (ack-alexander ?m - meeting ?s - slot)

    ;; Final confirmation predicates
    (scheduled ?m - meeting ?s - slot)
    (meeting-confirmed ?m - meeting)
  )

  ;; Joyce's (agent 1) acknowledgement action (keeps Joyce's action distinct).
  (:action acknowledge-joyce
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (attends joyce ?m)
      ;; Joyce's own knowledge of being free for the slot:
      (free-joyce ?s)
    )
    :effect (and
      (ack-joyce ?m ?s)
    )
  )

  ;; Christine's (agent 2) acknowledgement action (keeps Christine's action distinct).
  ;; Modeled after agent-2 semantics: Christine only acknowledges for slots she knows free.
  (:action acknowledge-christine
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (attends christine ?m)
      (free-christine ?s)
    )
    :effect (and
      (ack-christine ?m ?s)
    )
  )

  ;; Alexander's (agent 3) acknowledgement action (keeps Alexander's action distinct).
  ;; Modeled after agent-3 semantics: Alexander only acknowledges for slots he knows free.
  (:action acknowledge-alexander
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (attends alexander ?m)
      (free-alexander ?s)
    )
    :effect (and
      (ack-alexander ?m ?s)
    )
  )

  ;; Finalize/confirm action: requires all three agents to have acknowledged the same slot,
  ;; and the slot to still be available. This action makes the meeting scheduled and confirmed.
  (:action confirm-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (slot-available ?s)
      (ack-joyce ?m ?s)
      (ack-christine ?m ?s)
      (ack-alexander ?m ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (meeting-confirmed ?m)
      (not (slot-available ?s))
    )
  )
)