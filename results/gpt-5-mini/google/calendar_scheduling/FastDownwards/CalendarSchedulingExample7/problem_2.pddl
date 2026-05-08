(define (problem schedule-monday)
  (:domain meeting-scheduling)

  ;; Objects: three participants and discrete 30-minute slots for Monday 09:00-17:00.
  (:objects
    heather nicholas zachary - person

    slot-0900-0930 slot-0930-1000 slot-1000-1030 slot-1030-1100
    slot-1100-1130 slot-1130-1200 slot-1200-1230 slot-1230-1300
    slot-1300-1330 slot-1330-1400 slot-1400-1430 slot-1430-1500
    slot-1500-1530 slot-1530-1600 slot-1600-1630 slot-1630-1700 - slot
  )

  (:init
    ;; No meeting scheduled yet (prevents multiple schedule actions)
    (no-meeting-scheduled)

    ;; Participant availability facts derived from the provided calendars.
    ;; Heather busy: 09:00-09:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30.
    ;; Therefore available slots for Heather (30-min granularity):
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

    ;; Nicholas: available every 30-minute slot within 09:00-17:00
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

    ;; Zachary busy: 09:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30.
    ;; Available (hard) slots for Zachary:
    (available zachary slot-1030-1100)
    (available zachary slot-1200-1230)
    (available zachary slot-1300-1330)
    (available zachary slot-1630-1700)

    ;; Zachary's soft preference: prefers not to meet after 14:00.
    ;; Annotate slots before 14:00 that are acceptable/preferred for Zachary.
    ;; These annotations are informative for humans/auditors; planner will respect only hard availability.
    (preferred zachary slot-1030-1100)
    (preferred zachary slot-1200-1230)
    (preferred zachary slot-1300-1330)
  )

  ;; Goal: require that a meeting is scheduled (planner must choose a single slot
  ;; that satisfies all hard availability constraints).
  ;; Zachary's "prefer not after 14:00" is represented above as annotations (preferred)
  ;; and not enforced as a hard constraint so the planner may still schedule after 14:00
  ;; if needed. The instance statement guarantees at least one hard-feasible slot exists.
  (:goal
    (meeting-scheduled)
  )
)