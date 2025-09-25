(define (domain meeting-scheduling-fd)
  (:requirements :typing :negative-preconditions :adl :conditional-effects :equality)
  (:types agent timeslot)
  (:predicates
    (workhour ?t - timeslot)
    (available ?a - agent ?t - timeslot)
    (meeting-time ?t - timeslot)
    (meeting-scheduled)
    (agent-scheduled ?a - agent ?t - timeslot)
    (late ?t - timeslot)
    (undesirable ?a - agent ?t - timeslot)
  )

  (:action propose
    :parameters (?a - agent ?t - timeslot)
    :precondition (and (workhour ?t) (available ?a ?t) (not (meeting-scheduled)))
    :effect (and
      (meeting-time ?t)
      (meeting-scheduled)
      (agent-scheduled ?a ?t)
      (when (and (= ?a billy) (late ?t)) (undesirable ?a ?t))
    )
  )

  (:action confirm
    :parameters (?a - agent ?t - timeslot)
    :precondition (and (workhour ?t) (available ?a ?t) (meeting-time ?t) (not (agent-scheduled ?a ?t)))
    :effect (and
      (agent-scheduled ?a ?t)
      (when (and (= ?a billy) (late ?t)) (undesirable ?a ?t))
    )
  )
)