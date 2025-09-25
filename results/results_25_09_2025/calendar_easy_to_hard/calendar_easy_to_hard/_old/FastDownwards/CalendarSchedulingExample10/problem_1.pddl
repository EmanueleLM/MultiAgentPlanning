(define (problem integrated-schedule-monday-30min)
  (:domain integrated-scheduling)

  (:objects
    diana ethan janet - person
    meeting1 - meeting
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    (is-meeting meeting1)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    (slot-available t0900) (slot-available t0930) (slot-available t1000) (slot-available t1030)
    (slot-available t1100) (slot-available t1130) (slot-available t1200) (slot-available t1230)
    (slot-available t1300) (slot-available t1330) (slot-available t1400) (slot-available t1430)
    (slot-available t1500) (slot-available t1530) (slot-available t1600) (slot-available t1630)

    (free-diana t0900) (free-diana t0930) (free-diana t1000) (free-diana t1030)
    (free-diana t1100)
    (free-diana t1200) (free-diana t1230)
    (free-diana t1330) (free-diana t1400) (free-diana t1430)
    (free-diana t1500) (free-diana t1530) (free-diana t1600) (free-diana t1630)

    (available-ethan t0900) (available-ethan t0930) (available-ethan t1000) (available-ethan t1030)
    (available-ethan t1100) (available-ethan t1130) (available-ethan t1200) (available-ethan t1230)
    (available-ethan t1300) (available-ethan t1330) (available-ethan t1400) (available-ethan t1430)
    (available-ethan t1500) (available-ethan t1530) (available-ethan t1600) (available-ethan t1630)

    (within-window t0900) (within-window t0930) (within-window t1000) (within-window t1030)
    (within-window t1100) (within-window t1130) (within-window t1200) (within-window t1230)
    (within-window t1300) (within-window t1330) (within-window t1400) (within-window t1430)
    (within-window t1500) (within-window t1530) (within-window t1600) (within-window t1630)

    (preferred-janet t0900) (preferred-janet t0930) (preferred-janet t1000)
    (preferred-janet t1030) (preferred-janet t1100) (preferred-janet t1130)

    (free-janet t1000) (free-janet t1030) (free-janet t1100) (free-janet t1130)
    (free-janet t1200) (free-janet t1300) (free-janet t1330) (free-janet t1500)

    (can-schedule-janet)
  )

  (:goal (meeting-scheduled meeting1 t1000))
)