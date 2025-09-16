(define (problem meeting-scheduling-problem)
  (:domain meeting-scheduler-combined)
  (:objects
    ts_1200 ts_1230 - time-slot
    alice bob - person
  )
  (:init
    ; Authorized times (mutually feasible: 12:00 and 12:30)
    (free ts_1200)
    (free ts_1230)

    (within-window ts_1200)
    (within-window ts_1230)

    (slot-available ts_1200)
    (slot-available ts_1230)

    ; No explicit blocks are asserted for these times (open world: not (blocked ...) is true by default)
  )
  (:goal (meeting-scheduled))
)