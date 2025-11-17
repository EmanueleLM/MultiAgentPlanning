(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    Anthony Pamela Zachary - participant
    s_1330_1430 - slot
  )
  (:init
    ;; Declare participants and the unique audited slot (13:30-14:30)
    (participant Anthony) (participant Pamela) (participant Zachary)
    (slot s_1330_1430)

    ;; Availability facts: all three participants are available for 13:30-14:30.
    ;; These facts reflect the intersection of free windows and respect Pamela's
    ;; preference (no meeting after 14:30). Using a single slot object (the
    ;; audited recommended interval) prevents scheduling any other time.
    (available Anthony s_1330_1430)
    (available Pamela s_1330_1430)
    (available Zachary s_1330_1430)
  )
  ;; Goal: mark the meeting scheduled. The solver must apply the select_slot
  ;; action (which requires explicit availability of all participants).
  (:goal (and (scheduled)))
)