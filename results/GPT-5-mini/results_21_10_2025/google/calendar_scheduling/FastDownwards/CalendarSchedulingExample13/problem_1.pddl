(define (problem schedule-monday)
  (:domain schedule-meeting)
  (:objects
    gerald roy barbara - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Gerald's availability (derived from Gerald's busy times):
    ;; Gerald is busy 09:00-09:30, 13:00-14:00, 15:00-15:30, 16:00-17:00.
    ;; Available 30-min start slots:
    (available gerald s09_30)
    (available gerald s10_00)
    (available gerald s10_30)
    (available gerald s11_00)
    (available gerald s11_30)
    (available gerald s12_00)
    (available gerald s12_30)
    (available gerald s14_00)
    (available gerald s14_30)
    (available gerald s15_30)

    ;; Roy is free the entire work day (all 30-min slots).
    (available roy s09_00)
    (available roy s09_30)
    (available roy s10_00)
    (available roy s10_30)
    (available roy s11_00)
    (available roy s11_30)
    (available roy s12_00)
    (available roy s12_30)
    (available roy s13_00)
    (available roy s13_30)
    (available roy s14_00)
    (available roy s14_30)
    (available roy s15_00)
    (available roy s15_30)
    (available roy s16_00)
    (available roy s16_30)

    ;; Barbara's availability (derived from Barbara's busy times):
    ;; Barbara is busy 09:30-10:00, 11:30-14:00, 14:30-15:00, 15:30-17:00.
    ;; Available 30-min start slots:
    (available barbara s09_00)
    (available barbara s10_00)
    (available barbara s10_30)
    (available barbara s11_00)
    (available barbara s14_00)
    (available barbara s15_00)

    ;; Gerald's preference: prefers to avoid meetings before 13:00 on Monday.
    ;; Encode preference as a hard requirement: only slots Gerald accepts at/after 13:00 are marked.
    ;; Gerald is only available at/after 13:00 for these starts: 14:00, 14:30, 15:30 (16:00/16:30 are blocked by Gerald's busy times).
    (gerald-pref s14_00)
    (gerald-pref s14_30)
    (gerald-pref s15_30)
  )

  ;; Goal: schedule a single meeting (the action sets (scheduled)).
  (:goal (scheduled))
)