(define (domain meeting-scheduling)
  ; Domain for scheduling a one-hour meeting into discrete hourly slots.
  ; Compatible with FastDownwards: only uses :strips, :typing, :negative-preconditions.
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot meeting)

  (:predicates
    (participant ?p - participant)
    (slot ?s - slot)
    ; participant ?p is available for the whole one-hour slot ?s
    (available ?p - participant ?s - slot)
    ; a special predicate asserting that a slot is feasible for the meeting
    ; i.e., every required participant is available at ?s (this will be computed
    ; and specified in the problem file from the availability reports).
    (slot-feasible ?s - slot)

    ; meeting objects and their scheduled slot
    (meeting ?m - meeting)
    (meeting-at ?m - meeting ?s - slot)
    (scheduled ?m - meeting)

    ; marker that a slot is already used for a scheduled meeting
    (meeting-scheduled ?s - slot)
  )

  ; Single action to schedule a meeting object into a feasible slot.
  ; Preconditions require the slot to be marked feasible in the problem (slot-feasible).
  (:action schedule-meeting
    :parameters (?m - meeting ?s - slot)
    :precondition (and
                    (meeting ?m)
                    (slot ?s)
                    (slot-feasible ?s)
                    (not (scheduled ?m))
                    (not (meeting-scheduled ?s))
                  )
    :effect (and
              (meeting-at ?m ?s)
              (scheduled ?m)
              (meeting-scheduled ?s)
            )
  )
)