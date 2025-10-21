(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  ;; Named participants are declared as domain constants so actions can require their availability directly.
  (:constants
    brandon jerry bradley - participant
  )

  (:predicates
    (available ?p - participant ?s - slot)   ; participant ?p is available at slot ?s
    (scheduled ?s - slot)                   ; the meeting is scheduled at slot ?s
    (meeting-scheduled)                     ; marker that a meeting time has been chosen
  )

  ;; Choose a single slot where all participants are available.
  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available brandon ?s)
      (available jerry ?s)
      (available bradley ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)