(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    adam jerry matthew - agent
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; meeting not scheduled yet
    (unscheduled)

    ;; Adam's availability (Adam busy: 10:00-10:30, 12:30-13:00, 13:30-14:30)
    (free adam t0900) (free adam t0930) (free adam t1030)
    (free adam t1100) (free adam t1130) (free adam t1200) (free adam t1300)
    (free adam t1430) (free adam t1500) (free adam t1530) (free adam t1600) (free adam t1630)

    ;; Jerry's availability (Jerry busy: 09:00-09:30, 12:00-12:30, 15:00-16:00)
    (free jerry t0930) (free jerry t1000) (free jerry t1030)
    (free jerry t1100) (free jerry t1130) (free jerry t1230)
    (free jerry t1300) (free jerry t1330) (free jerry t1400) (free jerry t1430)
    (free jerry t1600) (free jerry t1630)

    ;; Matthew's availability (Matthew busy: 09:30-11:00, 11:30-12:30, 13:00-14:00, 14:30-17:00)
    (free matthew t0900)
    (free matthew t1100)
    (free matthew t1230)
    (free matthew t1400)
  )

  ;; Goal: a meeting has been scheduled (30-minute meeting slot between 09:00 and 17:00
  ;; requiring Adam, Jerry and Matthew). The domain actions only allow scheduling when
  ;; all three are free at the chosen slot, so the planner will pick a slot that fits all.
  (:goal (meeting-scheduled))
)