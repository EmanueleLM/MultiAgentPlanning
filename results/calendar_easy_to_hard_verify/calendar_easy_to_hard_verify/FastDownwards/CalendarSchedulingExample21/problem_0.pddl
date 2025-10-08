(define (problem schedule-mon)
  (:domain schedule-meeting)
  (:objects
    sara sarah shirley harold terry - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; declare slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130)
    (slot s1200) (slot s1230) (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Sara: "I have no meetings on Monday between 09:00 and 17:00" -> free at all slots
    (free sara s0900) (free sara s0930) (free sara s1000) (free sara s1030)
    (free sara s1100) (free sara s1130) (free sara s1200) (free sara s1230)
    (free sara s1300) (free sara s1330) (free sara s1400) (free sara s1430)
    (free sara s1500) (free sara s1530) (free sara s1600) (free sara s1630)

    ;; Sarah: busy 12:00-12:30 and 15:00-15:30 -> those start slots are unavailable
    (free sarah s0900) (free sarah s0930) (free sarah s1000) (free sarah s1030)
    (free sarah s1100) (free sarah s1130) ;; (not s1200)
    (free sarah s1230) (free sarah s1300) (free sarah s1330) (free sarah s1400)
    (free sarah s1430) ;; (not s1500)
    (free sarah s1530) (free sarah s1600) (free sarah s1630)

    ;; Shirley: busy 13:30-14:00 and 14:30-15:00 -> slots s1330 and s1430 unavailable
    (free shirley s0900) (free shirley s0930) (free shirley s1000) (free shirley s1030)
    (free shirley s1100) (free shirley s1130) (free shirley s1200) (free shirley s1230)
    (free shirley s1300) ;; (not s1330)
    (free shirley s1400) ;; (not s1430)
    (free shirley s1500) (free shirley s1530) (free shirley s1600) (free shirley s1630)

    ;; Harold: busy 09:00-10:00 (s0900,s0930), 10:30-12:30 (s1030,s1100,s1130,s1200), 13:00-17:00 (s1300..s1630)
    ;; Therefore Harold is free only at s1000 and s1230 within the 09:00-17:00 horizon
    (free harold s1000) (free harold s1230)

    ;; Terry: busy 09:00-10:00 (s0900,s0930), 10:30-11:30 (s1030,s1100), 12:00-17:00 (s1200..s1630)
    ;; Therefore Terry is free only at s1000 and s1130
    (free terry s1000) (free terry s1130)
  )

  ;; goal: schedule a single 30-minute meeting (the schedule action will only succeed for a slot
  ;; where every participant has a (free ...) fact). The defined busy intervals (omitted free facts)
  ;; ensure only feasible slots are schedulable; the earliest common feasible start is thereby selected.
  (:goal (meeting-scheduled))
)