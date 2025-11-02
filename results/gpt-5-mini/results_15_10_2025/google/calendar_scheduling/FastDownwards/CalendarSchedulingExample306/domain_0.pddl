(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time)

  (:predicates
    (slot ?t - time)
    (person ?p - person)
    (available ?p - person ?t - time)  ; participant is available at this start time
    (scheduled ?t - time)              ; meeting scheduled at this time
    (meeting-scheduled)                ; a meeting has been scheduled
  )

  ;; Schedule action: schedule a meeting at a given time if every named participant is available
  ;; NOTE: participants are referenced explicitly in the precondition to keep roles distinct.
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (slot ?t)
      (not (meeting-scheduled))
      ;; explicit availability requirements for each participant (must be present in the problem)
      (available donald ?t)
      (available zachary ?t)
      (available kathryn ?t)
      (available deborah ?t)
      (available teresa ?t)
      (available james ?t)
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?t)
    )
  )
)