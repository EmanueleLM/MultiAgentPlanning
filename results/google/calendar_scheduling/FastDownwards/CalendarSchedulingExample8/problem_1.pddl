(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    adam jerry matthew - agent
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    (unscheduled)
    (free adam t0900) (free adam t0930) (free adam t1030)
    (free adam t1100) (free adam t1130) (free adam t1200) (free adam t1300)
    (free adam t1430) (free adam t1500) (free adam t1530) (free adam t1600) (free adam t1630)
    (free jerry t0930) (free jerry t1000) (free jerry t1030)
    (free jerry t1100) (free jerry t1130) (free jerry t1230)
    (free jerry t1300) (free jerry t1330) (free jerry t1400) (free jerry t1430)
    (free jerry t1600) (free jerry t1630)
    (free matthew t0900)
    (free matthew t1100)
    (free matthew t1230)
    (free matthew t1400)
  )

  (:goal (meeting-scheduled))
)