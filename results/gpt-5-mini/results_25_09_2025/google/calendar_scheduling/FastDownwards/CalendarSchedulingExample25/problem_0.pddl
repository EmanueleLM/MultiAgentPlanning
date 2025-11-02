(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)

  (:objects
    anthony pamela zachary - agent

    s9_00  s9_30  s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; consecutive half-hour relation
    (next s9_00 s9_30) (next s9_30 s10_00) (next s10_00 s10_30) (next s10_30 s11_00)
    (next s11_00 s11_30) (next s11_30 s12_00) (next s12_00 s12_30) (next s12_30 s13_00)
    (next s13_00 s13_30) (next s13_30 s14_00) (next s14_00 s14_30) (next s14_30 s15_00)
    (next s15_00 s15_30) (next s15_30 s16_00) (next s16_00 s16_30)

    ;; Free slots per agent (computed from their busy times and Pamela's stated preference)
    ;; Anthony: busy 9:30, 12:00-13:00 (12:00 & 12:30), 16:00
    ;; free = all work slots except s9_30, s12_00, s12_30, s16_00
    (free anthony s9_00) (free anthony s10_00) (free anthony s10_30) (free anthony s11_00)
    (free anthony s11_30) (free anthony s13_00) (free anthony s13_30) (free anthony s14_00)
    (free anthony s14_30) (free anthony s15_00) (free anthony s15_30) (free anthony s16_30)

    ;; Pamela: busy 9:30, 16:30; prefers no meetings after 14:30
    ;; Respecting preference as a hard constraint: she is not marked free for slots starting at 14:30 or later
    ;; free = 9:00,10:00,10:30,11:00,11:30,12:00,12:30,13:00,13:30,14:00 (excluding 9:30)
    (free pamela s9_00) (free pamela s10_00) (free pamela s10_30) (free pamela s11_00)
    (free pamela s11_30) (free pamela s12_00) (free pamela s12_30) (free pamela s13_00)
    (free pamela s13_30) (free pamela s14_00)

    ;; Zachary: busy 9:00-11:30 (9:00,9:30,10:00,10:30,11:00), 12:00,13:00,14:30,16:00-17:00 (16:00 & 16:30)
    ;; free slots left: 11:30,12:30,13:30,14:00,15:00,15:30
    (free zachary s11_30) (free zachary s12_30) (free zachary s13_30) (free zachary s14_00)
    (free zachary s15_00) (free zachary s15_30)
  )

  ;; Goal: find a meeting start slot where the meeting (one hour = two consecutive half-hour slots) is scheduled for all participants.
  ;; From the above constraints the available common one-hour slot is 13:30-14:30 (start s13_30).
  (:goal (meeting-scheduled s13_30))
)