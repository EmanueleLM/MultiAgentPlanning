(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types participant time)

  (:predicates
    (available ?p - participant ?t - time)
    (attended ?p - participant ?t - time)
    (meeting-scheduled ?t - time)
  )

  ;; Distinct attend actions per participant (requirement: keep participant actions distinct)
  (:action attend-samantha
    :parameters (?t - time)
    :precondition (and (available samantha ?t))
    :effect (and (attended samantha ?t))
  )

  (:action attend-brian
    :parameters (?t - time)
    :precondition (and (available brian ?t))
    :effect (and (attended brian ?t))
  )

  (:action attend-arthur
    :parameters (?t - time)
    :precondition (and (available arthur ?t))
    :effect (and (attended arthur ?t))
  )

  (:action attend-matthew
    :parameters (?t - time)
    :precondition (and (available matthew ?t))
    :effect (and (attended matthew ?t))
  )

  (:action attend-marilyn
    :parameters (?t - time)
    :precondition (and (available marilyn ?t))
    :effect (and (attended marilyn ?t))
  )

  (:action attend-mark
    :parameters (?t - time)
    :precondition (and (available mark ?t))
    :effect (and (attended mark ?t))
  )

  (:action attend-andrea
    :parameters (?t - time)
    :precondition (and (available andrea ?t))
    :effect (and (attended andrea ?t))
  )

  ;; Confirm meeting action: requires all participants to have attended at the same time.
  (:action confirm-meeting
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
    :effect (and (meeting-scheduled ?t))
  )
)