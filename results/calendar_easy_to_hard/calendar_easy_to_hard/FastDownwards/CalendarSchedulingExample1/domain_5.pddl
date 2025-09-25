(define (domain meeting-scheduling-fd)
  (:requirements :strips :typing)
  (:types agent timeslot)
  (:predicates
    (workhour ?t - timeslot)
    (available ?a - agent ?t - timeslot)
    (meeting-time ?t - timeslot)
    (agent-scheduled ?a - agent ?t - timeslot)
    (late ?t - timeslot)
    (undesirable ?a - agent ?t - timeslot)
    (prefers-avoid-late ?a - agent)
    (meeting-scheduled-all)
  )

  (:action propose
    :parameters (?a - agent ?t - timeslot)
    :precondition (and (workhour ?t) (available ?a ?t))
    :effect (and
      (meeting-time ?t)
      (agent-scheduled ?a ?t)
    )
  )

  (:action propose-avoid
    :parameters (?a - agent ?t - timeslot)
    :precondition (and (workhour ?t) (available ?a ?t) (prefers-avoid-late ?a) (late ?t))
    :effect (and
      (meeting-time ?t)
      (agent-scheduled ?a ?t)
      (undesirable ?a ?t)
    )
  )

  (:action confirm
    :parameters (?a - agent ?t - timeslot)
    :precondition (and (workhour ?t) (available ?a ?t) (meeting-time ?t))
    :effect (and
      (agent-scheduled ?a ?t)
    )
  )

  (:action confirm-avoid
    :parameters (?a - agent ?t - timeslot)
    :precondition (and (workhour ?t) (available ?a ?t) (meeting-time ?t) (prefers-avoid-late ?a) (late ?t))
    :effect (and
      (agent-scheduled ?a ?t)
      (undesirable ?a ?t)
    )
  )

  (:action finalize
    :parameters (?t - timeslot ?a1 - agent ?a2 - agent ?a3 - agent)
    :precondition (and
      (meeting-time ?t)
      (agent-scheduled ?a1 ?t)
      (agent-scheduled ?a2 ?t)
      (agent-scheduled ?a3 ?t)
    )
    :effect (meeting-scheduled-all)
  )
)