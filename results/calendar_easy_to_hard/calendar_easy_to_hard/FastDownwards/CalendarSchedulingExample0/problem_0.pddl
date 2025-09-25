(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  (:objects
    michelle steven jerry - agent
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 t17_00 - time
  )

  (:init
    ;; next relations (30-minute increments)
    (next t9_00  t9_30)  (next t9_30  t10_00)
    (next t10_00 t10_30) (next t10_30 t11_00)
    (next t11_00 t11_30) (next t11_30 t12_00)
    (next t12_00 t12_30) (next t12_30 t13_00)
    (next t13_00 t13_30) (next t13_30 t14_00)
    (next t14_00 t14_30) (next t14_30 t15_00)
    (next t15_00 t15_30) (next t15_30 t16_00)
    (next t16_00 t16_30) (next t16_30 t17_00)

    ;; PUBLIC: work hours are 9:00-17:00 (represented by available start times in the time objects above)
    ;; Meeting duration required: 60 minutes (encoded by requiring two consecutive half-hour blocks: t and next t)

    ;; PRIVATE / BUSY intervals encoded as unavailable half-hour blocks:
    ;; michelle: busy Monday 11:00-12:00 -> blocks 11:00 and 11:30
    (busy michelle t11_00)
    (busy michelle t11_30)

    ;; steven: busy 9:00-9:30, 11:30-12:00, 13:30-14:00, 15:30-16:00
    (busy steven t9_00)
    (busy steven t11_30)
    (busy steven t13_30)
    (busy steven t15_30)

    ;; jerry: busy 9:00-9:30, 10:00-11:00, 11:30-12:30, 13:00-14:30, 15:30-16:00, 16:30-17:00
    ;; break these into half-hour blocks
    (busy jerry t9_00)
    (busy jerry t10_00)
    (busy jerry t10_30)
    (busy jerry t11_30)
    (busy jerry t12_00)
    (busy jerry t13_00)
    (busy jerry t13_30)
    (busy jerry t14_00)
    (busy jerry t15_30)
    (busy jerry t16_30)

    ;; No other busy facts are asserted; any slot not marked busy is treated as available for that agent.
    ;; The domain actions will allow each agent to confirm any start time t where both t and next t are not busy for that agent.
    ;; The meeting is finalized only when all three have confirmed the same start time t.

    ;; Note: per provided information, there exists at least one common free slot.
    ;; The earliest feasible common 60-minute slot given the above busy intervals is 14:30-15:30 (t14_30 -> t15_00).
  )

  ;; Goal: finalize the meeting at the earliest feasible start time found (14:30).
  (:goal (meeting-finalized t14_30))
)