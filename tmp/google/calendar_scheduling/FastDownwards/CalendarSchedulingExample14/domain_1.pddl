(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :adl :action-costs)
  (:types participant slot)

  (:predicates
    (free ?p - participant ?s - slot)
    (unscheduled)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (attends ?p - participant ?s - slot)
    (early ?s - slot)
    (late ?s - slot)
  )

  (:action schedule-by-brandon-early
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (early ?s)
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (not (unscheduled))
    )
    :cost 1
  )

  (:action schedule-by-brandon-late
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (late ?s)
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (not (unscheduled))
    )
    :cost 0
  )

  (:action schedule-by-jerry
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (not (unscheduled))
    )
    :cost 0
  )

  (:action schedule-by-bradley
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (free brandon ?s)
      (free jerry ?s)
      (free bradley ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (attends brandon ?s)
      (attends jerry ?s)
      (attends bradley ?s)
      (not (unscheduled))
    )
    :cost 0
  )
)