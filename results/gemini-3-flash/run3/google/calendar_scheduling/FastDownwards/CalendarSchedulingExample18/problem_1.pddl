(define (problem calendar_scheduling_example_18)
  (:domain calendar_scheduling)
  (:objects
    brian billy patricia - person
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; Brian has no meetings the whole day.
    (free brian slot_0900_0930)
    (free brian slot_0930_1000)
    (free brian slot_1000_1030)
    (free brian slot_1030_1100)
    (free brian slot_1100_1130)
    (free brian slot_1130_1200)
    (free brian slot_1200_1230)
    (free brian slot_1230_1300)
    (free brian slot_1300_1330)
    (free brian slot_1330_1400)
    (free brian slot_1400_1430)
    (free brian slot_1430_1500)
    (free brian slot_1500_1530)
    (free brian slot_1530_1600)
    (free brian slot_1600_1630)
    (free brian slot_1630_1700)

    ;; Billy's schedule and preference.
    ;; Busy: 10:00-10:30 (slot_1000_1030), 11:30-12:00 (slot_1130_1200), 14:00-14:30 (slot_1400_1430), 16:30-17:00 (slot_1630_1700).
    ;; Preference: Avoid meetings after 15:30 (excludes slot_1530_1600, slot_1600_1630, slot_1630_1700).
    (free billy slot_0900_0930)
    (free billy slot_0930_1000)
    ;; slot_1000_1030: busy
    (free billy slot_1030_1100)
    (free billy slot_1100_1130)
    ;; slot_1130_1200: busy
    (free billy slot_1200_1230)
    (free billy slot_1230_1300)
    (free billy slot_1300_1330)
    (free billy slot_1330_1400)
    ;; slot_1400_1430: busy
    (free billy slot_1430_1500)
    (free billy slot_1500_1530)
    ;; slot_1530_1600: avoid
    ;; slot_1600_1630: avoid
    ;; slot_1630_1700: busy/avoid

    ;; Patricia's schedule.
    ;; Busy: 9:00-12:30 (slot_0900 to slot_1200), 13:30-14:00 (slot_1330), 14:30-16:00 (slot_1430 to slot_1530), 16:30-17:00 (slot_1630).
    ;; Free slots:
    (free patricia slot_1230_1300)
    (free patricia slot_1300_1330)
    (free patricia slot_1400_1430)
    (free patricia slot_1600_1630)
  )
  (:goal (meeting_scheduled))
)