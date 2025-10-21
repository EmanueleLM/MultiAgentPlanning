(define (domain meeting-scheduling-30min)
  ; Domain encoding for scheduling a one-hour (60 min) meeting using 30-minute discretized slots.
  ; Compatible with Fast Downward: uses :strips, :typing, :negative-preconditions.
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    ; participant ?p is available for the entire 60-minute meeting starting at slot ?s
    (available ?p - participant ?s - slot)

    (meeting ?m - meeting)
    (meeting-at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)

    (meeting-scheduled ?s - slot)
  )

  ; Action to schedule the meeting. 
  ; It enforces that all required participants (stephen, edward, angela) are available
  ; for the chosen start slot. The domain uses explicit participant names in the precondition
  ; to ensure the meeting involves exactly those three participants.
  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
                    (meeting ?m)
                    (slot ?s)
                    (not (scheduled ?m))
                    (not (meeting-scheduled ?s))
                    ; The following three facts require that each named participant
                    ; is available for the full one-hour meeting starting at ?s.
                    (available stephen ?s)
                    (available edward ?s)
                    (available angela ?s)
                  )
    :effect (and
              (meeting-at ?m ?s)
              (scheduled ?m)
              (meeting-scheduled ?s)
            )
  )
)