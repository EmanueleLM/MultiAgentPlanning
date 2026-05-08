(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    roy kathryn amy - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Roy's existing schedule on Monday:
    ;; Blocked: 9:00-9:30, 10:00-10:30, 11:00-11:30, 12:30-13:00.
    ;; Free: 9:30-10:00, 10:30-11:00, 11:30-12:30, 13:00-17:00.
    (free roy t0930_1000)
    (free roy t1030_1100)
    (free roy t1130_1200)
    (free roy t1200_1230)
    (free roy t1300_1330)
    (free roy t1330_1400)
    (free roy t1400_1430)
    (free roy t1430_1500)
    (free roy t1500_1530)
    (free roy t1530_1600)
    (free roy t1600_1630)
    (free roy t1630_1700)

    ;; Kathryn's existing schedule on Monday:
    ;; Meetings: 9:30-10:00, 16:30-17:00.
    ;; Free: 9:00-9:30, 10:00-16:30.
    (free kathryn t0900_0930)
    (free kathryn t1000_1030)
    (free kathryn t1030_1100)
    (free kathryn t1100_1130)
    (free kathryn t1130_1200)
    (free kathryn t1200_1230)
    (free kathryn t1230_1300)
    (free kathryn t1300_1330)
    (free kathryn t1330_1400)
    (free kathryn t1400_1430)
    (free kathryn t1430_1500)
    (free kathryn t1500_1530)
    (free kathryn t1530_1600)
    (free kathryn t1600_1630)

    ;; Amy's existing schedule on Monday:
    ;; Blocked: 9:00-14:30, 15:00-16:00, 16:30-17:00.
    ;; Free chunks: 14:30-15:00, 16:00-16:30.
    ;; Preference Constraint: Amy would rather not meet after 15:30.
    ;; We treat the preference as a hard constraint: only slots entirely before 15:30 are valid for Amy.
    ;; The slot 14:30-15:00 (t1430_1500) is the only free slot satisfying the preference.
    (free amy t1430_1500)
  )
  (:goal
    (exists (?t - timeslot) (meeting_at ?t))
  )
)