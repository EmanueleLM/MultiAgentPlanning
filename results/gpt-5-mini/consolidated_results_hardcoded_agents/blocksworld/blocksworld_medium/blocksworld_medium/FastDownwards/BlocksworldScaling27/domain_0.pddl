(define (domain orchestration)
  :requirements :strips :typing :negative-preconditions
  :types agent task phase location

  :predicates
    ;; Task lifecycle and ownership
    (task-assigned ?t - task ?p - phase)
    (task-started ?t - task)
    (in-progress ?t - task)
    (task-finished ?t - task)
    (owner ?t - task ?a - agent)

    ;; Phase sequencing
    (current-phase ?p - phase)
    (next ?p - phase ?q - phase)

    ;; Locations and movement
    (at ?a - agent ?l - location)
    (adjacent ?l - location ?m - location)

    ;; Task location requirement
    (task-required-location ?t - task ?l - location)
  )

  ;; Move an agent along adjacent locations
  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and (at ?a ?from) (adjacent ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  ;; Start a task: must be in its assigned phase and at required location.
  ;; Records owner and marks in-progress.
  (:action start-task
    :parameters (?a - agent ?t - task ?p - phase ?l - location)
    :precondition (and
                    (task-assigned ?t ?p)
                    (current-phase ?p)
                    (at ?a ?l)
                    (task-required-location ?t ?l)
                    (not (task-started ?t))
                    (not (task-finished ?t))
                  )
    :effect (and
              (task-started ?t)
              (in-progress ?t)
              (owner ?t ?a)
            )
  )

  ;; Finish a task: same agent who started it must finish it, and it must be in the same phase.
  (:action finish-task
    :parameters (?a - agent ?t - task ?p - phase ?l - location)
    :precondition (and
                    (owner ?t ?a)
                    (in-progress ?t)
                    (at ?a ?l)
                    (task-assigned ?t ?p)
                    (current-phase ?p)
                  )
    :effect (and
              (task-finished ?t)
              (not (in-progress ?t))
              (not (task-started ?t))
            )
  )

  ;; Advance from one phase to its immediate successor; enforces contiguity.
  (:action advance-phase
    :parameters (?p - phase ?next - phase)
    :precondition (and (current-phase ?p) (next ?p ?next))
    :effect (and (not (current-phase ?p)) (current-phase ?next))
  )
)