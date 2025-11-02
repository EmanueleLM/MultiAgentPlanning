(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time)

  (:predicates
    (free ?p - person ?t - time)        ; participant is free for the 30-min slot starting at ?t
    (next ?t - time ?t2 - time)        ; ?t2 is the next 30-min slot after ?t
    (occupied ?p - person ?t - time)   ; participant occupies slot ?t (meeting)
    (meeting-start ?t - time)          ; meeting is scheduled to start at ?t
    (meeting-started)                  ; flag indicating a meeting has been scheduled
  )

  ;; Schedule a 60-minute meeting: requires two consecutive 30-min slots free for every participant.
  (:action schedule-meeting
    :parameters (?t - time ?t2 - time)
    :precondition (and
      (not (meeting-started))
      (next ?t ?t2)
      (free billy ?t) (free billy ?t2)
      (free maria ?t) (free maria ?t2)
      (free william ?t) (free william ?t2)
    )
    :effect (and
      (meeting-start ?t)
      (meeting-started)

      ;; mark slots as occupied and remove them from free for each participant
      (occupied billy ?t) (occupied billy ?t2) (not (free billy ?t)) (not (free billy ?t2))
      (occupied maria ?t) (occupied maria ?t2) (not (free maria ?t)) (not (free maria ?t2))
      (occupied william ?t) (occupied william ?t2) (not (free william ?t)) (not (free william ?t2))
    )
  )
)