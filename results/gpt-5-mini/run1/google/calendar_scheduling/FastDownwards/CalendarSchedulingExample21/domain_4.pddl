(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (free ?p - person ?s - slot)
    (seq4 ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot)
    (meeting_scheduled)
    (meeting_start ?s - slot)
  )

  ;; A single action that schedules the one-hour meeting (four consecutive 15-min slots).
  ;; This domain is specific to the three participants of the instance (bobby, scott, kimberly).
  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot)
    :precondition (and
      (seq4 ?s1 ?s2 ?s3 ?s4)
      ;; all participants must be free for each of the four consecutive slots
      (free bobby ?s1) (free bobby ?s2) (free bobby ?s3) (free bobby ?s4)
      (free scott ?s1) (free scott ?s2) (free scott ?s3) (free scott ?s4)
      (free kimberly ?s1) (free kimberly ?s2) (free kimberly ?s3) (free kimberly ?s4)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s1)
      ;; occupy those slots for each participant (delete free facts)
      (not (free bobby ?s1)) (not (free bobby ?s2)) (not (free bobby ?s3)) (not (free bobby ?s4))
      (not (free scott ?s1)) (not (free scott ?s2)) (not (free scott ?s3)) (not (free scott ?s4))
      (not (free kimberly ?s1)) (not (free kimberly ?s2)) (not (free kimberly ?s3)) (not (free kimberly ?s4))
    )
  )
)