(define (domain orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task resource location)

  (:predicates
    (at ?a - agent ?l - location)                ; agent a is at location l
    (task-at ?t - task ?l - location)           ; task t is at location l
    (assigned ?t - task ?a - agent)             ; task t is assigned to agent a
    (completed ?t - task)                       ; task t is completed
    (capable ?a - agent ?t - task)              ; agent a is capable of performing task t
    (available ?r - resource)                   ; resource r is available
    (holds ?a - agent ?r - resource)            ; agent a currently holds resource r
  )

  ;; Assign a task to an agent present at the same location who is capable and task is not already assigned.
  (:action assign-task
    :parameters (?a - agent ?t - task ?l - location)
    :precondition (and
      (at ?a ?l)
      (task-at ?t ?l)
      (capable ?a ?t)
      (not (assigned ?t ?a))
    )
    :effect (and
      (assigned ?t ?a)
    )
  )

  ;; Acquire a resource that is available.
  (:action acquire-resource
    :parameters (?a - agent ?r - resource)
    :precondition (and
      (available ?r)
      (not (holds ?a ?r))
    )
    :effect (and
      (holds ?a ?r)
      (not (available ?r))
    )
  )

  ;; Release a held resource, making it available again.
  (:action release-resource
    :parameters (?a - agent ?r - resource)
    :precondition (holds ?a ?r)
    :effect (and
      (available ?r)
      (not (holds ?a ?r))
    )
  )

  ;; Move an agent from one location to another.
  (:action move-agent
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (at ?a ?from)
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )

  ;; Perform a task: requires the agent to be assigned, at same location, holding a required resource, and capable.
  ;; Note: if a task requires no resource, the problem can omit acquire-resource steps and use a dummy reusable resource or add capability without resource constraint.
  (:action perform-task
    :parameters (?a - agent ?t - task ?l - location ?r - resource)
    :precondition (and
      (assigned ?t ?a)
      (at ?a ?l)
      (task-at ?t ?l)
      (holds ?a ?r)
      (capable ?a ?t)
    )
    :effect (and
      (completed ?t)
      (not (assigned ?t ?a))
      (not (task-at ?t ?l))
    )
  )
)