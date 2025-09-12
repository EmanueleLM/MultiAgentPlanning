(define (problem schedule-joint-meeting)
  (:domain integrated-scheduling)
  (:objects
    ts9_00_9_30 ts9_30_10_00 ts10_00_10_30 ts10_30_11_00
    ts11_00_11_30 ts11_30_12_00 ts12_00_12_30 ts12_30_13_00
    ts13_00_13_30 ts13_30_14_00 ts14_00_14_30 ts14_30_15_00
    ts15_00_15_30 ts15_30_16_00 ts16_00_16_30 ts16_30_17_00
    - time-slot
    s9_0 s9_30 s10_0 s10_30 s14_30 s15_00
    - slot
  )
  (:init
    (time-slot ts9_00_9_30) (blocked ts9_00_9_30)
    (time-slot ts9_30_10_00) (free ts9_30_10_00)
    (time-slot ts10_00_10_30) (blocked ts10_00_10_30)
    (time-slot ts10_30_11_00) (free ts10_30_11_00)
    (available s9_0 s10_30)
    (not (available s9_30 s9_30))
    (not (available s10_0 s10_0))
    (preferred ts14_30_15_00)
    (available s14_30 s15_00)
  )
  (:goal
    (and
      (exists (?t - time-slot) (and (time-slot ?t) (free ?t)))
      (exists (?hour ?min - slot) (meeting-scheduled ?hour ?min))
      (scheduled s14_30 s15_00)
    )
  )
  (:metric minimize (total-cost))
)