(define (domain meeting-scheduling)
  (:requirements :typing :fluents :adl :negative-preconditions :equality)
  (:types participant time)
  (:predicates
    (slot ?t - time)
    (free ?p - participant ?t - time)         ; participant ?p is free at time ?t
    (attending ?p - participant)              ; participant ?p is set to attend
    (meeting-scheduled)                       ; meeting has been scheduled
    (meeting-start ?t - time)                 ; meeting starts at time ?t
  )
  (:functions
    (time-index ?t - time)                    ; integer index per time slot for ordering
    (meeting-start-index)                     ; numeric index assigned when scheduled
  )

  ;; Schedule the meeting at a particular 30-min time slot ?t.
  ;; Preconditions:
  ;;   - a slot exists
  ;;   - meeting not already scheduled
  ;;   - every participant is free at ?t  (quantified precondition)
  ;; Effects:
  ;;   - meeting scheduled, meeting-start recorded
  ;;   - every participant becomes attending and is no longer free at ?t
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
      (assign (meeting-start-index) (time-index ?t))
      (forall (?p - participant)
        (and
          (attending ?p)
          (not (free ?p ?t))
        )
      )
    )
  )
)