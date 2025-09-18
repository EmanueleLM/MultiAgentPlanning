(define (problem integrate-schedules-monday)
  (:domain integrated-meeting-domain)

  (:objects
    s9_00  s9_30  s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ; declare slot objects (optional but explicit)
    (slot s9_00)  (slot s9_30)  (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)

    ; --- Donna's knowledge (from agent 1) ---
    ; Donna is known busy at s14_00 and s15_30 (so those are not listed as free)
    (free-donna s9_00)  (free-donna s9_30)  (free-donna s10_00) (free-donna s10_30)
    (free-donna s11_00) (free-donna s11_30) (free-donna s12_00) (free-donna s12_30)
    (free-donna s13_00) (free-donna s13_30)                    (free-donna s14_30)
    (free-donna s15_00)                                  (free-donna s16_00) (free-donna s16_30)

    ; --- Agent2's knowledge (from agent 2) ---
    ; Agent2 is known busy at s11_00 and s16_30 (so those are not listed as free)
    (free-agent2 s9_00)  (free-agent2 s9_30)
    (free-agent2 s10_00) (free-agent2 s10_30)
                         (free-agent2 s11_30)
    (free-agent2 s12_00) (free-agent2 s12_30)
    (free-agent2 s13_00) (free-agent2 s13_30)
    (free-agent2 s14_00) (free-agent2 s14_30)
    (free-agent2 s15_00) (free-agent2 s15_30)
    (free-agent2 s16_00)

    ; --- Billy's knowledge (from agent 3) ---
    ; Billy reported busy intervals that leave only s10_00 and s14_00 as free
    (free-billy s10_00)
    (free-billy s14_00)
  )

  ; Goal: reach a state where a meeting is scheduled (requires all agents' proposals
  ; on the same slot followed by finalize-meeting)
  (:goal (meeting-scheduled))
)