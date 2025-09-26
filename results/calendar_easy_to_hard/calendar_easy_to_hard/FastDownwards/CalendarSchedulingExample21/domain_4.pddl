(define (domain schedule-meeting)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (uncommitted ?p - participant)
    (committed ?p - participant ?s - slot)
    (scheduled)
    (meeting_at ?s - slot)
  )

  (:action commit
    :parameters (?p - participant ?s - slot)
    :precondition (and (uncommitted ?p) (free ?p ?s) (not (scheduled)))
    :effect (and (not (uncommitted ?p)) (committed ?p ?s))
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (committed sara ?s)
      (committed sarah ?s)
      (committed shirley ?s)
      (committed harold ?s)
      (committed terry ?s)
    )
    :effect (and (scheduled) (meeting_at ?s))
  )
)