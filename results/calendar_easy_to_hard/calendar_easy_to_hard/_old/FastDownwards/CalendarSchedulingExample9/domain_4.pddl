(define (domain meeting-scheduling-integrated)
  (:requirements :typing :negative-preconditions :strips)
  (:types person timeslot)

  (:constants diane kelly deborah - person)

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
    )
    :effect (proposed-diane ?t)
  )

  (:action kelly-propose
    :parameters (?t - timeslot)
    :precondition (and
      (free kelly ?t)
      (within-work-hours ?t)
      (not (meeting-confirmed))
    )
    :effect (proposed-kelly ?t)
  )

  (:action deborah-propose
    :parameters (?t - timeslot)
    :precondition (and
      (free deborah ?t)
      (within-work-hours ?t)
      (not (meeting-confirmed))
    )
    :effect (proposed-deborah ?t)
  )

  (:action orchestrator-confirm
    :parameters (?t - timeslot)
    :precondition (and
      (proposed-diane ?t)
      (proposed-kelly ?t)
      (proposed-deborah ?t)
      (within-work-hours ?t)
      (not (meeting-confirmed))
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