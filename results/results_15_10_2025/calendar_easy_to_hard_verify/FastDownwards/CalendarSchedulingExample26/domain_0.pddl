(define (domain meeting-scheduling)
  (:requirements :typing :adl)
  (:types participant timeslot meeting)

  (:predicates
    (participant ?p - participant)
    (timeslot ?t - timeslot)
    (workslot ?t - timeslot)           ; t is inside work hours
    (free ?p - participant ?t - timeslot)   ; participant p is available at timeslot t
    (occupied ?p - participant ?t - timeslot) ; participant p occupied at timeslot t
    (meeting-at ?t - timeslot)         ; meeting is scheduled at timeslot t
    (next ?t1 - timeslot ?t2 - timeslot) ; temporal ordering of slots: t2 immediately follows t1
  )

  ; The only action schedules a single meeting of fixed duration = one timeslot.
  ; Preconditions: the chosen timeslot must be a workslot and every participant must be free at that slot.
  ; Effects: mark meeting-at that slot and mark each participant occupied for that slot.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
                    (workslot ?t)
                    (forall (?p - participant) (free ?p ?t))
                  )
    :effect (and
              (meeting-at ?t)
              ; For each participant, if they were free on t, they become occupied and no longer free.
              (forall (?p - participant)
                (when (free ?p ?t)
                      (and (not (free ?p ?t)) (occupied ?p ?t))
                )
              )
            )
  )
)