(define (problem schedule-monday-09-17-30min)
  (:domain calendar-scheduling)

  (:objects
    thomas dylan jerry - participant
    slot0900 slot0930 slot1000 slot1030 slot1100 slot1130 slot1200 slot1230
    slot1300 slot1330 slot1400 slot1430 slot1500 slot1530 slot1600 slot1630 - slot
  )

  (:init
    (slot slot0900) (slot slot0930) (slot slot1000) (slot slot1030)
    (slot slot1100) (slot slot1130) (slot slot1200) (slot slot1230)
    (slot slot1300) (slot slot1330) (slot slot1400) (slot slot1430)
    (slot slot1500) (slot slot1530) (slot slot1600) (slot slot1630)

    (next slot0900 slot0930)
    (next slot0930 slot1000)
    (next slot1000 slot1030)
    (next slot1030 slot1100)
    (next slot1100 slot1130)
    (next slot1130 slot1200)
    (next slot1200 slot1230)
    (next slot1230 slot1300)
    (next slot1300 slot1330)
    (next slot1330 slot1400)
    (next slot1400 slot1430)
    (next slot1430 slot1500)
    (next slot1500 slot1530)
    (next slot1530 slot1600)
    (next slot1600 slot1630)

    (free thomas slot0900) (free thomas slot0930) (free thomas slot1000) (free thomas slot1030)
    (free thomas slot1100) (free thomas slot1130) (free thomas slot1200) (free thomas slot1230)
    (free thomas slot1300) (free thomas slot1330) (free thomas slot1400) (free thomas slot1430)
    (free thomas slot1500) (free thomas slot1530) (free thomas slot1600) (free thomas slot1630)

    (free dylan slot0900) (free dylan slot0930) (free dylan slot1000)
    (free dylan slot1100) (free dylan slot1130) (free dylan slot1200) (free dylan slot1230)
    (free dylan slot1300)
    (free dylan slot1400) (free dylan slot1430) (free dylan slot1500) (free dylan slot1530)
    (free dylan slot1600) (free dylan slot1630)

    (free jerry slot1100)
    (free jerry slot1430) (free jerry slot1500) (free jerry slot1530)

    (earliest_start slot1430)
  )

  (:goal (meeting_scheduled))
)