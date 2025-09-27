(define (domain schedule-meeting)
  (:requirements :strips :typing)
  (:types person time)

  (:constants samantha brian arthur matthew marilyn mark andrea - person)

  (:predicates
    (free ?p - person ?t - time)
    (attended ?p - person ?t - time)
    (meeting-scheduled ?t - time)
  )

  (:action attend-samantha
    :parameters (?t - time)
    :precondition (free samantha ?t)
    :effect (attended samantha ?t)
  )

  (:action attend-brian
    :parameters (?t - time)
    :precondition (free brian ?t)
    :effect (attended brian ?t)
  )

  (:action attend-arthur
    :parameters (?t - time)
    :precondition (free arthur ?t)
    :effect (attended arthur ?t)
  )

  (:action attend-matthew
    :parameters (?t - time)
    :precondition (free matthew ?t)
    :effect (attended matthew ?t)
  )

  (:action attend-marilyn
    :parameters (?t - time)
    :precondition (free marilyn ?t)
    :effect (attended marilyn ?t)
  )

  (:action attend-mark
    :parameters (?t - time)
    :precondition (free mark ?t)
    :effect (attended mark ?t)
  )

  (:action attend-andrea
    :parameters (?t - time)
    :precondition (free andrea ?t)
    :effect (attended andrea ?t)
  )

  (:action finalize-meeting
    :parameters (?t - time)
    :precondition (and
      (attended samantha ?t)
      (attended brian ?t)
      (attended arthur ?t)
      (attended matthew ?t)
      (attended marilyn ?t)
      (attended mark ?t)
      (attended andrea ?t)
    )
    :effect (meeting-scheduled ?t)
  )
)