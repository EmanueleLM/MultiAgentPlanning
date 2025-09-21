(define (problem schedule_diane_kelly_deborah_monday)
  (:domain meeting_scheduling_integrated)

  (:objects
    diane kelly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    (within_work_hours t0900) (within_work_hours t0930) (within_work_hours t1000)
    (within_work_hours t1030) (within_work_hours t1100) (within_work_hours t1130)
    (within_work_hours t1200) (within_work_hours t1230) (within_work_hours t1300)
    (within_work_hours t1330) (within_work_hours t1400) (within_work_hours t1430)
    (within_work_hours t1500) (within_work_hours t1530) (within_work_hours t1600)
    (within_work_hours t1630)

    (free diane t0930) (free diane t1000) (free diane t1030)
    (free diane t1100) (free diane t1130) (free diane t1230)
    (free diane t1300) (free diane t1330) (free diane t1400)
    (free diane t1530) (free diane t1600) (free diane t1630)

    (free kelly t0900) (free kelly t1000) (free kelly t1100)
    (free kelly t1130) (free kelly t1200) (free kelly t1230)
    (free kelly t1300) (free kelly t1330) (free kelly t1400)
    (free kelly t1430) (free kelly t1500) (free kelly t1530)
    (free kelly t1600) (free kelly t1630)

    (free deborah t0930) (free deborah t1400)
  )

  (:goal (meeting_confirmed))
)