(define (domain multiagent-phased-tasks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task phase)

  (:predicates
    ;; the current phase (state) of a task
    (task-phase ?task - task ?phase - phase)
    ;; successor relation between phases (explicit ordering)
    (next ?from - phase ?to - phase)
    ;; status fluents set once the corresponding phase action has occurred
    (prepared ?task - task)
    (executed ?task - task)
    (verified ?task - task)
  )

  ;; Agent A prepares a task, moving it one step forward along the phase ordering.
  ;; Requires the task to be exactly at the predecessor phase and not yet prepared.
  (:action agentA-prepare
    :parameters (?task - task ?from - phase ?to - phase)
    :precondition (and
                    (task-phase ?task ?from)
                    (next ?from ?to)
                    (not (prepared ?task))
                  )
    :effect (and
              ;; move the task forward one phase
              (not (task-phase ?task ?from))
              (task-phase ?task ?to)
              ;; mark prepared so it cannot be prepared twice
              (prepared ?task)
            )
  )

  ;; Agent A executes a task, moving it one step forward along the phase ordering.
  ;; Requires the task to be at the immediate predecessor phase and to have been prepared.
  (:action agentA-execute
    :parameters (?task - task ?from - phase ?to - phase)
    :precondition (and
                    (task-phase ?task ?from)
                    (next ?from ?to)
                    (prepared ?task)
                    (not (executed ?task))
                  )
    :effect (and
              (not (task-phase ?task ?from))
              (task-phase ?task ?to)
              (executed ?task)
            )
  )

  ;; Agent B verifies a task, moving it one step forward along the phase ordering.
  ;; Requires the task be at the immediate predecessor phase and to have been executed.
  (:action agentB-verify
    :parameters (?task - task ?from - phase ?to - phase)
    :precondition (and
                    (task-phase ?task ?from)
                    (next ?from ?to)
                    (executed ?task)
                    (not (verified ?task))
                  )
    :effect (and
              (not (task-phase ?task ?from))
              (task-phase ?task ?to)
              (verified ?task)
            )
  )
)