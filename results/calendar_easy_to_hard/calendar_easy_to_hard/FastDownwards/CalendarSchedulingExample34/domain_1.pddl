(define (domain orchestrator-meeting)
  (:requirements :typing :negative-preconditions)
  (:types participant time)
  (:constants christine janice bobby elizabeth tyler edward - participant)
  (:predicates
    (slot ?t - time)
    (work-time ?t - time)
    (day-monday ?t - time)
    (meeting-scheduled)
    (scheduled-at ?t - time)
    (meeting-confirmed)
    (free ?p - participant ?t - time)
    (available ?p - participant ?t - time)
    (free-edward ?t - time)
  )

  (:action schedule_christine
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (work-time ?t)
      (day-monday ?t)
      (not (meeting-scheduled))
      (free christine ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  (:action schedule_janice
    :parameters (?t - time)
    :precondition (and
      (not (meeting-scheduled))
      (available christine ?t)
      (available janice ?t)
      (available bobby ?t)
      (available elizabeth ?t)
      (available tyler ?t)
      (available edward ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  (:action schedule_bobby
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (not (meeting-scheduled))
      (free christine ?t)
      (free janice ?t)
      (free bobby ?t)
      (free elizabeth ?t)
      (free tyler ?t)
      (free edward ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  (:action schedule_elizabeth
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (available christine ?t)
      (available janice ?t)
      (available bobby ?t)
      (available elizabeth ?t)
      (available tyler ?t)
      (available edward ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  (:action schedule_tyler
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (not (meeting-scheduled))
      (available tyler ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  (:action schedule_edward
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (free-edward ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?t)
    )
  )

  (:action confirm_meeting
    :parameters (?t - time)
    :precondition (and
      (scheduled-at ?t)
      (available christine ?t)
      (available janice ?t)
      (available bobby ?t)
      (available elizabeth ?t)
      (available tyler ?t)
      (available edward ?t)
    )
    :effect (meeting-confirmed)
  )
)