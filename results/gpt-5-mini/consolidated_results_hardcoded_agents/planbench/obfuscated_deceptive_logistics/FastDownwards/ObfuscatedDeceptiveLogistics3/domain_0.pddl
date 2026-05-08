(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types orchestrator worker task phase)

  (:predicates
    ;; availability
    (available-orch ?o - orchestrator)
    (available-worker ?w - worker)

    ;; assignment and execution
    (assigned ?t - task ?w - worker)
    (in-progress ?t - task)
    (working-on ?w - worker ?t - task)

    ;; task/state relations
    (task-done ?t - task)
    (task-first ?t - task)
    (task-predecessor ?pred - task ?t - task)
    (task-in-phase ?t - task ?ph - phase)

    ;; phase sequencing and terminal facts
    (phase-active ?ph - phase)
    (phase-done ?ph - phase)
    (phase-next ?p1 - phase ?p2 - phase)
    (phase-last-task ?ph - phase ?t - task)
    (phase-final ?ph - phase)
  )

  ;; Orchestrator assigns a specific worker to a specific task in the currently active phase.
  (:action orchestrator-assign-task
    :parameters (?o - orchestrator ?w - worker ?t - task ?ph - phase)
    :precondition (and
                    (available-orch ?o)
                    (available-worker ?w)
                    (task-in-phase ?t ?ph)
                    (phase-active ?ph)
                    (not (task-done ?t))
                    (not (assigned ?t ?w))
                  )
    :effect (and
              (assigned ?t ?w)
              (not (available-worker ?w))
            )
  )

  ;; Worker starts a task that is defined as the first task in its phase.
  (:action worker-start-first-task
    :parameters (?w - worker ?t - task ?ph - phase)
    :precondition (and
                    (assigned ?t ?w)
                    (task-first ?t)
                    (task-in-phase ?t ?ph)
                    (phase-active ?ph)
                    (not (in-progress ?t))
                  )
    :effect (and
              (in-progress ?t)
              (working-on ?w ?t)
              (not (assigned ?t ?w))
            )
  )

  ;; Worker starts a task whose predecessor task has been completed.
  (:action worker-start-following-task
    :parameters (?w - worker ?pred - task ?t - task ?ph - phase)
    :precondition (and
                    (assigned ?t ?w)
                    (task-predecessor ?pred ?t)
                    (task-done ?pred)
                    (task-in-phase ?t ?ph)
                    (phase-active ?ph)
                    (not (in-progress ?t))
                  )
    :effect (and
              (in-progress ?t)
              (working-on ?w ?t)
              (not (assigned ?t ?w))
            )
  )

  ;; Worker completes a task they are working on. Worker becomes available again.
  (:action worker-complete-task
    :parameters (?w - worker ?t - task ?ph - phase)
    :precondition (and
                    (in-progress ?t)
                    (working-on ?w ?t)
                    (task-in-phase ?t ?ph)
                    (phase-active ?ph)
                  )
    :effect (and
              (task-done ?t)
              (not (in-progress ?t))
              (not (working-on ?w ?t))
              (available-worker ?w)
            )
  )

  ;; Orchestrator finishes a phase and activates its successor phase.
  (:action orchestrator-finish-phase-with-next
    :parameters (?o - orchestrator ?ph - phase ?next - phase ?lastt - task)
    :precondition (and
                    (available-orch ?o)
                    (phase-active ?ph)
                    (phase-next ?ph ?next)
                    (phase-last-task ?ph ?lastt)
                    (task-done ?lastt)
                  )
    :effect (and
              (phase-done ?ph)
              (not (phase-active ?ph))
              (phase-active ?next)
            )
  )

  ;; Orchestrator finishes the final phase (no successor).
  (:action orchestrator-finish-final-phase
    :parameters (?o - orchestrator ?ph - phase ?lastt - task)
    :precondition (and
                    (available-orch ?o)
                    (phase-active ?ph)
                    (phase-final ?ph)
                    (phase-last-task ?ph ?lastt)
                    (task-done ?lastt)
                  )
    :effect (and
              (phase-done ?ph)
              (not (phase-active ?ph))
            )
  )
)