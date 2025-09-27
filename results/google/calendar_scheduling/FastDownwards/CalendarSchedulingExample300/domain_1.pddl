(define (domain calendar-scheduling)
  (:requirements :strips)
  (:predicates
    (slot ?s)
    (participant ?p)
    (free ?p ?s)
    (meeting-scheduled)
    (meeting-at ?s)
  )

  (:action schedule
    :parameters (?s)
    :precondition (and
      (slot ?s)
      (free eric ?s)
      (free jeremy ?s)
      (free joe ?s)
      (free brian ?s)
      (free brittany ?s)
      (free julia ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)
    )
  )
)