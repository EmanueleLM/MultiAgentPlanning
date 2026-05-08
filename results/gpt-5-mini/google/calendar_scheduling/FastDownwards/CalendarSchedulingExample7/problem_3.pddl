(define (problem schedule-monday)
  (:domain meeting-scheduling)

  (:objects
    heather nicholas zachary - person

    slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
    slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
    slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
    slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
  )

  (:init
    ;; no meeting scheduled yet
    (no-meeting-scheduled)

    ;; heather busy: 09:00-09:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30
    ;; therefore available slots for heather:
    (available heather slot-0930-1000)
    (available heather slot-1000-1030)
    (available heather slot-1100-1130)
    (available heather slot-1130-1200)
    (available heather slot-1200-1230)
    (available heather slot-1230-1300)
    (available heather slot-1400-1430)
    (available heather slot-1500-1530)
    (available heather slot-1530-1600)
    (available heather slot-1630-1700)

    ;; nicholas: available every 30-minute slot within 09:00-17:00
    (available nicholas slot-0900-0930)
    (available nicholas slot-0930-1000)
    (available nicholas slot-1000-1030)
    (available nicholas slot-1030-1100)
    (available nicholas slot-1100-1130)
    (available nicholas slot-1130-1200)
    (available nicholas slot-1200-1230)
    (available nicholas slot-1230-1300)
    (available nicholas slot-1300-1330)
    (available nicholas slot-1330-1400)
    (available nicholas slot-1400-1430)
    (available nicholas slot-1430-1500)
    (available nicholas slot-1500-1530)
    (available nicholas slot-1530-1600)
    (available nicholas slot-1600-1630)
    (available nicholas slot-1630-1700)

    ;; zachary busy: 09:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30
    ;; available (hard) slots for zachary:
    (available zachary slot-1030-1100)
    (available zachary slot-1200-1230)
    (available zachary slot-1300-1330)
    (available zachary slot-1630-1700)

    ;; zachary preference: prefers not to meet after 14:00
    ;; annotate preferred (soft) slots that respect this preference
    (preferred zachary slot-1030-1100)
    (preferred zachary slot-1200-1230)
    (preferred zachary slot-1300-1330)
  )

  ;; hard goal: require that a meeting is scheduled in one slot that satisfies all hard availability constraints
  ;; zachary's preference is annotated above and not enforced as a hard constraint
  (:goal
    (meeting-scheduled)
  )
)