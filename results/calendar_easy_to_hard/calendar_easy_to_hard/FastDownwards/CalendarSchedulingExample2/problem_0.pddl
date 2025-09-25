(define (problem schedule-meeting-monday)
  (:domain multi-agent-scheduling)

  ;; slots represent half-hour start times from 9:00 to 16:30
  (:objects
    s9_00 s9_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Roy: blocked on Monday during 9:00 to 9:30 (s9_00), 10:00 to 10:30 (s10_00),
    ;; 11:00 to 11:30 (s11_00), 12:30 to 13:00 (s12_30)
    ;; So Roy is free on all other slots:
    (free roy s9_30) (free roy s10_30) (free roy s11_30)
    (free roy s12_00) (free roy s13_00) (free roy s13_30)
    (free roy s14_00) (free roy s14_30) (free roy s15_00)
    (free roy s15_30) (free roy s16_00) (free roy s16_30)

    ;; Kathryn: blocked 9:30 to 10:00 (s9_30), 16:30 to 17:00 (s16_30)
    ;; Kathryn free on all other slots:
    (free kathryn s9_00) (free kathryn s10_00) (free kathryn s10_30)
    (free kathryn s11_00) (free kathryn s11_30) (free kathryn s12_00)
    (free kathryn s12_30) (free kathryn s13_00) (free kathryn s13_30)
    (free kathryn s14_00) (free kathryn s14_30) (free kathryn s15_00)
    (free kathryn s15_30) (free kathryn s16_00)

    ;; Amy: blocked 9:00 to 14:30 (s9_00..s14_30), 15:00 to 16:00 (s15_00,s15_30),
    ;; and 16:30 to 17:00 (s16_30). So Amy is only free at s16_00.
    (free amy s16_00)

    ;; No accepted slots initially and meeting not finalized
  )

  ;; Goal: schedule a half-hour meeting for Roy, Kathryn and Amy on Monday.
  ;; Based on the given availabilities, the only common free slot is s16_00 (16:00-16:30).
  (:goal (meeting-scheduled s16_00))
)