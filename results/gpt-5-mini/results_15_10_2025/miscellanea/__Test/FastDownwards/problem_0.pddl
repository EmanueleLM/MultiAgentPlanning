(define (problem schedule-meeting-oct21)
  (:domain meeting-scheduling)
  (:objects
    alice bob carol - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Meeting initially unscheduled
    (unscheduled)

    ;; Alice availability: 09:00-11:00 and 13:00-16:00
    ;; slots within 09:00-11:00: s0900 s0930 s1000 s1030
    (free alice s0900) (free alice s0930) (free alice s1000) (free alice s1030)
    ;; slots within 13:00-16:00: s1300 s1330 s1400 s1430 s1500 s1530
    (free alice s1300) (free alice s1330) (free alice s1400) (free alice s1430) (free alice s1500) (free alice s1530)

    ;; Bob availability: 10:30-12:00 and 14:00-15:30
    ;; slots within 10:30-12:00: s1030 s1100 s1130
    (free bob s1030) (free bob s1100) (free bob s1130)
    ;; slots within 14:00-15:30: s1400 s1430 s1500
    (free bob s1400) (free bob s1430) (free bob s1500)

    ;; Carol availability: 09:30-10:30, 11:00-12:30, 15:00-17:00
    ;; slots within 09:30-10:30: s0930 s1000
    (free carol s0930) (free carol s1000)
    ;; slots within 11:00-12:30: s1100 s1130 s1200
    (free carol s1100) (free carol s1130) (free carol s1200)
    ;; slots within 15:00-17:00: s1500 s1530 s1600 s1630
    (free carol s1500) (free carol s1530) (free carol s1600) (free carol s1630)
  )

  ;; Goal: schedule a single 30-minute meeting on Tue Oct 21.
  ;; Based on the provided availabilities, the earliest common 30-min slot
  ;; when Alice, Bob and Carol are all available is 15:00-15:30 (s1500).
  (:goal (meeting-scheduled s1500))
)