(define (problem schedule-meeting-monday-orchestrated)
  (:domain meeting-scheduling-orchestrated)

  (:objects
    ;; canonicalized set of candidate 30-minute start times on Monday
    t09_00  t10_00  t10_30  t11_00  t11_30  t13_00  t14_30  t15_00  t16_00 - time
  )

  (:init
    ;; ---------- Agent 1 known available times ----------
    ;; (from Agent 1: t09_00, t10_30, t11_30, t13_00, t15_00)
    (available_a1 t09_00)
    (available_a1 t10_30)
    (available_a1 t11_30)
    (available_a1 t13_00)
    (available_a1 t15_00)

    ;; ---------- Agent 2 known available times ----------
    ;; (from Agent 2: slot_14_30, slot_16_00 -> canonicalized to t14_30, t16_00)
    (available_a2 t14_30)
    (available_a2 t16_00)

    ;; Agent 2 constraints / knowledge
    ;; Meeting duration requirement (30 minutes)
    (meeting-duration-30)

    ;; Mark within-hours for all candidate times that fall between 09:00 and 17:00
    (within-hours t09_00)
    (within-hours t10_00)
    (within-hours t10_30)
    (within-hours t11_00)
    (within-hours t11_30)
    (within-hours t13_00)
    (within-hours t14_30)
    (within-hours t15_00)
    (within-hours t16_00)

    ;; ---------- Agent 3 (Helen) known available times & preference ----------
    ;; (from Agent 3: t_09_00, t_10_00, t_10_30, t_11_00, t_13_00)
    (available_a3 t09_00)
    (available_a3 t10_00)
    (available_a3 t10_30)
    (available_a3 t11_00)
    (available_a3 t13_00)

    ;; Helen's model: "do not meet after 13:30" => allowed starts are those beginning on or before 13:00
    (before13_30 t09_00)
    (before13_30 t10_00)
    (before13_30 t10_30)
    (before13_30 t11_00)
    (before13_30 t11_30)
    (before13_30 t13_00)

    ;; Meeting not scheduled yet according to Agent 3
    (unscheduled)

    ;; Note: We preserve agents' distinct availability facts so their actions remain meaningful.
    ;; To produce a meeting that respects all constraints/preferences we provide a joint-schedule
    ;; action (see domain) that requires availability for Agent 1 & Agent 3, within-hours and
    ;; meeting-duration-30 (Agent 2 constraints), and Helen's before13_30 preference.
  )

  ;; Goal: a meeting has been scheduled (we use the global meeting-scheduled predicate)
  (:goal (meeting-scheduled))
)