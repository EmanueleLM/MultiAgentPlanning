(define (domain meeting-scheduling)
  (:requirements :typing :strips)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (attended ?p - person ?s - slot)
    (meeting-at ?s - slot)
  )

  ;; Distinct attend actions per participant (each requires that participant to be free at the chosen slot)
  (:action attend-samantha
    :parameters (?s - slot)
    :precondition (free samantha ?s)
    :effect (attended samantha ?s)
  )

  (:action attend-brian
    :parameters (?s - slot)
    :precondition (free brian ?s)
    :effect (attended brian ?s)
  )

  (:action attend-arthur
    :parameters (?s - slot)
    :precondition (free arthur ?s)
    :effect (attended arthur ?s)
  )

  (:action attend-matthew
    :parameters (?s - slot)
    :precondition (free matthew ?s)
    :effect (attended matthew ?s)
  )

  (:action attend-marilyn
    :parameters (?s - slot)
    :precondition (free marilyn ?s)
    :effect (attended marilyn ?s)
  )

  (:action attend-mark
    :parameters (?s - slot)
    :precondition (free mark ?s)
    :effect (attended mark ?s)
  )

  (:action attend-andrea
    :parameters (?s - slot)
    :precondition (free andrea ?s)
    :effect (attended andrea ?s)
  )

  ;; Finalize action requires all participants to have "attended" the same slot;
  ;; when applied it records the meeting at that slot.
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (attended samantha ?s)
      (attended brian ?s)
      (attended arthur ?s)
      (attended matthew ?s)
      (attended marilyn ?s)
      (attended mark ?s)
      (attended andrea ?s)
    )
    :effect (meeting-at ?s)
  )
)