(define (domain multiagent-scheduling)
  (:requirements :strips :typing)
  (:types time)

  ;; Agent-specific availability predicates (namespaced)
  (:predicates
    (scott_free ?t - time)
    (scott_ok ?t - time)

    (gabriel_free ?t - time)
    (gabriel_ok ?t - time)

    (christine_free ?t - time)
    (christine_ok ?t - time)

    ;; Global scheduling state
    (meeting_scheduled)
    (meeting_at ?t - time)
  )

  ;; Each agent must "confirm" a slot they are free for (namespaced actions).
  (:action scott_confirm
    :parameters (?t - time)
    :precondition (scott_free ?t)
    :effect (scott_ok ?t)
  )

  (:action gabriel_confirm
    :parameters (?t - time)
    :precondition (gabriel_free ?t)
    :effect (gabriel_ok ?t)
  )

  (:action christine_confirm
    :parameters (?t - time)
    :precondition (christine_free ?t)
    :effect (christine_ok ?t)
  )

  ;; Finalize the meeting once all agents have confirmed the same slot.
  (:action scheduler_finalize
    :parameters (?t - time)
    :precondition (and (scott_ok ?t) (gabriel_ok ?t) (christine_ok ?t))
    :effect (and (meeting_scheduled) (meeting_at ?t))
  )
)