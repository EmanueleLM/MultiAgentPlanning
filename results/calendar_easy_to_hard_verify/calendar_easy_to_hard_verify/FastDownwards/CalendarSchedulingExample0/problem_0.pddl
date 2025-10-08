(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    michelle steven jerry - person
    slot-09_00 slot-09_30 slot-10_00 slot-10_30
    slot-11_00 slot-11_30 slot-12_00 slot-12_30
    slot-13_00 slot-13_30 slot-14_00 slot-14_30
    slot-15_00 slot-15_30 slot-16_00 slot-16_30 - slot
  )
  (:init
    ;; sequential half-hour slots from 09:00 to 16:30
    (next slot-09_00 slot-09_30)
    (next slot-09_30 slot-10_00)
    (next slot-10_00 slot-10_30)
    (next slot-10_30 slot-11_00)
    (next slot-11_00 slot-11_30)
    (next slot-11_30 slot-12_00)
    (next slot-12_00 slot-12_30)
    (next slot-12_30 slot-13_00)
    (next slot-13_00 slot-13_30)
    (next slot-13_30 slot-14_00)
    (next slot-14_00 slot-14_30)
    (next slot-14_30 slot-15_00)
    (next slot-15_00 slot-15_30)
    (next slot-15_30 slot-16_00)
    (next slot-16_00 slot-16_30)

    ;; Busy (unavailable) half-hour slots derived from participant inputs (treated as hard constraints)
    ;; Michelle busy Monday 11:00-12:00 => slots 11:00-11:30 and 11:30-12:00
    (busy michelle slot-11_00)
    (busy michelle slot-11_30)

    ;; Steven busy: 09:00-09:30, 11:30-12:00, 13:30-14:00, 15:30-16:00
    (busy steven slot-09_00)
    (busy steven slot-11_30)
    (busy steven slot-13_30)
    (busy steven slot-15_30)

    ;; Jerry busy: 09:00-09:30, 10:00-11:00, 11:30-12:30, 13:00-14:30, 15:30-16:00, 16:30-17:00
    ;; -> slots: 09:00; 10:00,10:30; 11:30,12:00; 13:00,13:30,14:00; 15:30; 16:30
    (busy jerry slot-09_00)
    (busy jerry slot-10_00)
    (busy jerry slot-10_30)
    (busy jerry slot-11_30)
    (busy jerry slot-12_00)
    (busy jerry slot-13_00)
    (busy jerry slot-13_30)
    (busy jerry slot-14_00)
    (busy jerry slot-15_30)
    (busy jerry slot-16_30)
  )
  ;; Goal explicitly requires the meeting to be scheduled at the chosen earliest feasible start
  ;; (14:30-15:30, which corresponds to half-hour slots slot-14_30 and slot-15_00)
  (:goal (and (scheduled) (meeting-start slot-14_30)))
)