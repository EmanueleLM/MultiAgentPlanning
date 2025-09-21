(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduler)
  (:objects
    madison linda logan virginia - person
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - timeslot
  )
  (:init
    (within-work s_09_00) (within-work s_09_30) (within-work s_10_00) (within-work s_10_30)
    (within-work s_11_00) (within-work s_11_30) (within-work s_12_00) (within-work s_12_30)
    (within-work s_13_00) (within-work s_13_30) (within-work s_14_00) (within-work s_14_30)
    (within-work s_15_00) (within-work s_15_30) (within-work s_16_00) (within-work s_16_30)
    ; Madison busy: 10:00-10:30, 14:30-15:00, 15:30-16:00, 16:30-17:00
    (busy madison s_10_00) (busy madison s_14_30) (busy madison s_15_30) (busy madison s_16_30)
    ; Linda has no busy times
    ; Logan busy: 9:00-12:00, 12:30-16:00, 16:30-17:00
    (busy logan s_09_00) (busy logan s_09_30) (busy logan s_10_00) (busy logan s_10_30)
    (busy logan s_11_00) (busy logan s_11_30) (busy logan s_12_30) (busy logan s_13_00)
    (busy logan s_13_30) (busy logan s_14_00) (busy logan s_14_30) (busy logan s_15_00)
    (busy logan s_15_30) (busy logan s_16_30)
    ; Virginia busy: 9:30-11:00, 11:30-12:00, 13:00-14:30, 15:00-15:30, 16:00-17:00
    (busy virginia s_09_30) (busy virginia s_10_00) (busy virginia s_10_30) (busy virginia s_11_30)
    (busy virginia s_13_00) (busy virginia s_13_30) (busy virginia s_14_00) (busy virginia s_15_00)
    (busy virginia s_16_00) (busy virginia s_16_30)
  )
  (:goal (and
    (meeting-scheduled)
    (attending madison)
    (attending linda)
    (attending logan)
    (attending virginia)
  ))
)