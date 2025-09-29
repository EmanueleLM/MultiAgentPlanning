(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    nicole christine anna terry julie abigail - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    ;; Nicole free (busy: 10:00 s1000; 14:30 s1430)
    (free nicole s0900) (free nicole s0930) (free nicole s1030) (free nicole s1100)
    (free nicole s1130) (free nicole s1200) (free nicole s1230) (free nicole s1300)
    (free nicole s1330) (free nicole s1400) (free nicole s1500) (free nicole s1530)
    (free nicole s1600) (free nicole s1630)

    ;; Christine free (busy: 11:00 s1100; 12:30 s1230)
    (free christine s0900) (free christine s0930) (free christine s1000) (free christine s1030)
    (free christine s1130) (free christine s1200) (free christine s1300) (free christine s1330)
    (free christine s1400) (free christine s1430) (free christine s1500) (free christine s1530)
    (free christine s1600) (free christine s1630)

    ;; Anna free (busy: 09:30 s0930, 10:00 s1000, 11:00 s1100, 12:30 s1230, 15:30 s1530, 16:30 s1630)
    ;; Preference "would rather not meet before 14:00" encoded as hard constraint -> only slots >= s1400 allowed
    (free anna s1400) (free anna s1430) (free anna s1500) (free anna s1600)

    ;; Terry free (busy: 09:30-11:30 s0930 s1000 s1030 s1100; 13:00 s1300; 14:00-15:30 s1400 s1430 s1500)
    (free terry s0900) (free terry s1130) (free terry s1200) (free terry s1230)
    (free terry s1330) (free terry s1530) (free terry s1600) (free terry s1630)

    ;; Julie free (busy: 10:00-12:00 s1000 s1030 s1100 s1130; 12:30-13:30 s1230 s1300; 14:00-15:00 s1400 s1430)
    (free julie s0900) (free julie s0930) (free julie s1200) (free julie s1330)
    (free julie s1500) (free julie s1530) (free julie s1600) (free julie s1630)

    ;; Abigail free (busy: 09:00-10:00 s0900 s0930; 11:30 s1130; 12:30-14:00 s1230 s1300 s1330; 14:30 s1430; 16:30 s1630)
    (free abigail s1000) (free abigail s1030) (free abigail s1100) (free abigail s1200)
    (free abigail s1400) (free abigail s1500) (free abigail s1530) (free abigail s1600)

    (unscheduled)
  )
  (:goal (meeting-scheduled))
)