(define (domain meeting-scheduling)
  (:requirements :typing :adl)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)         ; agent a is free at slot s
    (attends ?a - agent ?s - slot)      ; agent a will attend meeting at slot s
    (meeting-scheduled ?s - slot)       ; meeting has been scheduled at slot s
  )

  ;; Each agent can declare attendance at a slot if they are free then.
  ;; Attendance actions are parameterized by agent so that grounded actions
  ;; in the plan clearly show which agent attends which slot.
  (:action attend
    :parameters (?a - agent ?s - slot)
    :precondition (free ?a ?s)
    :effect (and
              (attends ?a ?s)
              (not (free ?a ?s))
            )
  )

  ;; Schedule the meeting at slot ?s only if every agent attends ?s.
  ;; Uses a universal precondition so the single scheduling action's precondition
  ;; explicitly requires attendance from all agents (keeps agent-specific constraints distinct).
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
                    (forall (?a - agent) (attends ?a ?s))
                  )
    :effect (meeting-scheduled ?s)
  )
)