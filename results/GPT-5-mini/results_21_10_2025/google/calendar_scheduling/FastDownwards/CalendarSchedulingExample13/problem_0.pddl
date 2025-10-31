(define (problem schedule-monday)
  (:domain schedule-meeting)
  (:objects
    gerald barbara - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s14_00 s14_30 s15_00 s15_30 - slot
  )

  (:init
    ;; Gerald's availability (derived from the provided data).
    ;; Preferred (after 13:00)
    (available gerald s14_00)
    (available gerald s14_30)
    (available gerald s15_30)
    ;; Available but prefer to avoid (before 13:00)
    (available gerald s09_30)
    (available gerald s10_00)
    (available gerald s10_30)
    (available gerald s11_00)
    (available gerald s11_30)
    (available gerald s12_00)
    (available gerald s12_30)

    ;; Barbara's availability (as provided).
    (available barbara s09_00)
    (available barbara s10_00)
    (available barbara s10_30)
    (available barbara s11_00)
    (available barbara s14_00)
    (available barbara s15_00)

    ;; Gerald's strict preference encoded as a hard constraint:
    ;; treat "prefer to avoid before 13:00" and the explicitly stated preferred slots as strict.
    ;; Only the following slots are acceptable under Gerald's preference:
    (gerald-pref s14_00)
    (gerald-pref s14_30)
    (gerald-pref s15_30)
  )

  ;; Goal: one meeting must be scheduled (the schedule action sets (scheduled)).
  (:goal (scheduled))
)