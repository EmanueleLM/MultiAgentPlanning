(define (domain combined-schedule-strips)
  (:requirements :strips :typing)

  (:types time-slot participant)

  (:predicates 
    (available ?p - participant ?t - time-slot)
    (meeting-scheduled ?p - participant)
    (scheduled)
    (next ?t1 ?t2 - time-slot)
  )

  (:action schedule-michelle
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition (and
      (available michelle ?t1)
      (available michelle ?t2)
      (next ?t1 ?t2)
    )
    :effect (meeting-scheduled michelle)
  )

  (:action schedule-steven
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition (and
      (available steven ?t1)
      (available steven ?t2)
      (next ?t1 ?t2)
    )
    :effect (meeting-scheduled steven)
  )

  (:action schedule-jerry
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition (and
      (available jerry ?t1)
      (available jerry ?t2)
      (next ?t1 ?t2)
    )
    :effect (meeting-scheduled jerry)
  )

  (:action finalize-meeting
    :parameters ()
    :precondition (and
      (meeting-scheduled michelle)
      (meeting-scheduled steven)
      (meeting-scheduled jerry)
    )
    :effect (scheduled)
  )
)