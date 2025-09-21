(define (problem schedule-meeting-monday)
  (:domain multi-agent-scheduling)

  ;; Slot mapping (half-hour starts) for Monday:
  ;; s1 = 09:00, s2 = 09:30, s3 = 10:00, s4 = 10:30,
  ;; s5 = 11:00, s6 = 11:30, s7 = 12:00, s8 = 12:30,
  ;; s9 = 13:00, s10 = 13:30, s11 = 14:00, s12 = 14:30,
  ;; s13 = 15:00, s14 = 15:30, s15 = 16:00, s16 = 16:30.

  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    (monday)

    ;; ----- Roy's information (agent 1) -----
    ;; Known blocked: s1 (09:00), s3 (10:00), s5 (11:00), s8 (12:30).
    ;; Therefore Roy considers all other slots free:
    (free-roy s2) (free-roy s4) (free-roy s6) (free-roy s7)
    (free-roy s9) (free-roy s10) (free-roy s11) (free-roy s12)
    (free-roy s13) (free-roy s14) (free-roy s15) (free-roy s16)

    ;; ----- Kathryn's information (agent 2) -----
    ;; Busy: 09:30 (s2) and 16:30 (s16). All other Monday slots listed as free.
    (free-kathryn s1) (free-kathryn s3) (free-kathryn s4) (free-kathryn s5)
    (free-kathryn s6) (free-kathryn s7) (free-kathryn s8) (free-kathryn s9)
    (free-kathryn s10) (free-kathryn s11) (free-kathryn s12)
    (free-kathryn s13) (free-kathryn s14) (free-kathryn s15)

    ;; ----- Amy's information (agent 3) -----
    ;; Blocked: 09:00–14:30 (s1..s11), 15:00–16:00 (s13,s14), 16:30–17:00 (s16).
    ;; Available given Amy's calendar: s12 (14:30) and s15 (16:00).
    (free-amy s12) (free-amy s15)

    ;; Amy's preference: prefers not to meet after 15:30 -> prefers s12 (14:30)
    (preferred-amy s12)
  )

  ;; Goal: schedule one meeting acceptable to all three agents (Roy, Kathryn, Amy).
  ;; The planner may choose any slot that satisfies all agents' constraints; here
  ;; both s12 (14:30) and s15 (16:00) are feasible. Amy prefers s12.
  (:goal (meeting-scheduled))
)