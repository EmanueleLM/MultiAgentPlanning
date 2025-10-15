(define (domain multiagent_scheduling)
  (:requirements :strips :typing)
  (:types agent task room timeslot deliverable)

  (:predicates
    (agent ?a - agent)
    (task ?t - task)
    (room ?r - room)
    (timeslot ?s - timeslot)
    (deliverable ?d - deliverable)

    ;; availability / resource predicates
    (agent-free ?a - agent ?s - timeslot)
    (room-free ?r - room ?s - timeslot)

    ;; constraints and associations
    (allowed ?t - task ?s - timeslot)        ; task allowed to be scheduled in a timeslot (hard temporal constraint)
    (associated ?t - task ?d - deliverable) ; task is associated with producing a deliverable

    ;; planning state
    (assigned ?t - task ?a - agent)
    (scheduled ?t - task ?s - timeslot)
    (completed ?t - task)
    (produced ?a - agent ?d - deliverable)
  )

  ;; Assign a task to an agent in a room and timeslot.
  ;; Preconditions enforce agent and room availability and allowed timeslot.
  (:action assign-task
    :parameters (?a - agent ?t - task ?r - room ?s - timeslot)
    :precondition (and
      (agent ?a)
      (task ?t)
      (room ?r)
      (timeslot ?s)
      (agent-free ?a ?s)
      (room-free ?r ?s)
      (allowed ?t ?s)
    )
    :effect (and
      (assigned ?t ?a)
      (scheduled ?t ?s)
      (not (agent-free ?a ?s))
      (not (room-free ?r ?s))
    )
  )

  ;; Complete a scheduled and assigned task.
  (:action complete-task
    :parameters (?a - agent ?t - task ?s - timeslot)
    :precondition (and
      (assigned ?t ?a)
      (scheduled ?t ?s)
      (agent ?a)
      (task ?t)
      (timeslot ?s)
    )
    :effect (and
      (completed ?t)
    )
  )

  ;; Produce a report requires both prepare and review tasks to be completed.
  ;; This is a higher-level action encoding the hard preference/temporal constraint that both must be done before producing.
  (:action produce-report
    :parameters (?a - agent ?d - deliverable ?t1 - task ?t2 - task)
    :precondition (and
      (agent ?a)
      (deliverable ?d)
      (task ?t1)
      (task ?t2)
      (completed ?t1)
      (completed ?t2)
      (associated ?t1 ?d)
      (associated ?t2 ?d)
    )
    :effect (and
      (produced ?a ?d)
    )
  )

  ;; Produce an agenda requires the summary task to be completed.
  (:action produce-agenda
    :parameters (?a - agent ?d - deliverable ?t - task)
    :precondition (and
      (agent ?a)
      (deliverable ?d)
      (task ?t)
      (completed ?t)
      (associated ?t ?d)
    )
    :effect (and
      (produced ?a ?d)
    )
  )

)