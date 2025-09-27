(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :fluents :action-costs)
  (:types participant time)

  (:predicates
    (available ?p - participant ?t - time)
    (unscheduled)
    (scheduled)
    (meeting-at ?t - time)
  )

  (:functions
    (total-cost)
    (cost-of ?t - time)
  )

  ;; Schedule the 30-minute meeting at a chosen start time.
  ;; Preconditions require the meeting not already scheduled and that every
  ;; required participant is available at that start time.
  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (unscheduled)
      ;; Explicit availability checks for each participant:
      (available diane ?t)
      (available helen ?t)
      (available arthur ?t)
      (available ethan ?t)
      (available beverly ?t)
      (available deborah ?t)
    )
    :effect (and
      (not (unscheduled))
      (scheduled)
      (meeting-at ?t)
      (increase (total-cost) (cost-of ?t))
    )
  )
)