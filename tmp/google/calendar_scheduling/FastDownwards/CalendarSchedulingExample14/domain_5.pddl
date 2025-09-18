(define (domain meeting-scheduling)
  (:requirements :typing :adl :negative-preconditions)
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

  (:action schedule-by-brandon
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (late ?s)
      (forall (?p - participant) (free ?p ?s))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attends ?p ?s))
      (not (unscheduled))
    )
  )

  (:action schedule-by-jerry
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (forall (?p - participant) (free ?p ?s))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attends ?p ?s))
      (not (unscheduled))
    )
  )

  (:action schedule-by-bradley
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (forall (?p - participant) (free ?p ?s))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
      (forall (?p - participant) (attends ?p ?s))
      (not (unscheduled))
    )
  )
)