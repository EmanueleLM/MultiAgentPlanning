(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)
  (:objects
    madison diana shirley - agent
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 - slot
  )
  (:init
    ;; Madison availability derived from: busy 09:30-10:00 and 11:30-12:00
    (available madison s10_00)
    (available madison s10_30)
    (available madison s12_00)
    (available madison s12_30)
    (available madison s13_00)
    (available madison s13_30)
    (available madison s14_00)
    (available madison s14_30)
    (available madison s15_00)
    (available madison s15_30)
    (available madison s16_00)

    ;; Diana availability derived from: busy 11:00-11:30 and 13:00-13:30
    (available diana s09_00)
    (available diana s09_30)
    (available diana s10_00)
    (available diana s11_30)
    (available diana s12_00)
    (available diana s13_30)
    (available diana s14_00)
    (available diana s14_30)
    (available diana s15_00)
    (available diana s15_30)
    (available diana s16_00)

    ;; Shirley availability derived from: busy 09:00-12:00, 13:30-15:00, 15:30-17:00
    (available shirley s12_00)
    (available shirley s12_30)
  )
  ;; The intersection of availabilities (based on the private information provided)
  ;; yields s12_00 as the only feasible 60-minute start. Goal asks to schedule that meeting.
  (:goal (and (meeting-scheduled) (scheduled s12_00)))
)