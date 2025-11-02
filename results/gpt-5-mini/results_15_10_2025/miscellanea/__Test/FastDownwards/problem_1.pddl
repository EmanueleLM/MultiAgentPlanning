(define (problem schedule-meeting-oct21)
  (:domain meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (unscheduled)

    (free alice s0900) (free alice s0930) (free alice s1000) (free alice s1030)
    (free alice s1300) (free alice s1330) (free alice s1400) (free alice s1430) (free alice s1500) (free alice s1530)

    (free bob s1030) (free bob s1100) (free bob s1130)
    (free bob s1400) (free bob s1430) (free bob s1500)

    (free carol s0930) (free carol s1000)
    (free carol s1100) (free carol s1130) (free carol s1200)
    (free carol s1500) (free carol s1530) (free carol s1600) (free carol s1630)
  )

  (:goal (meeting-scheduled s1500))
)