(define (domain multiagent-orch)
  (:requirements :strips :typing :negative-preconditions)
  (:types hoist driver orchestrator - agent
          location container truck slot task agent)

  (:predicates
    ;; typing predicates (informational)
    (is-hoist ?h - hoist)
    (is-driver ?d - driver)
    (is-orch ?o - orchestrator)

    ;; positions
    (at ?a - agent ?l - location)
    (truck-at ?t - truck ?l - location)
    (container-at ?c - container ?l - location)
    (hoist-holding ?h - hoist ?c - container)
    (on-truck ?c - container ?t - truck)

    ;; allocation and tasks
    (allocated ?tsk - task ?a - agent)
    (task-complete ?tsk - task)
    (precedes ?t1 - task ?t2 - task)

    ;; explicit slots / sequencing artifacts
    (slot-successor ?s1 - slot ?s2 - slot)
    (task-assigned-slot ?tsk - task ?s - slot)
    (slot-used ?s - slot)

    ;; audit
    (audit-complete)
  )

  ;; Orchestrator action: allocate tasks to specific agents and mark allocation task complete.
  (:action orch_allocate
    :parameters (?orch - orchestrator
                 ?tsk_alloc - task
                 ?tsk_hoist - task
                 ?tsk_driver - task
                 ?tsk_place - task
                 ?tsk_audit - task
                 ?h - hoist
                 ?d - driver
                 ?s - slot)
    :precondition (and
                    (is-orch ?orch)
                    ;; ensure slot reserved for allocation exists and not yet used
                    (task-assigned-slot ?tsk_alloc ?s)
                    (not (slot-used ?s))
                    ;; allocation not already completed
                    (not (task-complete ?tsk_alloc))
                   )
    :effect (and
              (allocated ?tsk_hoist ?h)
              (allocated ?tsk_driver ?d)
              (allocated ?tsk_place ?h)
              (allocated ?tsk_audit ?orch)
              (slot-used ?s)
              (task-complete ?tsk_alloc)
            )
  )

  ;; Hoist picks up a container (lift) at its location. Must be allocated and allocation task complete.
  (:action hoist1_lift
    :parameters (?h - hoist ?c - container ?loc - location ?s - slot ?prev - task ?tsk - task)
    :precondition (and
                    ;; action is for the specific hoist-lift task object ?tsk
                    (is-hoist ?h)
                    (allocated ?tsk ?h)
                    (task-assigned-slot ?tsk ?s)
                    (not (slot-used ?s))
                    ;; direct predecessor must be completed (enforces ordering)
                    (precedes ?prev ?tsk)
                    (task-complete ?prev)
                    ;; physical preconditions: hoist and container co-located and hoist free
                    (at ?h ?loc)
                    (container-at ?c ?loc)
                    (not (hoist-holding ?h ?c))
                  )
    :effect (and
              (hoist-holding ?h ?c)
              (not (container-at ?c ?loc))
              (slot-used ?s)
              (task-complete ?tsk)
            )
  )

  ;; Driver drives the truck from its current location to the specified destination location.
  ;; Requires the hoist-lift predecessor to be complete (so ordering is enforced).
  (:action driver1_drive
    :parameters (?d - driver ?tr - truck ?from - location ?to - location ?s - slot ?prev - task ?tsk - task)
    :precondition (and
                    (is-driver ?d)
                    (allocated ?tsk ?d)
                    (task-assigned-slot ?tsk ?s)
                    (not (slot-used ?s))
                    (precedes ?prev ?tsk)
                    (task-complete ?prev)
                    ;; driver and truck must be co-located at origin
                    (at ?d ?from)
                    (truck-at ?tr ?from)
                  )
    :effect (and
              ;; move driver and truck to destination
              (at ?d ?to)
              (truck-at ?tr ?to)
              ;; remove old locations
              (not (at ?d ?from))
              (not (truck-at ?tr ?from))
              (slot-used ?s)
              (task-complete ?tsk)
            )
  )

  ;; Hoist places the held container onto the truck when co-located with the truck.
  (:action hoist1_place
    :parameters (?h - hoist ?c - container ?tr - truck ?loc - location ?s - slot ?prev - task ?tsk - task)
    :precondition (and
                    (is-hoist ?h)
                    (allocated ?tsk ?h)
                    (task-assigned-slot ?tsk ?s)
                    (not (slot-used ?s))
                    (precedes ?prev ?tsk)
                    (task-complete ?prev)
                    ;; hoist must be holding the container and co-located with truck
                    (hoist-holding ?h ?c)
                    (at ?h ?loc)
                    (truck-at ?tr ?loc)
                  )
    :effect (and
              ;; container ends up on truck
              (on-truck ?c ?tr)
              ;; hoist no longer holds it
              (not (hoist-holding ?h ?c))
              (slot-used ?s)
              (task-complete ?tsk)
            )
  )

  ;; Orchestrator performs an audit only after the placement is complete.
  (:action orch_audit
    :parameters (?orch - orchestrator ?tsk - task ?s - slot ?prev - task)
    :precondition (and
                    (is-orch ?orch)
                    (allocated ?tsk ?orch)
                    (task-assigned-slot ?tsk ?s)
                    (not (slot-used ?s))
                    (precedes ?prev ?tsk)
                    (task-complete ?prev)
                  )
    :effect (and
              (audit-complete)
              (slot-used ?s)
              (task-complete ?tsk)
            )
  )
)