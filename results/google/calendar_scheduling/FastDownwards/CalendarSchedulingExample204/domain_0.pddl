tags). It models 30-minute slots and uses distinct "attend" actions parameterized per agent so the produced plan will explicitly show each participant's attend action.

<domain>
(define (domain meeting-scheduling)
  (:requirements :typing :strips)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)      ; agent is free in slot
    (meeting-at ?s - slot)          ; meeting is scheduled at slot
    (attends ?a - agent ?s - slot)  ; agent a attends meeting at slot
    (unscheduled)                   ; there is no scheduled meeting yet
  )

  ; Schedule a meeting in a chosen slot (must be done once)
  ; The action sets the meeting-at ?s; attend actions by agents will follow.
  (:action schedule
    :parameters (?s - slot)
    :precondition (unscheduled)
    :effect (and
              (not (unscheduled))
              (meeting-at ?s)
            )
  )

  ; Individual agent attends the meeting in that slot if they are free then.
  ; This keeps agent-specific attendance actions distinct in the plan.
  (:action attend
    :parameters (?a - agent ?s - slot)
    :precondition (and
                    (meeting-at ?s)
                    (free ?a ?s)
                  )
    :effect (and
              (attends ?a ?s)
              (not (free ?a ?s))
            )
  )
)