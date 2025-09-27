(define (domain schedule-meeting)
  (:requirements :typing :universal-preconditions)
  (:types participant slot meeting)
  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (available ?p - participant ?s - slot)   ; participant is available at slot
    (meeting-scheduled ?m - meeting)         ; meeting has been scheduled
    (scheduled-at ?m - meeting ?s - slot)   ; meeting m scheduled at slot
    (attends ?p - participant ?m - meeting) ; participant attends meeting
  )

  ;; Schedule the meeting at a slot only if that slot exists and every participant is available at that slot.
  (:action schedule-meeting-at
    :parameters (?m - meeting ?s - slot)
    :precondition (and
                    (slot ?s)
                    (forall (?p - participant) (available ?p ?s))
                  )
    :effect (and
              (meeting-scheduled ?m)
              (scheduled-at ?m ?s)
              ;; after scheduling, assert every participant attends the meeting
              (forall (?p - participant) (attends ?p ?m))
            )
  )
)