(define (problem schedule-60min-meeting-all)
  (:domain integrated-meeting-planning)

  (:objects
    thomas dylan jerry - participant
    monday - day

    ;; half-hour time points from 09:00 to 16:30 (starts). A 60-min meeting occupies two consecutive slots.
    t9_00  t9_30  t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time

    d60 - duration
  )

  (:init
    ;; participants and day
    (participant thomas) (participant dylan) (participant jerry)
    (day monday)

    ;; temporal succession (30-minute steps)
    (next t9_00 t9_30)   (next t9_30 t10_00) (next t10_00 t10_30) (next t10_30 t11_00)
    (next t11_00 t11_30) (next t11_30 t12_00) (next t12_00 t12_30) (next t12_30 t13_00)
    (next t13_00 t13_30) (next t13_30 t14_00) (next t14_00 t14_30) (next t14_30 t15_00)
    (next t15_00 t15_30) (next t15_30 t16_00) (next t16_00 t16_30)

    ;; in-work-hours: valid meeting start times for a 60-minute meeting between 09:00 and 17:00
    (in-work-hours t9_00) (in-work-hours t9_30) (in-work-hours t10_00) (in-work-hours t10_30)
    (in-work-hours t11_00) (in-work-hours t11_30) (in-work-hours t12_00) (in-work-hours t12_30)
    (in-work-hours t13_00) (in-work-hours t13_30) (in-work-hours t14_00) (in-work-hours t14_30)
    (in-work-hours t15_00) (in-work-hours t15_30) (in-work-hours t16_00)

    ;; Public feasibility facts (agent1 / agent2): there exists a feasible meeting time.
    (feasible-exists)

    ;; Choose a concrete feasible start slot that fits all participants (resolve ambiguities to one concrete choice).
    ;; We pick t14_30 as the feasible 60-minute start (covers t14_30 and t15_00).
    (feasible-slot t14_30)
    (slot-on-day t14_30 monday)
    (slot-duration t14_30 d60)

    ;; Known availability / busy facts provided by agents (integrated)
    ;; Agent 2 (Dylan): busy t10_30 and t13_30 (so free on others except those busy)
    (free dylan t9_00) (free dylan t9_30) (free dylan t10_00)
    ;; t10_30 busy (no free fact)
    (free dylan t11_00) (free dylan t11_30) (free dylan t12_00) (free dylan t12_30)
    (free dylan t13_00)
    ;; t13_30 busy (no free fact)
    (free dylan t14_00) (free dylan t14_30) (free dylan t15_00) (free dylan t15_30)
    (free dylan t16_00) (free dylan t16_30)

    ;; Agent 3 (Jerry): known availability is declared for Jerry only
    (known jerry)
    ;; Jerry's known free slots (derived from his busy windows as provided by agent3)
    (free jerry t11_00)
    (free jerry t14_30)
    (free jerry t15_00)
    (free jerry t15_30)

    ;; Agent 1: Thomas is known to be free on Monday (day-level). We materialize slot-level frees
    ;; for the chosen feasible start (t14_30 and t15_00) so Thomas can attend the chosen meeting time.
    (free-on thomas monday)
    (free thomas t14_30)
    (free thomas t15_00)
  )

  ;; Goal: schedule a 60-minute meeting on Monday between 09:00-17:00 that all participants can attend.
  ;; We request a concrete schedule at the resolved feasible start t14_30 (covers t14_30 & t15_00).
  (:goal (and
    (meeting-scheduled)
    (meeting-at t14_30)
    (scheduled-day monday)
    (slot-duration t14_30 d60)
  ))
)