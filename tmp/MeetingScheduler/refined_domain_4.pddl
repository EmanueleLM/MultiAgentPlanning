(define (domain combined-schedule-adl)
  (:requirements :adl :typing :equality)

  (:types time-slot participant)

  (:predicates 
    (available ?p - participant ?t - time-slot)
    (assigned ?p - participant ?t1 - time-slot ?t2 - time-slot)
    (meeting-scheduled)
    (next ?t1 ?t2 - time-slot)
  )

  (:action assign-time-slot-michelle
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition (and
      (available michelle ?t1)
      (available michelle ?t2)
      (next ?t1 ?t2)
      (not (assigned michelle ?t1 ?t2))
    )
    :effect (assigned michelle ?t1 ?t2)
  )

  (:action assign-time-slot-steven
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition (and
      (available steven ?t1)
      (available steven ?t2)
      (next ?t1 ?t2)
      (not (assigned steven ?t1 ?t2))
    )
    :effect (assigned steven ?t1 ?t2)
  )

  (:action assign-time-slot-jerry
    :parameters (?t1 - time-slot ?t2 - time-slot)
    :precondition (and
      (available jerry ?t1)
      (available jerry ?t2)
      (next ?t1 ?t2)
      (not (assigned jerry ?t1 ?t2))
    )
    :effect (assigned jerry ?t1 ?t2)
  )

  (:action finalize-meeting
    :parameters ()
    :precondition (and
      (exists (?t1 ?t2 - time-slot) (and 
        (assigned michelle ?t1 ?t2)
        (assigned steven ?t1 ?t2)
        (assigned jerry ?t1 ?t2)
      ))
    )
    :effect (meeting-scheduled)
  )
)