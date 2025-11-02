(define (problem orchestrate-meeting-monday)
  (:domain multi-agent-meeting-scheduling)

  ;; Unified slot naming (slot0 = 09:00-09:30 ... slot15 = 16:30-17:00)
  (:objects
    slot0 slot1 slot2 slot3 slot4 slot5 slot6 slot7 slot8 slot9 slot10 slot11 slot12 slot13 slot14 slot15 - slot
    start0 start1 start2 start3 start4 start5 start6 start7 start8 start9 start10 start11 start12 start13 start14 - start
  )

  (:init
    ;; next relations (30-minute consecutive steps)
    (next slot0 slot1) (next slot1 slot2) (next slot2 slot3) (next slot3 slot4)
    (next slot4 slot5) (next slot5 slot6) (next slot6 slot7) (next slot7 slot8)
    (next slot8 slot9) (next slot9 slot10) (next slot10 slot11) (next slot11 slot12)
    (next slot12 slot13) (next slot13 slot14) (next slot14 slot15)

    ;; william's uses mapping (start -> two consecutive slots)
    (uses start0  slot0  slot1)
    (uses start1  slot1  slot2)
    (uses start2  slot2  slot3)
    (uses start3  slot3  slot4)
    (uses start4  slot4  slot5)
    (uses start5  slot5  slot6)
    (uses start6  slot6  slot7)
    (uses start7  slot7  slot8)
    (uses start8  slot8  slot9)
    (uses start9  slot9  slot10)
    (uses start10 slot10 slot11)
    (uses start11 slot11 slot12)
    (uses start12 slot12 slot13)
    (uses start13 slot13 slot14)
    (uses start14 slot14 slot15)

    ;; Maria's initial unscheduled flag
    (unscheduled)

    ;; Initial availability from the three agents' supplied calendars.
    ;; We keep each agent's calendar separate so the orchestrator can require
    ;; that chosen slots be free for all participants.

    ;; Billy's free slots (from billy's problem: s0,s1,s2,s3,s4,s6,s7,s12,s13,s15)
    (free-billy slot0) (free-billy slot1) (free-billy slot2) (free-billy slot3)
    (free-billy slot4) (free-billy slot6) (free-billy slot7)
    (free-billy slot12) (free-billy slot13) (free-billy slot15)

    ;; Maria's free slots (from maria's problem: t1,t3,t4,t5,t6,t7,t9,t11,t12,t13,t14,t15)
    (free-maria slot1) (free-maria slot3) (free-maria slot4) (free-maria slot5)
    (free-maria slot6) (free-maria slot7) (free-maria slot9) (free-maria slot11)
    (free-maria slot12) (free-maria slot13) (free-maria slot14) (free-maria slot15)

    ;; William's free slots (from william's problem: slot0,slot2,slot3,slot4,slot5,slot7,slot8,slot12)
    (free-william slot0) (free-william slot2) (free-william slot3) (free-william slot4)
    (free-william slot5) (free-william slot7) (free-william slot8) (free-william slot12)

    ;; Note: meeting-scheduled not present initially.
  )

  ;; Global goal: orchestrate participants to schedule a one-hour meeting on Monday
  ;; between 09:00 and 17:00 that fits everyone's calendars (i.e., set meeting-scheduled).
  (:goal (meeting-scheduled))
)