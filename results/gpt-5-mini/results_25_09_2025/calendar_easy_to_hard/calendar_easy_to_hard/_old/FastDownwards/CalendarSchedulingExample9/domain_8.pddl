(define (domain meeting-scheduling-integrated)
  (:requirements :typing :negative-preconditions :equality)
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
  )

  (:action orchestrator-confirm
    :parameters (?t - timeslot)
    :precondition (and
      (proposed-diane ?t)
      (proposed-kelly ?t)
      (proposed-deborah ?t)
      (within-work-hours ?t)
      (not (meeting-confirmed))
      (free diane ?t)
      (free kelly ?t)
      (free deborah ?t)
    )
    :effect (and
      (meeting-confirmed)
      (meeting-at ?t)
      (not (free diane ?t))
      (not (free kelly ?t))
      (not (free deborah ?t))
    )
  )
)