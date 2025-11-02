(define (domain meeting-scheduling)
  (:requirements :adl :typing :negative-preconditions)
  (:types time)
  (:predicates
    (slot ?t - time)

    ; scott's predicates and actions namespace
    (scott-busy ?t - time)
    (scott-approved ?t - time)

    ; gabriel's predicates and actions namespace
    (gabriel-busy ?t - time)
    (gabriel-approved ?t - time)

    ; christine's predicates and actions namespace
    (christine-busy ?t - time)
    (christine-approved ?t - time)

    ; global meeting predicate
    (meeting-scheduled ?t - time)
  )

  ; scott approves a specific timeslot if not busy there
  (:action scott-approve
    :parameters (?t - time)
    :precondition (and (slot ?t) (not (scott-busy ?t)) (not (scott-approved ?t)) (not (meeting-scheduled ?t)))
    :effect (scott-approved ?t)
  )

  ; gabriel approves a specific timeslot if not busy there (gabriel reported no busies)
  (:action gabriel-approve
    :parameters (?t - time)
    :precondition (and (slot ?t) (not (gabriel-busy ?t)) (not (gabriel-approved ?t)) (not (meeting-scheduled ?t)))
    :effect (gabriel-approved ?t)
  )

  ; christine approves a specific timeslot if not busy there
  (:action christine-approve
    :parameters (?t - time)
    :precondition (and (slot ?t) (not (christine-busy ?t)) (not (christine-approved ?t)) (not (meeting-scheduled ?t)))
    :effect (christine-approved ?t)
  )

  ; finalize the meeting once all agents have approved the same slot
  (:action finalize-meeting
    :parameters (?t - time)
    :precondition (and (slot ?t) (scott-approved ?t) (gabriel-approved ?t) (christine-approved ?t) (not (meeting-scheduled ?t)))
    :effect (meeting-scheduled ?t)
  )
)