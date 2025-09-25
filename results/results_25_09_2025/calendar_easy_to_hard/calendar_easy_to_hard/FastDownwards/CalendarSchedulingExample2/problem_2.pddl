(define (problem schedule-meeting-monday)
  (:domain multi-agent-scheduling)
  (:objects
    s9_00 s9_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    ;; Roy's free slots (Roy blocking: 9:00,10:00,11:00,12:30)
    (free roy s9_30) (free roy s10_30) (free roy s11_30)
    (free roy s12_00) (free roy s13_00) (free roy s13_30)
    (free roy s14_00) (free roy s14_30) (free roy s15_00)
    (free roy s15_30) (free roy s16_00) (free roy s16_30)

    ;; Kathryn's free slots (Kathryn blocking: 9:30,16:30)
    (free kathryn s9_00) (free kathryn s10_00) (free kathryn s10_30)
    (free kathryn s11_00) (free kathryn s11_30) (free kathryn s12_00)
    (free kathryn s12_30) (free kathryn s13_00) (free kathryn s13_30)
    (free kathryn s14_00) (free kathryn s14_30) (free kathryn s15_00)
    (free kathryn s15_30) (free kathryn s16_00)

    ;; Amy's free slots (Amy blocking: 9:00-14:30 -> blocks s9_00..s14_00; 15:00-16:00 -> blocks s15_00,s15_30; 16:30-17:00 -> s16_30)
    (free amy s14_30) (free amy s16_00)
  )
  ;; Choose a meeting time that is free for all; s14_30 fits everyone's hard constraints and respects Amy's preference for not after 15:30.
  (:goal (meeting-scheduled s14_30))
)