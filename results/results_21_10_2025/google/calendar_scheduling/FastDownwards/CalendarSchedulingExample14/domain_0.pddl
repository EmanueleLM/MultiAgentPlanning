(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:constants
    brandon other - participant
  )

  (:predicates
    (available ?p - participant ?s - slot)   ; participant ?p is available at slot ?s
    (scheduled ?s - slot)                   ; the meeting is scheduled at slot ?s
    (meeting-scheduled)                     ; marker that a meeting time has been chosen
  )

  ;; Schedule action: can choose a slot only if both named participants are available
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available other ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)