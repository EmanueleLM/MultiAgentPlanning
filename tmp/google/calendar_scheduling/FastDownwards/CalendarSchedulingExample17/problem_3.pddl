(define (problem meeting-scheduling-problem)
  (:domain meeting-scheduler-combined)
  (:objects
    ts_1200 ts_1230 - time-slot
    margaret donna helen - person
  )
  (:init
    (free ts_1200)
    (free ts_1230)

    (within-window ts_1200)
    (within-window ts_1230)

    (slot-available ts_1200)
    (slot-available ts_1230)
  )
  (:goal (meeting-scheduled))
)