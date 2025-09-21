(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduler)
  (:objects
    alexander elizabeth walter - person
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - timeslot
  )
  (:init
    (within-work s_09_00) (within-work s_09_30) (within-work s_10_00) (within-work s_10_30)
    (within-work s_11_00) (within-work s_11_30) (within-work s_12_00) (within-work s_12_30)
    (within-work s_13_00) (within-work s_13_30) (within-work s_14_00) (within-work s_14_30)
    (within-work s_15_00) (within-work s_15_30) (within-work s_16_00) (within-work s_16_30)
    ;; Alexander busy: 09:30-10:00, 10:30-11:00, 12:30-13:00, 14:30-15:00, 16:00-17:00
    (busy alexander s_09_30) (busy alexander s_10_30) (busy alexander s_12_30) (busy alexander s_14_30) (busy alexander s_16_00) (busy alexander s_16_30)
    ;; Elizabeth busy: 09:00-09:30, 11:30-12:30, 13:00-14:30
    (busy elizabeth s_09_00) (busy elizabeth s_11_30) (busy elizabeth s_12_00) (busy elizabeth s_13_00) (busy elizabeth s_13_30) (busy elizabeth s_14_00)
    ;; Walter busy: 09:00-14:30, 15:30-17:00
    (busy walter s_09_00) (busy walter s_09_30) (busy walter s_10_00) (busy walter s_10_30) (busy walter s_11_00) (busy walter s_11_30)
    (busy walter s_12_00) (busy walter s_12_30) (busy walter s_13_00) (busy walter s_13_30) (busy walter s_14_00) (busy walter s_15_30) (busy walter s_16_00) (busy walter s_16_30)
  )
  (:goal (and
    (meeting-scheduled)
    (attending alexander)
    (attending elizabeth)
    (attending walter)
  ))
)