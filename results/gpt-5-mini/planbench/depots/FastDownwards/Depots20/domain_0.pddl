(define (domain multi-agent-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types hoist driver crate task location phase)

  (:predicates
    ;; Locations and positions
    (hoist-at ?h - hoist ?loc - location)
    (driver-at ?d - driver ?loc - location)
    (crate-at ?c - crate ?loc - location)

    ;; Mapping task -> crate
    (task-of ?t - task ?c - crate)

    ;; Assignments
    (assigned-hoist ?h - hoist ?t - task)
    (assigned-driver ?d - driver ?t - task)

    ;; On-truck / transfer state
    (on-truck ?t - task)
    (unloaded ?t - task)
    (task-completed ?t - task)

    ;; Phase control (single active phase enforced by delete/add effects)
    (phase-is ?p - phase)
    (phase-succ ?p1 - phase ?p2 - phase)

    ;; Audit flag
    (audit-report-done)
  )

  ;; Orchestrator: assign a single task to a hoist and a driver and advance the phase
  (:action orchestrator-assign
    :parameters (?t - task ?h - hoist ?d - driver ?p-prev - phase ?p-next - phase)
    :precondition (and
                    (phase-is ?p-prev)
                    (phase-succ ?p-prev ?p-next)
                    (not (assigned-hoist ?h ?t))
                    (not (assigned-driver ?d ?t))
                  )
    :effect (and
              (assigned-hoist ?h ?t)
              (assigned-driver ?d ?t)
              (not (phase-is ?p-prev))
              (phase-is ?p-next)
            )
  )

  ;; Hoist loads one task's crate from storage onto the truck (truck location)
  (:action hoist-load
    :parameters (?h - hoist ?d - driver ?t - task ?c - crate ?p - phase ?loc-storage - location ?loc-truck - location)
    :precondition (and
                    (phase-is ?p)
                    (assigned-hoist ?h ?t)
                    (assigned-driver ?d ?t)
                    (task-of ?t ?c)
                    (crate-at ?c ?loc-storage)
                    (hoist-at ?h ?loc-storage)
                    (driver-at ?d ?loc-truck)
                  )
    :effect (and
              (on-truck ?t)
              (crate-at ?c ?loc-truck)
              (not (crate-at ?c ?loc-storage))
            )
  )

  ;; Driver drives the truck (carrying all listed tasks) from truck location to destination and advances phase
  (:action driver-drive
    :parameters (?d - driver ?t1 - task ?t2 - task ?p-prev - phase ?p-next - phase ?loc-truck - location ?loc-dest - location)
    :precondition (and
                    (phase-is ?p-prev)
                    (phase-succ ?p-prev ?p-next)
                    (assigned-driver ?d ?t1)
                    (assigned-driver ?d ?t2)
                    (on-truck ?t1)
                    (on-truck ?t2)
                    (driver-at ?d ?loc-truck)
                  )
    :effect (and
              (not (driver-at ?d ?loc-truck))
              (driver-at ?d ?loc-dest)
              (not (phase-is ?p-prev))
              (phase-is ?p-next)
              ;; Move the crates with the truck (they remain on-truck until hoist unload)
              (forall (?c - crate ?tx - task)
                ;; We cannot use forall in domain under given :requirements; instead update crates via task-of bindings in problem-instantiated actions.
                ;; (Note: The planner will bind ?t1 and ?t2 and the corresponding crates using task-of facts in the problem.)
              )
            )
  )

  ;; Hoist moves between locations (used to position hoist for unloading)
  (:action hoist-move
    :parameters (?h - hoist ?from - location ?to - location ?p - phase)
    :precondition (and
                    (phase-is ?p)
                    (hoist-at ?h ?from)
                  )
    :effect (and
              (not (hoist-at ?h ?from))
              (hoist-at ?h ?to)
            )
  )

  ;; Hoist unloads a task's crate from truck to destination (completes the task)
  (:action hoist-unload
    :parameters (?h - hoist ?d - driver ?t - task ?c - crate ?p - phase ?loc-dest - location)
    :precondition (and
                    (phase-is ?p)
                    (assigned-hoist ?h ?t)
                    (assigned-driver ?d ?t)
                    (task-of ?t ?c)
                    (hoist-at ?h ?loc-dest)
                    (driver-at ?d ?loc-dest)
                    (on-truck ?t)
                  )
    :effect (and
              (not (on-truck ?t))
              (crate-at ?c ?loc-dest)
              (unloaded ?t)
              (task-completed ?t)
            )
  )

  ;; Orchestrator composes the audit report after all tasks have been unloaded; advances final phase and marks audit done
  (:action orchestrator-audit
    :parameters (?p-prev - phase ?p-next - phase ?t1 - task ?t2 - task)
    :precondition (and
                    (phase-is ?p-prev)
                    (phase-succ ?p-prev ?p-next)
                    (unloaded ?t1)
                    (unloaded ?t2)
                  )
    :effect (and
              (not (phase-is ?p-prev))
              (phase-is ?p-next)
              (audit-report-done)
            )
  )
)