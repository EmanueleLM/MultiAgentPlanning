; Problem: schedule a 60-minute meeting on Monday within 09:00-17:00 that fits all participants
; This problem encodes 30-minute slots from 09:00 (s0) to 16:30 (s15). A 60-minute meeting requires two consecutive slots.
(define (problem schedule-monday-1h)
  (:domain meeting-scheduling)
  (:objects
    participant-a participant-b participant-c - participant
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - slot
  )

  (:init
    ; successor relations (30-minute steps)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ; Normalized availabilities (30-min granules) derived from auditor's normalization.
    ; Participant A: 09:30–10:30 -> slots s1, s2
    ;                12:00–16:00 -> slots s6..s13
    (available participant-a s1) (available participant-a s2)
    (available participant-a s6) (available participant-a s7)
    (available participant-a s8) (available participant-a s9)
    (available participant-a s10) (available participant-a s11)
    (available participant-a s12) (available participant-a s13)

    ; Participant B: 09:00–13:00 -> slots s0..s7
    ;                14:30–17:00 -> slots s11..s15
    (available participant-b s0) (available participant-b s1)
    (available participant-b s2) (available participant-b s3)
    (available participant-b s4) (available participant-b s5)
    (available participant-b s6) (available participant-b s7)
    (available participant-b s11) (available participant-b s12)
    (available participant-b s13) (available participant-b s14)
    (available participant-b s15)

    ; Participant C: merged 09:00–10:30 -> slots s0,s1,s2
    ;                11:00–12:00 -> slots s4,s5
    (available participant-c s0) (available participant-c s1) (available participant-c s2)
    (available participant-c s4) (available participant-c s5)

    ; No confirmations and no meeting scheduled initially (absence of facts)
  )

  ; Goal: enforce a concrete scheduled start time that satisfies all constraints.
  ; Auditor-computed common feasible 60-min slot across all participants is 09:30 (s1 -> s2).
  (:goal (and
    (meeting-scheduled)
    (scheduled-at s1)
  ))
)