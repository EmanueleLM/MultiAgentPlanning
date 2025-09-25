(define (domain integrated-scheduling)
  (:requirements :typing :strips)
  (:types slot person meeting)
  (:predicates
    (is-slot ?s - slot)
    (slot-available ?s - slot)
    (free-joyce ?s - slot)
    (free-christine ?s - slot)
    (free-alexander ?s - slot)
    (is-meeting ?m - meeting)
    (attends ?p - person ?m - meeting)
    (ack-joyce ?m - meeting ?s - slot)
    (ack-christine ?m - meeting ?s - slot)
    (ack-alexander ?m - meeting ?s - slot)
    (scheduled ?m - meeting ?s - slot)
    (meeting-confirmed ?m - meeting)
  )

  (:action acknowledge-joyce
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (is-meeting ?m)
      (is-slot ?s)
      (attends joyce ?m)
      (free-joyce ?s)
    )
    :effect (and
      (ack-joyce ?m ?s)
    )
  )

  (:action acknowledge-christine
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (is-meeting ?m)
      (is-slot ?s)
      (attends christine ?m)
      (free-christine ?s)
    )
    :effect (and
      (ack-christine ?m ?s)
    )
  )

  (:action acknowledge-alexander
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (is-meeting ?m)
      (is-slot ?s)
      (attends alexander ?m)
      (free-alexander ?s)
    )
    :effect (and
      (ack-alexander ?m ?s)
    )
  )

  (:action confirm-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
      (is-meeting ?m)
      (is-slot ?s)
      (slot-available ?s)
      (ack-joyce ?m ?s)
      (ack-christine ?m ?s)
      (ack-alexander ?m ?s)
    )
    :effect (and
      (scheduled ?m ?s)
      (meeting-confirmed ?m)
      (not (slot-available ?s))
    )
  )
)