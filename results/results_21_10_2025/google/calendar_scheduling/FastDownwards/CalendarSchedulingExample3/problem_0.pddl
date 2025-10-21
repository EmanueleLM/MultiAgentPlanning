(define (problem schedule-monday-2025-10-20)
  (:domain meeting-scheduling)

  ;; Objects: we include only the explicit 60-minute start slot that is free for all
  ;; participants according to the provided availability reports (Monday 09:30).
  ;; Slot name includes the date/time ISO-ish token to avoid ambiguity.
  (:objects
    slot-2025-10-20T09:30 - slot
  )

  ;; Initial facts: per-agent availability facts derived strictly from the supplied reports.
  ;; These assert that the single candidate slot (2025-10-20T09:30) is free for each agent.
  ;; No other availability is invented or asserted.
  (:init
    (free-arthur slot-2025-10-20T09:30)    ; Arthur: Monday 09:30-10:30 free (from report)
    (free-michael slot-2025-10-20T09:30)  ; Michael: 09:00-12:00 window includes 09:30 (from report)
    (free-samantha slot-2025-10-20T09:30) ; Samantha: 09:30-10:30 listed as candidate (from report)
  )

  ;; Goal: schedule exactly one meeting (the domain enforces single meeting via meeting-scheduled flag).
  (:goal
    (meeting-scheduled)
  )
)