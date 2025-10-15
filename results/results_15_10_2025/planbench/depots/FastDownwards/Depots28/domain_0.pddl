(define (domain multi_planner)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task slot)

  (:predicates
    ;; type markers (kept explicit so the problem file can encode roles without inventing new objects)
    (is_agent ?a - agent)
    (is_task ?t - task)
    (is_slot ?s - slot)

    ;; resource / assignment state
    (free ?s - slot)                 ; slot is free (not reserved)
    (reserved ?s - slot)             ; slot is reserved by some agent
    (reserved_by ?s - slot ?a - agent) ; slot reserved by a specific agent

    (assigned ?t - task)             ; task is assigned (to some agent)
    (assigned_to ?t - task ?a - agent) ; task assigned specifically to an agent

    (done ?t - task)                 ; task completed

    (available ?a - agent)           ; agent is available to take a reservation/execution
  )

  ;; Actions for planner A (distinct role names preserved)
  (:action planner_a_reserve_slot
    :parameters (?a - agent ?t - task ?s - slot)
    :precondition (and
      (is_agent ?a) (is_task ?t) (is_slot ?s)
      (available ?a)
      (free ?s)
      (not (assigned ?t))
    )
    :effect (and
      (reserved ?s)
      (reserved_by ?s ?a)
      (not (free ?s))
      (assigned ?t)
      (assigned_to ?t ?a)
      (not (available ?a))
    )
  )

  (:action planner_a_execute_task
    :parameters (?a - agent ?t - task ?s - slot)
    :precondition (and
      (is_agent ?a) (is_task ?t) (is_slot ?s)
      (assigned ?t)
      (assigned_to ?t ?a)
      (reserved ?s)
      (reserved_by ?s ?a)
      (not (done ?t))
    )
    :effect (and
      (done ?t)
    )
  )

  (:action planner_a_release_slot
    :parameters (?a - agent ?t - task ?s - slot)
    :precondition (and
      (is_agent ?a) (is_task ?t) (is_slot ?s)
      (reserved ?s)
      (reserved_by ?s ?a)
      (assigned ?t)
      (assigned_to ?t ?a)
    )
    :effect (and
      (free ?s)
      (not (reserved ?s))
      (not (reserved_by ?s ?a))
      (not (assigned ?t))
      (not (assigned_to ?t ?a))
      (available ?a)
    )
  )

  ;; Actions for planner B (distinct names and preserved role separation)
  (:action planner_b_reserve_slot
    :parameters (?b - agent ?t - task ?s - slot)
    :precondition (and
      (is_agent ?b) (is_task ?t) (is_slot ?s)
      (available ?b)
      (free ?s)
      (not (assigned ?t))
    )
    :effect (and
      (reserved ?s)
      (reserved_by ?s ?b)
      (not (free ?s))
      (assigned ?t)
      (assigned_to ?t ?b)
      (not (available ?b))
    )
  )

  (:action planner_b_execute_task
    :parameters (?b - agent ?t - task ?s - slot)
    :precondition (and
      (is_agent ?b) (is_task ?t) (is_slot ?s)
      (assigned ?t)
      (assigned_to ?t ?b)
      (reserved ?s)
      (reserved_by ?s ?b)
      (not (done ?t))
    )
    :effect (and
      (done ?t)
    )
  )

  (:action planner_b_release_slot
    :parameters (?b - agent ?t - task ?s - slot)
    :precondition (and
      (is_agent ?b) (is_task ?t) (is_slot ?s)
      (reserved ?s)
      (reserved_by ?s ?b)
      (assigned ?t)
      (assigned_to ?t ?b)
    )
    :effect (and
      (free ?s)
      (not (reserved ?s))
      (not (reserved_by ?s ?b))
      (not (assigned ?t))
      (not (assigned_to ?t ?b))
      (available ?b)
    )
  )
)