(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (unscheduled)
    (scheduled ?s - slot)
    (free ?p - participant ?s - slot)
    (next ?s - slot ?n - slot)
    (earliest-available ?s - slot)
  )

  ;; Schedule action: requires the chosen start slot to be marked as the earliest feasible
  ;; and requires that each participant is free in both half-hour slots that the 60-minute
  ;; meeting will occupy (?s and its successor ?n). Effects mark the meeting scheduled.
  (:action schedule-meeting
    :parameters (?s - slot ?n - slot)
    :precondition (and
      (unscheduled)
      (earliest-available ?s)
      (next ?s ?n)
      ;; per-agent availability (hard constraints encoded)
      (free thomas ?s) (free thomas ?n)
      (free dylan ?s)  (free dylan ?n)
      (free jerry ?s)  (free jerry ?n)
    )
    :effect (and
      (not (unscheduled))
      (scheduled ?s)
    )
  )
)