(define (domain meeting_scheduling_integrated)
  (:requirements :typing :negative-preconditions :equality)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (within_work_hours ?t - timeslot)
    (proposed_diane ?t - timeslot)
    (proposed_kelly ?t - timeslot)
    (proposed_deborah ?t - timeslot)
    (meeting_confirmed)
    (meeting_at ?t - timeslot)
  )

  (:action diane_propose
    :parameters (?t - timeslot)
    :precondition (and
      (free diane ?t)
      (within_work_hours ?t)
      (not (meeting_confirmed))
      (not (proposed_diane ?t))
    )
    :effect (and
      (proposed_diane ?t)
    )
  )

  (:action kelly_propose
    :parameters (?t - timeslot)
    :precondition (and
      (free kelly ?t)
      (within_work_hours ?t)
      (not (meeting_confirmed))
      (not (proposed_kelly ?t))
    )
    :effect (and
      (proposed_kelly ?t)
    )
  )

  (:action deborah_propose
    :parameters (?t - timeslot)
    :precondition (and
      (free deborah ?t)
      (within_work_hours ?t)
      (not (meeting_confirmed))
      (not (proposed_deborah ?t))
    )
    :effect (and
      (proposed_deborah ?t)
    )
  )

  (:action orchestrator_confirm
    :parameters (?t - timeslot)
    :precondition (and
      (proposed_diane ?t)
      (proposed_kelly ?t)
      (proposed_deborah ?t)
      (within_work_hours ?t)
      (not (meeting_confirmed))
      (free diane ?t)
      (free kelly ?t)
      (free deborah ?t)
    )
    :effect (and
      (meeting_confirmed)
      (meeting_at ?t)
      (not (free diane ?t))
      (not (free kelly ?t))
      (not (free deborah ?t))
    )
  )
)