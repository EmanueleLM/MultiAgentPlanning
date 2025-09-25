(define (domain meeting-scheduling)
  (:requirements :strips :negative-preconditions)
  (:constants joyce christine alexander)
  (:predicates
    (slot ?s)
    (within-hours ?s)
    (participant ?p)
    (busy ?p ?s)
    (meeting ?m)
    (meeting-duration-30)
    (attends-joyce ?m ?s)
    (attends-christine ?m ?s)
    (attends-alexander ?m ?s)
    (scheduled_at ?m ?s)
    (scheduled_slot ?s)
  )

  (:action attend-joyce
    :parameters (?m ?s)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (within-hours ?s)
      (not (busy joyce ?s))
      (not (attends-joyce ?m ?s))
    )
    :effect (attends-joyce ?m ?s)
  )

  (:action attend-christine
    :parameters (?m ?s)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (within-hours ?s)
      (not (busy christine ?s))
      (not (attends-christine ?m ?s))
    )
    :effect (attends-christine ?m ?s)
  )

  (:action attend-alexander
    :parameters (?m ?s)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (within-hours ?s)
      (not (busy alexander ?s))
      (not (attends-alexander ?m ?s))
    )
    :effect (attends-alexander ?m ?s)
  )

  (:action finalize-meeting
    :parameters (?m ?s)
    :precondition (and
      (meeting ?m)
      (slot ?s)
      (within-hours ?s)
      (meeting-duration-30)
      (attends-joyce ?m ?s)
      (attends-christine ?m ?s)
      (attends-alexander ?m ?s)
      (not (scheduled_slot ?s))
    )
    :effect (and
      (scheduled_at ?m ?s)
      (scheduled_slot ?s)
    )
  )
)