(define (problem schedule-monday-30)
  (:domain meeting-scheduling)

  (:objects
    rachel katherine kelly cynthia anthony ryan richard - participant
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Free facts (participant free for slot). Derived from participants' busy intervals.
    ;; Rachel: free entire day
    (free rachel s0900) (free rachel s0930) (free rachel s1000) (free rachel s1030)
    (free rachel s1100) (free rachel s1130) (free rachel s1200) (free rachel s1230)
    (free rachel s1300) (free rachel s1330) (free rachel s1400) (free rachel s1430)
    (free rachel s1500) (free rachel s1530) (free rachel s1600) (free rachel s1630)

    ;; Katherine: busy 10:00-11:00, 12:30-13:00, 14:00-15:00, 16:00-16:30
    ;; Excludes s1000, s1030, s1230, s1400, s1430, s1600
    (free katherine s0900) (free katherine s0930)
    (free katherine s1100) (free katherine s1130) (free katherine s1200)
    (free katherine s1300) (free katherine s1330)
    (free katherine s1500) (free katherine s1530) (free katherine s1630)

    ;; Kelly: busy 11:30-12:30, 13:00-14:30, 16:00-16:30
    ;; Excludes s1130, s1200, s1300, s1330, s1400, s1600
    (free kelly s0900) (free kelly s0930) (free kelly s1000) (free kelly s1030)
    (free kelly s1100) (free kelly s1230) (free kelly s1430)
    (free kelly s1500) (free kelly s1530) (free kelly s1630)

    ;; Cynthia: busy 13:30-14:00, 14:30-15:30, 16:00-16:30
    ;; Excludes s1330, s1430, s1500, s1600
    (free cynthia s0900) (free cynthia s0930) (free cynthia s1000) (free cynthia s1030)
    (free cynthia s1100) (free cynthia s1130) (free cynthia s1200) (free cynthia s1230)
    (free cynthia s1300) (free cynthia s1400) (free cynthia s1530) (free cynthia s1630)

    ;; Anthony: busy 09:00-11:00, 12:00-17:00
    ;; Free only s1100 (11:00-11:30) and s1130 (11:30-12:00)
    (free anthony s1100) (free anthony s1130)

    ;; Ryan: busy 09:00-11:00, 12:30-13:30, 14:00-14:30, 15:00-16:30
    ;; Excludes s0900,s0930,s1000,s1030,s1230,s1300,s1400,s1500,s1530,s1600
    (free ryan s1100) (free ryan s1130) (free ryan s1200)
    (free ryan s1330) (free ryan s1430) (free ryan s1630)

    ;; Richard: busy 09:30-10:30, 12:00-13:30, 15:30-17:00
    ;; Excludes s0930,s1000,s1200,s1230,s1300,s1530,s1600,s1630
    (free richard s0900) (free richard s1030) (free richard s1100) (free richard s1130)
    (free richard s1330) (free richard s1400) (free richard s1430) (free richard s1500)

    ;; Ordering: earlier relations (strictly earlier). For correctness of "earliest" enforcement,
    ;; list all pairs where the first slot is strictly earlier than the second.
    ;; s0900 is earlier than all later slots
    (earlier s0900 s0930) (earlier s0900 s1000) (earlier s0900 s1030) (earlier s0900 s1100)
    (earlier s0900 s1130) (earlier s0900 s1200) (earlier s0900 s1230) (earlier s0900 s1300)
    (earlier s0900 s1330) (earlier s0900 s1400) (earlier s0900 s1430) (earlier s0900 s1500)
    (earlier s0900 s1530) (earlier s0900 s1600) (earlier s0900 s1630)

    ;; s0930 earlier than later slots
    (earlier s0930 s1000) (earlier s0930 s1030) (earlier s0930 s1100) (earlier s0930 s1130)
    (earlier s0930 s1200) (earlier s0930 s1230) (earlier s0930 s1300) (earlier s0930 s1330)
    (earlier s0930 s1400) (earlier s0930 s1430) (earlier s0930 s1500) (earlier s0930 s1530)
    (earlier s0930 s1600) (earlier s0930 s1630)

    ;; s1000 earlier than later slots
    (earlier s1000 s1030) (earlier s1000 s1100) (earlier s1000 s1130) (earlier s1000 s1200)
    (earlier s1000 s1230) (earlier s1000 s1300) (earlier s1000 s1330) (earlier s1000 s1400)
    (earlier s1000 s1430) (earlier s1000 s1500) (earlier s1000 s1530) (earlier s1000 s1600)
    (earlier s1000 s1630)

    ;; s1030 earlier than later slots
    (earlier s1030 s1100) (earlier s1030 s1130) (earlier s1030 s1200) (earlier s1030 s1230)
    (earlier s1030 s1300) (earlier s1030 s1330) (earlier s1030 s1400) (earlier s1030 s1430)
    (earlier s1030 s1500) (earlier s1030 s1530) (earlier s1030 s1600) (earlier s1030 s1630)

    ;; s1100 earlier than later slots
    (earlier s1100 s1130) (earlier s1100 s1200) (earlier s1100 s1230) (earlier s1100 s1300)
    (earlier s1100 s1330) (earlier s1100 s1400) (earlier s1100 s1430) (earlier s1100 s1500)
    (earlier s1100 s1530) (earlier s1100 s1600) (earlier s1100 s1630)

    ;; s1130 earlier than later slots
    (earlier s1130 s1200) (earlier s1130 s1230) (earlier s1130 s1300) (earlier s1130 s1330)
    (earlier s1130 s1400) (earlier s1130 s1430) (earlier s1130 s1500) (earlier s1130 s1530)
    (earlier s1130 s1600) (earlier s1130 s1630)

    ;; s1200 earlier than later slots
    (earlier s1200 s1230) (earlier s1200 s1300) (earlier s1200 s1330) (earlier s1200 s1400)
    (earlier s1200 s1430) (earlier s1200 s1500) (earlier s1200 s1530) (earlier s1200 s1600)
    (earlier s1200 s1630)

    ;; s1230 earlier than later slots
    (earlier s1230 s1300) (earlier s1230 s1330) (earlier s1230 s1400) (earlier s1230 s1430)
    (earlier s1230 s1500) (earlier s1230 s1530) (earlier s1230 s1600) (earlier s1230 s1630)

    ;; s1300 earlier than later slots
    (earlier s1300 s1330) (earlier s1300 s1400) (earlier s1300 s1430) (earlier s1300 s1500)
    (earlier s1300 s1530) (earlier s1300 s1600) (earlier s1300 s1630)

    ;; s1330 earlier than later slots
    (earlier s1330 s1400) (earlier s1330 s1430) (earlier s1330 s1500) (earlier s1330 s1530)
    (earlier s1330 s1600) (earlier s1330 s1630)

    ;; s1400 earlier than later slots
    (earlier s1400 s1430) (earlier s1400 s1500) (earlier s1400 s1530) (earlier s1400 s1600)
    (earlier s1400 s1630)

    ;; s1430 earlier than later slots
    (earlier s1430 s1500) (earlier s1430 s1530) (earlier s1430 s1600) (earlier s1430 s1630)

    ;; s1500 earlier than later slots
    (earlier s1500 s1530) (earlier s1500 s1600) (earlier s1500 s1630)

    ;; s1530 earlier than later slots
    (earlier s1530 s1600) (earlier s1530 s1630)

    ;; s1600 earlier than later slots
    (earlier s1600 s1630)
  )

  (:goal (meeting-scheduled))
)