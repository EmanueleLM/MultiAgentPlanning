(define (domain schedule-meeting)
  (:requirements :typing :adl)
  (:types participant slot meeting)

  (:predicates
    (slot ?s - slot)
    (participant ?p - participant)
    (free ?p - participant ?s - slot)        ; participant is available at slot
    (scheduled ?m - meeting)                ; meeting has been scheduled
    (scheduled-at ?m - meeting ?s - slot)   ; meeting scheduled at slot
    (attends ?p - participant ?m - meeting) ; participant attends meeting
  )

  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (not (scheduled ?m))
      ; all participants must be free at the chosen slot
      (forall (?p - participant) (free ?p ?s))
    )
    :effect (and
      (scheduled ?m)
      (scheduled-at ?m ?s)
      ; all participants attend and are no longer marked free at that slot
      (forall (?p - participant)
        (and (attends ?p ?m)
             (not (free ?p ?s))))
    )
  )
)