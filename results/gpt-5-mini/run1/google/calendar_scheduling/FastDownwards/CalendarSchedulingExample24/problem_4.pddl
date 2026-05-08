(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    benjamin hannah brenda - person
    meeting1 - meeting
    s_09_00 - slot
  )

  (:init
    ;; availabilities normalized for Monday 09:00-17:00 and 30-minute meeting duration
    ;; Benjamin: free entire day but prefers not after 09:30 -> enforce start at or before 09:30 by providing only early slots
    ;; Hannah: free entire day
    ;; Brenda: busy 09:30-10:00, 11:30-12:30, 14:00-16:30 -> available at 09:00-09:30
    (available benjamin s_09_00)
    (available hannah s_09_00)
    (available brenda s_09_00)
  )

  (:goal
    (and
      (meeting-scheduled meeting1)
      (meeting-start meeting1 s_09_00)
      (accepted meeting1 benjamin)
      (accepted meeting1 hannah)
      (accepted meeting1 brenda)
    )
  )
)