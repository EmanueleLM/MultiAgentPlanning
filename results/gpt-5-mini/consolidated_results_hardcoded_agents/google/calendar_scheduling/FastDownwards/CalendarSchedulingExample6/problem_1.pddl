(define (problem schedule-monday-09-17-30min)
  (:domain calendar-scheduling)

  (:objects
    thomas dylan jerry - participant

    slot0900 slot0930 slot1000 slot1030 slot1100 slot1130 slot1200 slot1230
    slot1300 slot1330 slot1400 slot1430 slot1500 slot1530 slot1600 slot1630 - slot
  )

  (:init
    ;; declare slots
    (slot slot0900) (slot slot0930) (slot slot1000) (slot slot1030)
    (slot slot1100) (slot slot1130) (slot slot1200) (slot slot1230)
    (slot slot1300) (slot slot1330) (slot slot1400) (slot slot1430)
    (slot slot1500) (slot slot1530) (slot slot1600) (slot slot1630)

    ;; consecutive 30-min ordering (09:00->09:30, 09:30->10:00, ..., 16:30->17:00)
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

    ;; Thomas: free entire work day (09:00-17:00) -> all slots free
    (free thomas slot0900) (free thomas slot0930) (free thomas slot1000) (free thomas slot1030)
    (free thomas slot1100) (free thomas slot1130) (free thomas slot1200) (free thomas slot1230)
    (free thomas slot1300) (free thomas slot1330) (free thomas slot1400) (free thomas slot1430)
    (free thomas slot1500) (free thomas slot1530) (free thomas slot1600) (free thomas slot1630)

    ;; Dylan: busy 10:30-11:00 (slot1030) and 13:30-14:00 (slot1330). All other slots free.
    (free dylan slot0900) (free dylan slot0930) (free dylan slot1000)
    ;; slot1030 busy -> omitted
    (free dylan slot1100) (free dylan slot1130) (free dylan slot1200) (free dylan slot1230)
    (free dylan slot1300)
    ;; slot1330 busy -> omitted
    (free dylan slot1400) (free dylan slot1430) (free dylan slot1500) (free dylan slot1530)
    (free dylan slot1600) (free dylan slot1630)

    ;; Jerry: busy 09:00-11:00 (slot0900,slot0930,slot1000,slot1030),
    ;;       11:30-14:30 (slot1130,slot1200,slot1230,slot1300,slot1330,slot1400),
    ;;       16:00-17:00 (slot1600,slot1630).
    ;; So Jerry is free only on slot1100, slot1430, slot1500, slot1530.
    (free jerry slot1100)
    (free jerry slot1430) (free jerry slot1500) (free jerry slot1530)

    ;; Mark the auditor/orchestrator-selected earliest feasible 60-minute start slot.
    ;; This restricts scheduling to the earliest feasible start (14:30).
    (earliest_start slot1430)
  )

  ;; Goal: have scheduled the meeting (domain enforces that scheduling must use earliest_start and two consecutive free slots)
  (:goal (meeting_scheduled))
)