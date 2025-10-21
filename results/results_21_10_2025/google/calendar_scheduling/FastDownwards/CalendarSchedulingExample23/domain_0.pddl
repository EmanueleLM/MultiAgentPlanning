(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time)

  (:predicates
    (free ?p - person ?t - time)          ; participant is free for the 30-min slot starting at ?t
    (next ?t - time ?t2 - time)           ; ?t2 is the next 30-min slot after ?t
    (occupied ?p - person ?t - time)      ; participant is occupied (booked) at slot ?t
    (meeting-start ?t - time)             ; meeting is scheduled to start at ?t
    (meeting-started)                     ; flag that a meeting has been scheduled
  )

  ;; Single scheduling action. It requires that all named participants be free
  ;; at the chosen start slot and the next consecutive slot (60-minute meeting).
  ;; It also requires that no meeting has already been scheduled.
  (:action schedule-meeting
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (not (meeting-started))
      (next ?t ?t2)
      ;; Billy must be free at both consecutive 30-min slots
      (free billy ?t) (free billy ?t2)
      ;; Maria must be free at both consecutive 30-min slots
      (free maria ?t) (free maria ?t2)
      ;; William must be free at both consecutive 30-min slots
      (free william ?t) (free william ?t2)
    )
    :effect (and
      (meeting-start ?t)
      (meeting-started)
      ;; mark those slots as occupied and remove them from free for each participant
      (occupied billy ?t) (occupied billy ?t2) (not (free billy ?t)) (not (free billy ?t2))
      (occupied maria ?t) (occupied maria ?t2) (not (free maria ?t)) (not (free maria ?t2))
      (occupied william ?t) (occupied william ?t2) (not (free william ?t)) (not (free william ?t2))
    )
  )
)