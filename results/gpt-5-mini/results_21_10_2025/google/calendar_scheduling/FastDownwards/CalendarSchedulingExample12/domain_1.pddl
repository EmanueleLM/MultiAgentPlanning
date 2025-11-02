(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time)

  (:predicates
    (available ?p - person ?t - time)        ; participant is available to start a 60-min meeting at time ?t
    (attended ?p - person ?t - time)         ; participant has committed to attend a meeting starting at ?t
    (meeting-scheduled ?t - time)            ; a meeting has been scheduled to start at ?t
    (meeting-confirmed)                      ; a meeting has been confirmed (any valid start time)
  )

  ;; Participant-specific attend actions (distinct per participant)
  (:action attend-david
    :parameters (?t - time)
    :precondition (and
      (available david ?t)
      (not (attended david ?t))
      (not (meeting-confirmed)) ;; don't attend after meeting already confirmed
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
      (not (meeting-confirmed))
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
      (not (meeting-confirmed))
    )
    :effect (and
      (attended kevin ?t)
    )
  )

  ;; Confirm the meeting once all participants have attended at the same start time.
  ;; Only allowed if no meeting has been confirmed yet.
  (:action confirm-meeting
    :parameters (?t - time)
    :precondition (and
      (attended david ?t)
      (attended debra ?t)
      (attended kevin ?t)
      (not (meeting-confirmed))
      (not (meeting-scheduled ?t))
    )
    :effect (and
      (meeting-scheduled ?t)
      (meeting-confirmed)
    )
  )
)