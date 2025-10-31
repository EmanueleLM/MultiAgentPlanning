(define (problem schedule-meeting)
  (:domain meeting-scheduling)

  (:objects
    adam jerry matthew
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630
  )

  (:init
    ;; declare slots
    (slot s0900) (slot s0930) (slot s1000) (slot s1030)
    (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430)
    (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    ;; Free slots for adam (busy: 10:00-10:30 s1000, 12:30-13:00 s1230, 13:30-14:30 s1330 & s1400 -> treated as busy)
    (free adam s0900) (free adam s0930) (free adam s1030)
    (free adam s1100) (free adam s1130) (free adam s1200)
    (free adam s1300) (free adam s1430) (free adam s1500)
    (free adam s1530) (free adam s1600) (free adam s1630)

    ;; Free slots for jerry (busy: 09:00-09:30 s0900, 12:00-12:30 s1200, 15:00-16:00 s1500 & s1530)
    (free jerry s0930) (free jerry s1000) (free jerry s1030)
    (free jerry s1100) (free jerry s1130) (free jerry s1230)
    (free jerry s1300) (free jerry s1330) (free jerry s1400)
    (free jerry s1430) (free jerry s1600) (free jerry s1630)

    ;; Free slots for matthew (busy: 09:30-11:00 s0930,s1000,s1030; 11:30-12:30 s1130,s1200; 13:00-14:00 s1300,s1330; 14:30-17:00 s1430,s1500,s1530,s1600,s1630)
    (free matthew s0900) (free matthew s1100) (free matthew s1230) (free matthew s1400)
  )

  ;; Goal: schedule the earliest feasible common 30-minute slot (11:00-11:30)
  (:goal (scheduled s1100))
)