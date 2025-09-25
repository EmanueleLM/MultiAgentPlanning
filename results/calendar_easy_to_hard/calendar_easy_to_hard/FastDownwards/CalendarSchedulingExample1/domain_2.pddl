(define (domain meeting-scheduling-fd)
  (:requirements :typing :negative-preconditions :adl :action-costs :fluents)
  (:types agent timeslot)
  (:predicates
    (workhour ?t - timeslot)
    (available ?a - agent ?t - timeslot)
    (meeting-time ?t - timeslot)
    (meeting-scheduled)
    (agent-scheduled ?a - agent ?t - timeslot)
    (late ?t - timeslot)
  )
  (:functions (total-cost))
  (:action propose-raymond
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available raymond ?t) (not (meeting-scheduled)))
    :effect (and
      (meeting-time ?t)
      (meeting-scheduled)
      (agent-scheduled raymond ?t)
      (increase (total-cost) 1)
    )
  )
  (:action confirm-raymond
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available raymond ?t) (meeting-time ?t) (not (agent-scheduled raymond ?t)))
    :effect (and
      (agent-scheduled raymond ?t)
      (increase (total-cost) 1)
    )
  )
  (:action propose-billy
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available billy ?t) (not (meeting-scheduled)))
    :effect (and
      (meeting-time ?t)
      (meeting-scheduled)
      (agent-scheduled billy ?t)
      (increase (total-cost) 1)
      (when (late ?t) (increase (total-cost) 10))
    )
  )
  (:action confirm-billy
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available billy ?t) (meeting-time ?t) (not (agent-scheduled billy ?t)))
    :effect (and
      (agent-scheduled billy ?t)
      (increase (total-cost) 1)
      (when (late ?t) (increase (total-cost) 10))
    )
  )
  (:action propose-donald
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available donald ?t) (not (meeting-scheduled)))
    :effect (and
      (meeting-time ?t)
      (meeting-scheduled)
      (agent-scheduled donald ?t)
      (increase (total-cost) 1)
    )
  )
  (:action confirm-donald
    :parameters (?t - timeslot)
    :precondition (and (workhour ?t) (available donald ?t) (meeting-time ?t) (not (agent-scheduled donald ?t)))
    :effect (and
      (agent-scheduled donald ?t)
      (increase (total-cost) 1)
    )
  )
)