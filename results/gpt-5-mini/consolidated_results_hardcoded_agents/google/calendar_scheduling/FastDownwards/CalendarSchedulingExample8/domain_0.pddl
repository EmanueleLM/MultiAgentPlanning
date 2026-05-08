(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (free ?p - participant ?t - timeslot)
    (occupied ?p - participant ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )

  ;; Schedule a single 30-minute meeting for three participants at a timeslot.
  ;; Preconditions require the three participants to be free at that timeslot
  ;; and that no meeting has yet been scheduled. Effects mark the timeslot
  ;; scheduled, mark the participants occupied for that timeslot, remove their free facts,
  ;; and set a global meeting-scheduled flag so only one meeting can be scheduled.
  (:action schedule-meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?t - timeslot)
    :precondition (and
                    (not (meeting-scheduled))
                    (free ?p1 ?t)
                    (free ?p2 ?t)
                    (free ?p3 ?t)
                 )
    :effect (and
              (meeting-scheduled)
              (scheduled ?t)
              (occupied ?p1 ?t) (occupied ?p2 ?t) (occupied ?p3 ?t)
              (not (free ?p1 ?t)) (not (free ?p2 ?t)) (not (free ?p3 ?t))
            )
  )
)