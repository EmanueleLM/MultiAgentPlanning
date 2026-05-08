(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)

  (:predicates
    (free ?p - person ?t - timeslot)
    (candidate ?t - timeslot)
    (scheduled ?t - timeslot)
    (meeting-scheduled)
  )

  ;; This action schedules the meeting only when the three required participants
  ;; (brian, billy, patricia) are all free at the chosen candidate timeslot and
  ;; when no meeting has yet been scheduled. Using the three participant names
  ;; here enforces that the scheduled meeting includes all three people.
  (:action schedule-meeting
    :parameters (?t - timeslot)
    :precondition (and
      (candidate ?t)
      (free brian ?t)
      (free billy ?t)
      (free patricia ?t)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?t)
      (meeting-scheduled)
    )
  )
)