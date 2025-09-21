(define (domain meeting-scheduling-integrated)
  (:requirements :typing :negative-preconditions :action-costs :equality)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (within-work-hours ?t - timeslot)
    (proposed-diane ?t - timeslot)
    (proposed-kelly ?t - timeslot)
    (proposed-deborah ?t - timeslot)
    (meeting-confirmed)
    (meeting-at ?t - timeslot)
  )

  (:action diane-propose
    :parameters (?t - timeslot)
    :precondition (and
      (free diane ?t)
      (within-work-hours ?t)
      (not (meeting-confirmed))
      (not (proposed-diane ?t))
    )
    :effect (and
      (proposed-diane ?t)
    )
    :costs 1
  )

  (:action kelly-propose
    :parameters (?t - timeslot)
    :precondition (and
      (free kelly ?t)
      (within-work-hours ?t)
      (not (meeting-confirmed))
      (not (proposed-kelly ?t))
    )
    :effect (and
      (proposed-kelly ?t)
    )
    :costs 1
  )

  (:action deborah-propose
    :parameters (?t - timeslot)
    :precondition (and
      (free deborah ?t)
      (within-work-hours ?t)
      (not (meeting-confirmed))
      (not (proposed-deborah ?t))
    )
    :effect (and
      (proposed-deborah ?t)
    )
    :costs 1
  )

  (:action orchestrator-confirm
    :parameters (?t - timeslot)
    :precondition (and
      (proposed-diane ?t)
      (proposed-kelly ?t)
      (proposed-deborah ?t)
      (within-work-hours ?t)
      (not (meeting-confirmed))
      (free diane ?t) (free kelly ?t) (free deborah ?t)
    )
    :effect (and
      (meeting-confirmed)
      (meeting-at ?t)
      (not (free diane ?t))
      (not (free kelly ?t))
      (not (free deborah ?t))
    )
    :costs 0
  )
)