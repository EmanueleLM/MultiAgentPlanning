(define (domain orchestrator)
  (:requirements :typing :negative-preconditions :strips)
  (:types hoist driver container truck location task slot report)

  (:predicates
    ;; types
    (hoist ?h - hoist)
    (driver ?d - driver)
    (container ?c - container)
    (truck ?t - truck)
    (location ?l - location)
    (task ?task - task)
    (slot ?s - slot)
    (report ?r - report)

    ;; task specification
    (task-for-container ?task - task ?c - container)
    (task-target-truck ?task - task ?t - truck)

    ;; assignment bookkeeping
    (task-assigned ?task - task)
    (task-assigned-to-hoist ?task - task ?h - hoist)
    (task-assigned-to-driver ?task - task ?d - driver)

    ;; availability / capability (kept explicit)
    (hoist-available ?h - hoist)
    (driver-available ?d - driver)

    ;; physical state
    (container-at ?c - container ?l - location)
    (truck-at ?t - truck ?l - location)
    (container-loaded ?c - container ?t - truck)

    ;; agent holdings and attachments
    (hoist-holding ?h - hoist ?c - container)
    (attached-at ?d - driver ?t - truck ?s - slot)

    ;; temporal / ordering facts (slot-indexed execution markers)
    (picked ?task - task ?s - slot)
    (placed ?task - task ?s - slot)

    ;; agent busy markers per slot (separate for types)
    (hoist-busy ?h - hoist ?s - slot)
    (driver-busy ?d - driver ?s - slot)

    ;; completion and audit
    (task-completed ?task - task)
    (audit-produced ?task - task)
    (report-generated ?r - report)
    (audit-reports ?r - report ?task - task)

    ;; slot ordering relation
    (next ?s1 - slot ?s2 - slot)
  )

  ;; Allocation actions (must be done before performers act)
  (:action allocate-task-to-hoist
    :parameters (?h - hoist ?task - task)
    :precondition (and (hoist ?h) (not (task-assigned ?task)))
    :effect (and (task-assigned ?task) (task-assigned-to-hoist ?task ?h))
  )

  (:action allocate-task-to-driver
    :parameters (?d - driver ?task - task)
    :precondition (and (driver ?d) (not (task-assigned ?task)))
    :effect (and (task-assigned ?task) (task-assigned-to-driver ?task ?d))
  )

  ;; Hoist actions: pick then place. Must observe slot adjacency.
  (:action hoist-pick
    :parameters (?h - hoist ?task - task ?c - container ?loc - location ?s - slot)
    :precondition
      (and
        (hoist ?h)
        (task-assigned-to-hoist ?task ?h)
        (task-for-container ?task ?c)
        (container-at ?c ?loc)
        (not (hoist-holding ?h ?c))
        (not (hoist-busy ?h ?s))
      )
    :effect
      (and
        (hoist-holding ?h ?c)
        (picked ?task ?s)
        (hoist-busy ?h ?s)
        (not (container-at ?c ?loc))
      )
  )

  (:action hoist-place
    :parameters (?h - hoist ?task - task ?c - container ?t - truck ?truckloc - location ?s1 - slot ?s2 - slot)
    :precondition
      (and
        (hoist ?h)
        (task-assigned-to-hoist ?task ?h)
        (hoist-holding ?h ?c)
        (task-target-truck ?task ?t)
        (truck-at ?t ?truckloc)
        (picked ?task ?s1)
        (next ?s1 ?s2)
        (not (hoist-busy ?h ?s2))
      )
    :effect
      (and
        (not (hoist-holding ?h ?c))
        (container-loaded ?c ?t)
        (placed ?task ?s2)
        (hoist-busy ?h ?s2)
      )
  )

  ;; Driver actions: attach (after place) then drive (to task final location).
  (:action driver-attach
    :parameters (?d - driver ?task - task ?t - truck ?s_prev - slot ?s - slot)
    :precondition
      (and
        (driver ?d)
        (task-assigned-to-driver ?task ?d)
        (task-target-truck ?task ?t)
        (placed ?task ?s_prev)
        (next ?s_prev ?s)
        (not (driver-busy ?d ?s))
      )
    :effect
      (and
        (attached-at ?d ?t ?s)
        (driver-busy ?d ?s)
      )
  )

  (:action driver-drive
    :parameters (?d - driver ?task - task ?t - truck ?from - location ?to - location ?s_prev - slot ?s - slot)
    :precondition
      (and
        (driver ?d)
        (task-assigned-to-driver ?task ?d)
        (attached-at ?d ?t ?s_prev)
        (truck-at ?t ?from)
        (next ?s_prev ?s)
        (not (driver-busy ?d ?s))
      )
    :effect
      (and
        (not (truck-at ?t ?from))
        (truck-at ?t ?to)
        (driver-busy ?d ?s)
        (task-completed ?task)
      )
  )

  ;; Audit report generation must only be possible after task was assigned and completed.
  (:action produce-audit-report
    :parameters (?r - report ?task - task)
    :precondition
      (and
        (task-assigned ?task)
        (task-completed ?task)
        (not (audit-produced ?task))
      )
    :effect
      (and
        (audit-produced ?task)
        (report-generated ?r)
        (audit-reports ?r ?task)
      )
  )
)