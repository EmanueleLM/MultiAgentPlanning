(define (problem schedule-integrated-monday)
  (:domain meeting-scheduling-integrated)

  (:objects
    ;; Persons (three participants)
    katherine nicole kevin - person

    ;; Meeting to schedule (one-hour = two consecutive half-hour slots)
    meeting1 - meeting

    ;; 16 half-hour slots from 09:00-09:30 (s0) ... 16:30-17:00 (s15)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ;; slot declarations (for agent3's slot predicate)
    (slot s0) (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7)
    (slot s8) (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15)

    ;; Consecutive-slot relations (30-min resolution). Meeting requires two consecutive slots.
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; Work hours: all 16 slots are within 09:00-17:00 (used by agent2)
    (within-work-hours s0) (within-work-hours s1) (within-work-hours s2) (within-work-hours s3)
    (within-work-hours s4) (within-work-hours s5) (within-work-hours s6) (within-work-hours s7)
    (within-work-hours s8) (within-work-hours s9) (within-work-hours s10) (within-work-hours s11)
    (within-work-hours s12) (within-work-hours s13) (within-work-hours s14) (within-work-hours s15)

    ;; Agent1 (Katherine) availability: free entire day (private info provided by agent1)
    (free katherine s0) (free katherine s1) (free katherine s2) (free katherine s3)
    (free katherine s4) (free katherine s5) (free katherine s6) (free katherine s7)
    (free katherine s8) (free katherine s9) (free katherine s10) (free katherine s11)
    (free katherine s12) (free katherine s13) (free katherine s14) (free katherine s15)

    ;; Agent2 (Nicole) availability: free entire day (private info provided by agent2)
    (free nicole s0) (free nicole s1) (free nicole s2) (free nicole s3)
    (free nicole s4) (free nicole s5) (free nicole s6) (free nicole s7)
    (free nicole s8) (free nicole s9) (free nicole s10) (free nicole s11)
    (free nicole s12) (free nicole s13) (free nicole s14) (free nicole s15)

    ;; Agent3 (Kevin) private calendar has been pre-processed by agent3 into allowed start slots.
    ;; According to agent3, only start slot s13 (15:30) is allowed so a 60-minute meeting fits Kevin.
    (start-allowed s13)

    ;; Unscheduled flags for each agent (they will be consumed when that agent schedules)
    (unscheduled_a1 meeting1)
    (unscheduled_a2 meeting1)
    (unscheduled_a3 meeting1)
  )

  ;; Goal: meeting must be scheduled compatibly with all three agents' assertions.
  ;; We require that:
  ;;  - agent1 records the meeting and its start slot (meeting_at_a1 ...)
  ;;  - agent2 records the meeting starting at the same chosen slot
  ;;  - agent3 records the meeting starting at the same chosen slot
  ;; Together this guarantees the chosen start slot is acceptable to all participants.
  (:goal (and
    (scheduled_a1 meeting1)
    (meeting_at_a1 meeting1 s13)
    (scheduled_a2 meeting1 s13)
    (scheduled_a3 meeting1 s13)
  ))
)