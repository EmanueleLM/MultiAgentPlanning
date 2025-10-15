(define (problem schedule-mon-30m)
  (:domain meeting-scheduler)

  (:objects
    adam jerry matthew - person
    ts-0900 ts-0930 ts-1000 ts-1030 ts-1100 ts-1130 ts-1200 ts-1230
    ts-1300 ts-1330 ts-1400 ts-1430 ts-1500 ts-1530 ts-1600 ts-1630 - timeslot
  )

  (:init
    ;; initialize total cost
    (= (total-cost) 0)

    ;; slot-cost: earlier slots have lower cost so planner will prefer earliest feasible slot
    (= (slot-cost ts-0900) 0)
    (= (slot-cost ts-0930) 1)
    (= (slot-cost ts-1000) 2)
    (= (slot-cost ts-1030) 3)
    (= (slot-cost ts-1100) 4)
    (= (slot-cost ts-1130) 5)
    (= (slot-cost ts-1200) 6)
    (= (slot-cost ts-1230) 7)
    (= (slot-cost ts-1300) 8)
    (= (slot-cost ts-1330) 9)
    (= (slot-cost ts-1400) 10)
    (= (slot-cost ts-1430) 11)
    (= (slot-cost ts-1500) 12)
    (= (slot-cost ts-1530) 13)
    (= (slot-cost ts-1600) 14)
    (= (slot-cost ts-1630) 15)

    ;; Free slots per participant derived from their calendars (busy intervals treated as unavailable)
    ;; Adam's busy: 10:00-10:30 (ts-1000), 12:30-13:00 (ts-1230), 13:30-14:30 (ts-1330, ts-1400)
    ;; Adam free slots:
    (free adam ts-0900)
    (free adam ts-0930)
    (free adam ts-1030)
    (free adam ts-1100)
    (free adam ts-1130)
    (free adam ts-1200)
    (free adam ts-1300)
    (free adam ts-1430)
    (free adam ts-1500)
    (free adam ts-1530)
    (free adam ts-1600)
    (free adam ts-1630)

    ;; Jerry's busy: 09:00-09:30 (ts-0900), 12:00-12:30 (ts-1200), 15:00-16:00 (ts-1500, ts-1530)
    ;; Jerry free slots:
    (free jerry ts-0930)
    (free jerry ts-1000)
    (free jerry ts-1030)
    (free jerry ts-1100)
    (free jerry ts-1130)
    (free jerry ts-1230)
    (free jerry ts-1300)
    (free jerry ts-1330)
    (free jerry ts-1400)
    (free jerry ts-1430)
    (free jerry ts-1600)
    (free jerry ts-1630)

    ;; Matthew's busy: 09:30-11:00 (ts-0930, ts-1000, ts-1030), 11:30-12:30 (ts-1130, ts-1200),
    ;;                      13:00-14:00 (ts-1300, ts-1330), 14:30-17:00 (ts-1430, ts-1500, ts-1530, ts-1600, ts-1630)
    ;; Matthew free slots:
    (free matthew ts-0900)
    (free matthew ts-1100)
    (free matthew ts-1230)
    (free matthew ts-1400)
  )

  ;; Goal: schedule one meeting slot that is free for all participants.
  (:goal (meeting-scheduled))

  ;; Minimize total-cost to prefer earliest feasible slot.
  (:metric minimize (total-cost))
)