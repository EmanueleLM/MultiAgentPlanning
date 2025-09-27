(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (slot ?s)
    (participant ?p)
    (available ?p ?s)
    (meeting-scheduled)
    (meeting-at ?s)
  )

  (:action schedule-meeting
    :parameters (?s)
    :precondition (and
      (slot ?s)
      (available peter ?s)
      (available judith ?s)
      (available keith ?s)
      (available evelyn ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)