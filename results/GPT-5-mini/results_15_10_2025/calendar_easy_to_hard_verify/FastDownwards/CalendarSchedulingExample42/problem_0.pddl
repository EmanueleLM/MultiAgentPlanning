(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    samantha brian arthur matthew marilyn mark andrea - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; Samantha busy at 11:00,13:00,15:30,16:30 -> available at all other 30-min slots
    (available samantha t0900)
    (available samantha t0930)
    (available samantha t1000)
    (available samantha t1030)
    (available samantha t1130)
    (available samantha t1200)
    (available samantha t1230)
    (available samantha t1330)
    (available samantha t1400)
    (available samantha t1430)
    (available samantha t1500)
    (available samantha t1600)

    ;; Brian - free entire day
    (available brian t0900) (available brian t0930) (available brian t1000) (available brian t1030)
    (available brian t1100) (available brian t1130) (available brian t1200) (available brian t1230)
    (available brian t1300) (available brian t1330) (available brian t1400) (available brian t1430)
    (available brian t1500) (available brian t1530) (available brian t1600) (available brian t1630)

    ;; Arthur busy at 13:30 and 16:00
    (available arthur t0900) (available arthur t0930) (available arthur t1000) (available arthur t1030)
    (available arthur t1100) (available arthur t1130) (available arthur t1200) (available arthur t1230)
    (available arthur t1300)                       (available arthur t1400)
    (available arthur t1430) (available arthur t1500) (available arthur t1530) (available arthur t1630)

    ;; Matthew - free entire day
    (available matthew t0900) (available matthew t0930) (available matthew t1000) (available matthew t1030)
    (available matthew t1100) (available matthew t1130) (available matthew t1200) (available matthew t1230)
    (available matthew t1300) (available matthew t1330) (available matthew t1400) (available matthew t1430)
    (available matthew t1500) (available matthew t1530) (available matthew t1600) (available matthew t1630)

    ;; Marilyn busy at 09:00-10:00 (t0900,t0930), 10:30-11:30 (t1030,t1100), 12:00-13:00 (t1200,t1230),
    ;; 14:00-14:30 (t1400), 16:00-16:30 (t1600)
    (available marilyn t1000) (available marilyn t1130)
    (available marilyn t1300) (available marilyn t1330)
    (available marilyn t1430) (available marilyn t1500) (available marilyn t1530)

    ;; Mark busy at 09:30-11:00 (t0930,t1000,t1030), 11:30-13:30 (t1130,t1200,t1230,t1300),
    ;; 14:00-14:30 (t1400), 15:00-16:00 (t1500,t1530)
    (available mark t0900) (available mark t1100)
    (available mark t1330) (available mark t1430) (available mark t1600) (available mark t1630)

    ;; Andrea busy at 09:30-11:00 (t0930,t1000,t1030), 11:30-14:30 (t1130,t1200,t1230,t1300,t1330,t1400),
    ;; 15:00-15:30 (t1500)
    (available andrea t0900) (available andrea t1100)
    (available andrea t1430) (available andrea t1530) (available andrea t1600) (available andrea t1630)
  )

  ;; Earliest feasible meeting time that satisfies all hard constraints: 14:30 (t1430)
  (:goal (meeting-scheduled t1430))
)