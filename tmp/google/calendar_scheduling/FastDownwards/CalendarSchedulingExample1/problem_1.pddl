(define (problem schedule-meeting-ray-bil-don)
  (:domain multiagent-meeting)

  (:objects
    raymond billy donald - agent
    s9 s10 s11 s14 - slot
  )

  (:init
    ;; Work-hour availability (within work hours)
    ;; Raymond is available at 9, 10, 11
    (available raymond s9)
    (available raymond s10)
    (available raymond s11)

    ;; Billy is available at 10, 11, 14
    (available billy s10)
    (available billy s11)
    (available billy s14)

    ;; Donald is available at 10, 11
    (available donald s10)
    (available donald s11)

    ;; Preferences (soft, encoded via action costs)
    (preferred raymond s10)
    (preferred billy s10)
    (preferred donald s11)
  )

  ;; Goal: schedule a meeting (confirm action sets meeting-scheduled)
  (:goal (meeting-scheduled))

  ;; Use action-costs optimization (planner minimizes sum of action costs)
  (:metric minimize (total-cost))
)