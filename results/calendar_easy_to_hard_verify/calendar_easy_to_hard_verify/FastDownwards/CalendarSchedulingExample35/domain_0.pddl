(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person timeslot meeting)
  (:predicates
    (available ?p - person ?t - timeslot)
    (slot-in-workhours ?t - timeslot)
    (scheduled ?m - meeting)
    (meeting-start ?m - meeting ?t - timeslot)
    (attending ?p - person ?m - meeting)
  )

  ;; Action that schedules the single meeting at a given timeslot.
  ;; Preconditions require that the slot is in work hours and that every participant
  ;; is available at that slot. Diane's preference (no meetings after 15:30) is
  ;; encoded via Diane's availability in the problem file.
  (:action schedule-meeting-at
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (slot-in-workhours ?t)
      (available diane ?t)
      (available helen ?t)
      (available arthur ?t)
      (available ethan ?t)
      (available beverly ?t)
      (available deborah ?t)
    )
    :effect (and
      (scheduled ?m)
      (meeting-start ?m ?t)
      (attending diane ?m)
      (attending helen ?m)
      (attending arthur ?m)
      (attending ethan ?m)
      (attending beverly ?m)
      (attending deborah ?m)
    )
  )
)