(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types
    person time_slot)
  (:predicates
    (busy ?p - person ?t - time_slot)
    (available ?p - person ?t - time_slot)
    (meeting-scheduled ?t - time_slot))
  (:action schedule-meeting
    :parameters (?t - time_slot)
    :precondition (and
      (available diane ?t)
      (available kelly ?t)
      (available deborah ?t)
      (not (busy diane ?t))
      (not (busy kelly ?t))
      (not (busy deborah ?t)))
    :effect (and
      (meeting-scheduled ?t)
      (not (available diane ?t))
      (not (available kelly ?t))
      (not (available deborah ?t))
    )
  )
)