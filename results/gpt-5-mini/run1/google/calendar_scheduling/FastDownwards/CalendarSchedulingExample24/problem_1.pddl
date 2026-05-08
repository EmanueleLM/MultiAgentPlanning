(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    benjamin hannah brenda - person
    meeting1 - meeting
    s_09_00 - slot
  )

  (:init
    ;; Feasible 30-minute meeting start derived from validated availabilities:
    ;; Benjamin prefers not to meet after 09:30, Brenda has a busy interval at 09:30-10:00,
    ;; so the only feasible start satisfying all hard constraints is 09:00.
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