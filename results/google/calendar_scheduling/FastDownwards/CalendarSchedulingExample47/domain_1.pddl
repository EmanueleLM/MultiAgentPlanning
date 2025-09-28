(define (domain meeting-scheduling)
  (:requirements :typing :fluents :adl :negative-preconditions :equality)
  (:types participant time)
  (:predicates
    (slot ?t - time)
    (free ?p - participant ?t - time)
    (attending ?p - participant)
    (meeting-scheduled)
    (meeting-start ?t - time)
  )
  (:functions
    (time-index ?t - time)
    (meeting-start-index)
  )
  (:action schedule-meeting
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (not (meeting-scheduled))
      (forall (?p - participant) (free ?p ?t))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-start ?t)
      (increase (meeting-start-index) (time-index ?t))
      (forall (?p - participant)
        (and
          (attending ?p)
          (not (free ?p ?t))
        )
      )
    )
  )
)