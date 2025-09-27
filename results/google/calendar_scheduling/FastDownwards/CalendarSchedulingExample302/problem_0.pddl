(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    nicole christine anna terry julie abigail - agent
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ; Nicole's free slots (busy 10:00, 14:30 removed)
    (free nicole s09_00) (free nicole s09_30) (free nicole s10_30)
    (free nicole s11_00) (free nicole s11_30) (free nicole s12_00)
    (free nicole s12_30) (free nicole s13_00) (free nicole s13_30)
    (free nicole s14_00) (free nicole s15_00) (free nicole s15_30)
    (free nicole s16_00) (free nicole s16_30)

    ; Christine's free slots (busy 11:00, 12:30 removed)
    (free christine s09_00) (free christine s09_30) (free christine s10_00)
    (free christine s10_30) (free christine s11_30) (free christine s12_00)
    (free christine s13_00) (free christine s13_30) (free christine s14_00)
    (free christine s14_30) (free christine s15_00) (free christine s15_30)
    (free christine s16_00) (free christine s16_30)

    ; Anna's free slots (busy and preference applied: only slots at or after 14:00; busy 15:30 & 16:30 removed)
    (free anna s14_00) (free anna s14_30) (free anna s15_00) (free anna s16_00)

    ; Terry's free slots (busy 09:30-11:30, 13:00-13:30, 14:00-15:30 removed)
    (free terry s09_00) (free terry s11_30) (free terry s12_00) (free terry s12_30)
    (free terry s13_30) (free terry s15_30) (free terry s16_00) (free terry s16_30)

    ; Julie's free slots (busy 10:00-12:00, 12:30-13:30, 14:00-15:00 removed)
    (free julie s09_00) (free julie s09_30) (free julie s12_00) (free julie s13_30)
    (free julie s14_30) (free julie s15_00) (free julie s15_30) (free julie s16_00)
    (free julie s16_30)

    ; Abigail's free slots (busy 09:00-10:00, 11:30-12:00, 12:30-14:00, 14:30-15:00, 16:30-17:00 removed)
    (free abigail s10_00) (free abigail s10_30) (free abigail s11_00)
    (free abigail s12_00) (free abigail s15_00) (free abigail s15_30)
    (free abigail s16_00)
  )

  ; Goal: schedule one meeting (the planner will pick a slot where all free predicates hold).
  (:goal (and (meeting-scheduled)))
)