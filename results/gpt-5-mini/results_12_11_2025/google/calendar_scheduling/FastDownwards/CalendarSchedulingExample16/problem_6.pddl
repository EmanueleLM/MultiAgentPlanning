(define (problem schedule-meeting-problem)
  (:domain schedule-domain)
  (:objects
    scott gabriel christine - participant
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )

  (:init
    ;; all timeslots are within work hours (Monday 09:00-17:00, 30-min granularity)
    (within_work_hours t0900_0930)
    (within_work_hours t0930_1000)
    (within_work_hours t1000_1030)
    (within_work_hours t1030_1100)
    (within_work_hours t1100_1130)
    (within_work_hours t1130_1200)
    (within_work_hours t1200_1230)
    (within_work_hours t1230_1300)
    (within_work_hours t1300_1330)
    (within_work_hours t1330_1400)
    (within_work_hours t1400_1430)
    (within_work_hours t1430_1500)
    (within_work_hours t1500_1530)
    (within_work_hours t1530_1600)
    (within_work_hours t1600_1630)
    (within_work_hours t1630_1700)

    ;; successor (adjacent) relations between 30-minute timeslots
    (next t0900_0930 t0930_1000)
    (next t0930_1000 t1000_1030)
    (next t1000_1030 t1030_1100)
    (next t1030_1100 t1100_1130)
    (next t1100_1130 t1130_1200)
    (next t1130_1200 t1200_1230)
    (next t1200_1230 t1230_1300)
    (next t1230_1300 t1300_1330)
    (next t1300_1330 t1330_1400)
    (next t1330_1400 t1400_1430)
    (next t1400_1430 t1430_1500)
    (next t1430_1500 t1500_1530)
    (next t1500_1530 t1530_1600)
    (next t1530_1600 t1600_1630)
    (next t1600_1630 t1630_1700)

    ;; availability facts computed exactly from each participant's busy intervals (30-min aligned)
    ;; Scott is busy: 09:30-10:30, 13:30-14:00, 14:30-15:00, 15:30-16:00, 16:30-17:00
    ;; Scott free slots:
    (available scott t0900_0930)
    (available scott t1030_1100)
    (available scott t1100_1130)
    (available scott t1130_1200)
    (available scott t1200_1230)
    (available scott t1230_1300)
    (available scott t1300_1330)
    (available scott t1400_1430)
    (available scott t1500_1530)
    (available scott t1600_1630)

    ;; Gabriel has no meetings (free all day)
    (available gabriel t0900_0930)
    (available gabriel t0930_1000)
    (available gabriel t1000_1030)
    (available gabriel t1030_1100)
    (available gabriel t1100_1130)
    (available gabriel t1130_1200)
    (available gabriel t1200_1230)
    (available gabriel t1230_1300)
    (available gabriel t1300_1330)
    (available gabriel t1330_1400)
    (available gabriel t1400_1430)
    (available gabriel t1430_1500)
    (available gabriel t1500_1530)
    (available gabriel t1530_1600)
    (available gabriel t1600_1630)
    (available gabriel t1630_1700)

    ;; Christine is busy: 09:00-10:00, 10:30-12:30, 13:00-17:00
    ;; Christine free slots:
    (available christine t1000_1030)
    (available christine t1230_1300)
  )

  (:goal (and
    (scheduled t1230_1300)
  ))
)