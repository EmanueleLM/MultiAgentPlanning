(define (domain integrated-meeting-scheduler)
  (:requirements :typing :negative-preconditions :equality)
  (:types person timeslot)
  (:predicates
    (busy ?p - person ?t - timeslot)
    (within-work ?t - timeslot)
    (agreed ?p - person ?t - timeslot)
    (meeting-scheduled)
    (meeting-at ?t - timeslot)
    (attending ?p - person)
  )
  (:action agree_madison
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)
      (not (busy madison ?t))
      (not (agreed madison ?t))
    )
    :effect (and
      (agreed madison ?t)
    )
  )
  (:action agree_linda
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)
      (not (busy linda ?t))
      (not (agreed linda ?t))
    )
    :effect (and
      (agreed linda ?t)
    )
  )
  (:action agree_logan
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)
      (not (busy logan ?t))
      (not (agreed logan ?t))
    )
    :effect (and
      (agreed logan ?t)
    )
  )
  (:action agree_virginia
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)
      (not (busy virginia ?t))
      (not (agreed virginia ?t))
    )
    :effect (and
      (agreed virginia ?t)
    )
  )
  (:action finalize_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (within-work ?t)
      (agreed madison ?t)
      (agreed linda ?t)
      (agreed logan ?t)
      (agreed virginia ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?t)
      (attending madison)
      (attending linda)
      (attending logan)
      (attending virginia)
    )
  )
)