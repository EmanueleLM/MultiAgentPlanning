(define (domain meeting-scheduling)
  ;; Domain for scheduling a single 30-minute meeting on Monday between 09:00 and 17:00.
  ;; Types
  (:requirements :typing)
  (:types person start)

  ;; Predicates:
  ;; (available ?p ?s)     -- person ?p is available to START a 30-minute meeting at slot ?s
  ;; (all-available ?s)    -- every participant is available at slot ?s (precomputed in the problem file)
  ;; (scheduled ?s)        -- a meeting is scheduled at slot ?s (meeting occupies ?s..next half-hour)
  ;; (meeting-scheduled)   -- a meeting has been scheduled (global flag)
  (:predicates
    (available ?p - person ?s - start)
    (all-available ?s - start)
    (scheduled ?s - start)
    (meeting-scheduled)
  )

  ;; Single action to schedule the meeting at a start slot that is available to all participants.
  ;; The all-available predicate is computed in the problem file as the intersection of participants' availabilities.
  (:action schedule-at
    :parameters (?s - start)
    :precondition (and
      (all-available ?s)
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)