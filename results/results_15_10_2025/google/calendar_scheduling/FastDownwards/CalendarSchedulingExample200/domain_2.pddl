(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person time)
  (:predicates
    (free ?p - person ?t - time)
    (work-slot ?t - time)
    (chosen ?t - time)
    (attended ?p - person ?t - time)
    (scheduled ?t - time)
    (meeting-scheduled)
  )

  (:action choose-slot
    :parameters (?t - time)
    :precondition (work-slot ?t)
    :effect (chosen ?t)
  )

  (:action attend-stephen
    :parameters (?t - time)
    :precondition (and (chosen ?t) (free stephen ?t))
    :effect (attended stephen ?t)
  )

  (:action attend-elijah
    :parameters (?t - time)
    :precondition (and (chosen ?t) (free elijah ?t))
    :effect (attended elijah ?t)
  )

  (:action attend-william
    :parameters (?t - time)
    :precondition (and (chosen ?t) (free william ?t))
    :effect (attended william ?t)
  )

  (:action attend-jeremy
    :parameters (?t - time)
    :precondition (and (chosen ?t) (free jeremy ?t))
    :effect (attended jeremy ?t)
  )

  (:action attend-timothy
    :parameters (?t - time)
    :precondition (and (chosen ?t) (free timothy ?t))
    :effect (attended timothy ?t)
  )

  (:action finalize-meeting
    :parameters (?t - time)
    :precondition (and
      (chosen ?t)
      (attended stephen ?t)
      (attended elijah ?t)
      (attended william ?t)
      (attended jeremy ?t)
      (attended timothy ?t)
    )
    :effect (and (meeting-scheduled) (scheduled ?t))
  )
)