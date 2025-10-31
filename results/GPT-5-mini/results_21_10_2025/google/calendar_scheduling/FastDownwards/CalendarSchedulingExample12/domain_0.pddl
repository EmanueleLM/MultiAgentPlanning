(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time)

  (:predicates
    (available ?p - person ?t - time)        ; participant is available to start a 60-min meeting at time ?t
    (attended ?p - person ?t - time)         ; participant has committed to attend a meeting starting at ?t
    (meeting-scheduled ?t - time)            ; a meeting has been scheduled to start at ?t
  )

  ;; Participant-specific "attend" actions (keeps participant actions distinct)
  (:action attend-david
    :parameters (?t - time)
    :precondition (and
      (available david ?t)
      (not (attended david ?t))
    )
    :effect (and
      (attended david ?t)
    )
  )

  (:action attend-debra
    :parameters (?t - time)
    :precondition (and
      (available debra ?t)
      (not (attended debra ?t))
    )
    :effect (and
      (attended debra ?t)
    )
  )

  (:action attend-kevin
    :parameters (?t - time)
    :precondition (and
      (available kevin ?t)
      (not (attended kevin ?t))
    )
    :effect (and
      (attended kevin ?t)
    )
  )

  ;; Finalize the meeting once all participants have committed to the same start time
  (:action confirm-meeting
    :parameters (?t - time)
    :precondition (and
      (attended david ?t)
      (attended debra ?t)
      (attended kevin ?t)
      (not (meeting-scheduled ?t))
    )
    :effect (and
      (meeting-scheduled ?t)
    )
  )
)