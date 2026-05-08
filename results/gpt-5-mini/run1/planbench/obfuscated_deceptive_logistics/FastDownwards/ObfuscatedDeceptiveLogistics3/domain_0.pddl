(define (domain orchestrator)
  :requirements :strips :typing :negative-preconditions
  :types agent task phase

  ;; Canonical object set declared as domain constants so domain actions may refer to them directly.
  ;; These constants are the canonical agents, tasks and phases for the integrated problem.
  :constants
    a1 a2 - agent
    t1 t2 t3 - task
    p1 p2 - phase

  :predicates
    ;; Task/phase membership and status
    (task-in-phase ?t - task ?p - phase)
    (task-unassigned ?t - task)
    (task-assigned ?t - task ?a - agent)
    (task-started ?t - task)
    (task-completed ?t - task)

    ;; Phase control and ordering
    (phase-active ?p - phase)
    (phase-done ?p - phase)
    (phase-next ?p1 - phase ?p2 - phase)

    ;; Agent availability and busy flags are indexed by phase to enforce per-phase usage constraints
    (agent-available ?a - agent ?p - phase)
    (agent-busy ?a - agent ?p - phase)
  )

  ;; Assign a free agent to an unassigned task in the currently active phase.
  (define (action assign-task)
    :parameters (?t - task ?a - agent ?p - phase)
    :precondition (and
                    (task-in-phase ?t ?p)
                    (phase-active ?p)
                    (task-unassigned ?t)
                    (agent-available ?a ?p)
                   )
    :effect (and
              (not (task-unassigned ?t))
              (task-assigned ?t ?a)
              (agent-busy ?a ?p)
              (not (agent-available ?a ?p))
            )
  )

  ;; Start execution of a task that has been assigned to an agent while the phase is active.
  (define (action start-task)
    :parameters (?t - task ?a - agent ?p - phase)
    :precondition (and
                    (task-assigned ?t ?a)
                    (task-in-phase ?t ?p)
                    (phase-active ?p)
                    (not (task-started ?t))
                  )
    :effect (and
              (task-started ?t)
            )
  )

  ;; Finish a started task: mark it completed, free the agent for the same phase,
  ;; and remove assignment and started flags. This action enforces that the agent that
  ;; completes the task is the one that was assigned.
  (define (action finish-task)
    :parameters (?t - task ?a - agent ?p - phase)
    :precondition (and
                    (task-started ?t)
                    (task-assigned ?t ?a)
                    (task-in-phase ?t ?p)
                    (agent-busy ?a ?p)
                  )
    :effect (and
              (task-completed ?t)
              (not (task-started ?t))
              (not (task-assigned ?t ?a))
              (agent-available ?a ?p)
              (not (agent-busy ?a ?p))
            )
  )

  ;; Advance the workflow from phase p1 to its explicitly declared successor p2.
  ;; This domain is integrated with the canonical object set: this action advances from p1 to p2
  ;; only when all tasks assigned to p1 are completed. By listing the required completed tasks
  ;; here we enforce the ordering as a hard constraint (no post-hoc penalty actions).
  ;; The action below advances p1 -> p2 when t1 (the task in p1) is completed.
  (define (action advance-p1-to-p2)
    :parameters ()
    :precondition (and
                    (phase-active p1)
                    (task-completed t1)
                  )
    :effect (and
              (not (phase-active p1))
              (phase-done p1)
              (phase-active p2)
            )
  )

  ;; (Optional) If additional explicit forward transitions are required, they must be added
  ;; similarly and list all tasks that must be completed in the source phase. This enforces
  ;; contiguity and prohibits reordering across phases.
)