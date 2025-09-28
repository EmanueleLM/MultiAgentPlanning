(define (domain calendar-scheduling)
  (:requirements :strips :typing :action-costs)
  (:types participant timeslot)
  (:constants noah teresa bradley philip joyce ryan aaron - participant)
  (:predicates
    (available ?p - participant ?t - timeslot)
    (meeting-scheduled ?t - timeslot)
    (meeting-duration-30)
  )
  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (meeting-duration-30)
      (available noah ?t)
      (available teresa ?t)
      (available bradley ?t)
      (available philip ?t)
      (available joyce ?t)
      (available ryan ?t)
      (available aaron ?t)
    )
    :effect (and
      (meeting-scheduled ?t)
    )
    :cost 1
  )
)