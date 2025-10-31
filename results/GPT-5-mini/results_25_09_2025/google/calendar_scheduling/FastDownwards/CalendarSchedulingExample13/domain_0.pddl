(define (domain multi-agent-scheduling)
  (:requirements :strips)
  (:predicates
    (slot ?s)
    ;; availability per agent (kept distinct)
    (free-gerald ?s)
    (free-roy ?s)
    (free-barbara ?s)
    ;; per-agent agreement actions (kept distinct)
    (agreed-gerald ?s)
    (agreed-roy ?s)
    (agreed-barbara ?s)
    ;; meeting result
    (meeting-scheduled)
    (meeting-at ?s)
    ;; declarative preference information (soft / not enforced)
    (preferred-gerald ?s)
    ;; public facts
    (meeting-duration-30)
    (meeting-day-monday)
  )

  ;; Gerald indicates he can accept a specific 30-min slot if free for him
  (:action gerald-accept
    :parameters (?s)
    :precondition (and (slot ?s) (free-gerald ?s))
    :effect (and (agreed-gerald ?s))
  )

  ;; Roy indicates he can accept a specific 30-min slot if free for him
  (:action roy-accept
    :parameters (?s)
    :precondition (and (slot ?s) (free-roy ?s))
    :effect (and (agreed-roy ?s))
  )

  ;; Barbara indicates she can accept a specific 30-min slot if free for her
  (:action barbara-accept
    :parameters (?s)
    :precondition (and (slot ?s) (free-barbara ?s))
    :effect (and (agreed-barbara ?s))
  )

  ;; Finalize meeting at a slot when all three agents have agreed on the same slot.
  ;; (No negative preconditions used; action can be applied when its preconditions hold.)
  (:action finalize-meeting
    :parameters (?s)
    :precondition (and (slot ?s) (agreed-gerald ?s) (agreed-roy ?s) (agreed-barbara ?s))
    :effect (and (meeting-scheduled) (meeting-at ?s))
  )
)