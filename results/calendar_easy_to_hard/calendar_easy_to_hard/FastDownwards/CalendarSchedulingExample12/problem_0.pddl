(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    david debra kevin - agent
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time
  )

  (:init
    ; time facts
    (time t0900) (time t0930) (time t1000) (time t1030) (time t1100) (time t1130)
    (time t1200) (time t1230) (time t1300) (time t1330) (time t1400) (time t1430)
    (time t1500) (time t1530) (time t1600) (time t1630) (time t1700)

    ; next relations for consecutive 30-min slots
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630) (next t1630 t1700)

    ; Availability encoded as 30-minute slots starting at each time (09:00..16:30)
    ; David: no meetings the whole day on Monday -> free all slots 09:00-16:30
    (free david t0900) (free david t0930) (free david t1000) (free david t1030)
    (free david t1100) (free david t1130) (free david t1200) (free david t1230)
    (free david t1300) (free david t1330) (free david t1400) (free david t1430)
    (free david t1500) (free david t1530) (free david t1600) (free david t1630)

    ; Debra: busy intervals (listed by agent): 09:30-10:00, 11:00-11:30, 12:00-13:00, 14:00-14:30, 16:00-16:30
    ; So Debra is NOT free at those slot starts; free at other slot starts
    ; Busy slots for Debra: t0930, t1100, t1200, t1230, t1400, t1600
    (free debra t0900)               ; 09:00-09:30 free
    ; t0930 busy -> omitted
    (free debra t1000) (free debra t1030)
    ; t1100 busy -> omitted
    (free debra t1130)
    ; t1200 busy -> omitted
    ; t1230 busy -> omitted
    (free debra t1300) (free debra t1330)
    ; t1400 busy -> omitted
    (free debra t1430) (free debra t1500) (free debra t1530)
    ; t1600 busy -> omitted
    (free debra t1630)

    ; Kevin: busy 09:00-12:00 and 14:00-17:00 -> free only 12:00-14:00 (slot starts t1200,t1230,t1300,t1330)
    ; Busy slots (not free): t0900,t0930,t1000,t1030,t1100,t1130 and t1400,t1430,t1500,t1530,t1600,t1630
    (free kevin t1200) (free kevin t1230) (free kevin t1300) (free kevin t1330)
  )

  ; Goal: schedule a one-hour (two 30-min slots) meeting between 09:00 and 17:00 that all participants attend.
  ; The plan must set the global meeting-scheduled flag (confirm-meeting action achieves that).
  (:goal (meeting-scheduled))
)