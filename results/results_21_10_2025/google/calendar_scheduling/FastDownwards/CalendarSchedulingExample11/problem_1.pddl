(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )
  (:init
    ;; alexander free start-times (30-min meeting starts)
    (free alexander t_09_00)
    (free alexander t_10_00)
    (free alexander t_11_00)
    (free alexander t_11_30)
    (free alexander t_12_00)
    (free alexander t_13_00)
    (free alexander t_13_30)
    (free alexander t_14_00)
    (free alexander t_15_00)
    (free alexander t_15_30)

    ;; elizabeth free start-times
    (free elizabeth t_09_30)
    (free elizabeth t_10_00)
    (free elizabeth t_10_30)
    (free elizabeth t_11_00)
    (free elizabeth t_12_30)
    (free elizabeth t_14_30)
    (free elizabeth t_15_00)
    (free elizabeth t_15_30)
    (free elizabeth t_16_00)
    (free elizabeth t_16_30)

    ;; walter free start-times
    (free walter t_14_30)
    (free walter t_15_00)
  )
  (:goal
    (meeting_scheduled)
  )
)