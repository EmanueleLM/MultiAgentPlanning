(define (problem schedule-monday-all-participants)
  (:domain unified-meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot

    adam frances natalie patrick willie diana - person
  )

  (:init
    (within t0900) (within t0930) (within t1000) (within t1030)
    (within t1100) (within t1130) (within t1200) (within t1230)
    (within t1300) (within t1330) (within t1400) (within t1430)
    (within t1500) (within t1530) (within t1600) (within t1630)

    ;; Adam: busy 10:00-10:30 (t1000), 12:30-13:00 (t1230)
    (available adam t0900) (available adam t0930) (available adam t1030)
    (available adam t1100) (available adam t1130) (available adam t1200)
    (available adam t1300) (available adam t1330) (available adam t1400)
    (available adam t1430) (available adam t1500) (available adam t1530)
    (available adam t1600) (available adam t1630)

    ;; Frances: busy 12:30-13:00 (t1230), 14:00-14:30 (t1400)
    (available frances t0900) (available frances t0930) (available frances t1000)
    (available frances t1030) (available frances t1100) (available frances t1130)
    (available frances t1200) (available frances t1300) (available frances t1330)
    (available frances t1430) (available frances t1500) (available frances t1530)
    (available frances t1600) (available frances t1630)

    ;; Natalie: busy 10:30-11:00 (t1030), 12:30-13:30 (t1230,t1300), 16:00-16:30 (t1600)
    (available natalie t0900) (available natalie t0930) (available natalie t1000)
    (available natalie t1100) (available natalie t1130) (available natalie t1200)
    (available natalie t1330) (available natalie t1400) (available natalie t1430)
    (available natalie t1500) (available natalie t1530) (available natalie t1630)

    ;; Patrick: busy 10:30-11:00 (t1030), 12:00-14:00 (t1200,t1230,t1300,t1330), 14:30-16:00 (t1430,t1500,t1530)
    (available patrick t0900) (available patrick t0930) (available patrick t1000)
    (available patrick t1100) (available patrick t1130) (available patrick t1400)
    (available patrick t1600) (available patrick t1630)

    ;; Willie: busy 09:00-10:00 (t0900,t0930), 10:30-11:30 (t1030,t1100), 12:00-13:00 (t1200,t1230),
    ;;        14:00-15:30 (t1400,t1430,t1500), 16:00-16:30 (t1600)
    (available willie t1000) (available willie t1130) (available willie t1300)
    (available willie t1330) (available willie t1530) (available willie t1630)

    ;; Diana: busy 09:00-10:30 (t0900,t0930,t1000), 11:00-16:30 (t1100..t1600)
    (available diana t1030) (available diana t1630)
  )

  (:goal (meeting-scheduled))
)