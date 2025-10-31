(define (domain meeting-scheduling)
  (:requirements :strips :typing :universal-preconditions)
  (:types participant slot)
  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    (available ?p - participant ?s - slot)    ; participant p is available at slot s
    (meeting-at ?s - slot)                    ; meeting is scheduled at slot s
    (scheduled)                               ; meeting has been scheduled
  )

  ; An action that schedules the meeting at a particular slot.
  ; Precondition: meeting not yet scheduled AND for all participants, they are available at that slot.
  ; Effect: meeting-at that slot and scheduled becomes true.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (forall (?p - participant) (available ?p ?s))
    )
    :effect (and
      (meeting-at ?s)
      (scheduled)
    )
  )
)