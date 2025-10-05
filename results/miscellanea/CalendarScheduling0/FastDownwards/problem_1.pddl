(define (problem schedule-monday)
  (:domain calendar-scheduling)
  (:objects
    michelle steven jerry - agent
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 - time
  )
  (:init
    (avail michelle t_09_00) (avail michelle t_09_30) (avail michelle t_10_00) (avail michelle t_12_00) (avail michelle t_12_30) (avail michelle t_13_00) (avail michelle t_13_30) (avail michelle t_14_00) (avail michelle t_14_30) (avail michelle t_15_00) (avail michelle t_15_30) (avail michelle t_16_00)
    (avail steven t_09_30) (avail steven t_10_00) (avail steven t_10_30) (avail steven t_12_00) (avail steven t_12_30) (avail steven t_14_00) (avail steven t_14_30) (avail steven t_16_00)
    (avail jerry t_14_30)
  )
  (:goal (and (meeting-time t_14_30)))
)