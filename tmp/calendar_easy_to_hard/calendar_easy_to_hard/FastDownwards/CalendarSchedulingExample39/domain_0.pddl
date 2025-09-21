(define (domain meeting-scheduling-integrated)
  (:requirements :strips :typing)
  (:types participant slot meeting)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (meeting ?m - meeting)

    ;; unified availability predicate (free == available)
    (free ?p - participant ?s - slot)

    ;; meeting has been scheduled at a slot
    (scheduled ?m - meeting ?s - slot)

    ;; optional predicates used by agent-specific actions
    (included ?m - meeting ?p - participant)
    (proposed ?m - meeting ?s - slot)
  )

  ;; Agent-specific actions (kept distinct). These reflect each agent's local
  ;; capability to propose/confirm availability. They are optional helpers;
  ;; the planner can still use the coordinator action to finalize scheduling.
  (:action nicholas_propose
    :parameters (?m - meeting ?s - slot)
    :precondition (and (meeting ?m) (slot ?s) (free nicholas ?s))
    :effect (and (proposed ?m ?s) (included ?m nicholas))
  )

  (:action emma_propose
    :parameters (?m - meeting ?s - slot)
    :precondition (and (meeting ?m) (slot ?s) (free emma ?s))
    :effect (and (proposed ?m ?s) (included ?m emma))
  )

  (:action catherine_propose
    :parameters (?m - meeting ?s - slot)
    :precondition (and (meeting ?m) (slot ?s) (free catherine ?s))
    :effect (and (proposed ?m ?s) (included ?m catherine))
  )

  (:action steven_propose
    :parameters (?m - meeting ?s - slot)
    :precondition (and (meeting ?m) (slot ?s) (free steven ?s))
    :effect (and (proposed ?m ?s) (included ?m steven))
  )

  (:action adam_propose
    :parameters (?m - meeting ?s - slot)
    :precondition (and (meeting ?m) (slot ?s) (free adam ?s))
    :effect (and (proposed ?m ?s) (included ?m adam))
  )

  (:action lori_propose
    :parameters (?m - meeting ?s - slot)
    :precondition (and (meeting ?m) (slot ?s) (free lori ?s))
    :effect (and (proposed ?m ?s) (included ?m lori))
  )

  ;; Coordinator / integrator action: finalize scheduling if all participants are free.
  ;; This action encodes the global requirement "meeting with all participants".
  (:action schedule_all_participants
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (free nicholas ?s)
      (free emma ?s)
      (free catherine ?s)
      (free steven ?s)
      (free adam ?s)
      (free lori ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      ;; optionally mark all included (useful for tracing)
      (included ?m nicholas) (included ?m emma) (included ?m catherine)
      (included ?m steven) (included ?m adam) (included ?m lori)
    )
  )
)