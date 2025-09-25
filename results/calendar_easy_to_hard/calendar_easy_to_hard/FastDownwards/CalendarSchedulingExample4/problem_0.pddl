(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)

  (:objects
    ; 30-minute slots between 09:00 and 17:00 on Monday (start times)
    s9_00 s9_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30 s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30
    ; agents
    donna john billy
  )

  (:init
    ; Public constraint: meeting must be within these slots (encoded by available slot objects).
    ; Agents' availability according to their provided hard constraints:
    ; Donna: busy 14:00-14:30 (s14_00), 15:30-16:00 (s15_30) => free elsewhere within 9-17
    (free donna s9_00) (free donna s9_30) (free donna s10_00) (free donna s10_30)
    (free donna s11_00) (free donna s11_30) (free donna s12_00) (free donna s12_30)
    (free donna s13_00) (free donna s13_30) ; s14_00 busy
    (free donna s14_30) (free donna s15_00) ; s15_30 busy
    (free donna s16_00) (free donna s16_30)

    ; John: busy 11:00-11:30 (s11_00), 16:30-17:00 (s16_30)
    (free john s9_00) (free john s9_30) (free john s10_00) (free john s10_30)
    (free john s11_30) (free john s12_00) (free john s12_30) (free john s13_00)
    (free john s13_30) (free john s14_00) (free john s14_30) (free john s15_00)
    (free john s15_30) (free john s16_00)

    ; Billy: busy 09:00-10:00 (s9_00,s9_30), 10:30-14:00 (s10_30,s11_00,s11_30,s12_00,s12_30,s13_00,s13_30),
    ;        14:30-17:00 (s14_30,s15_00,s15_30,s16_00,s16_30)
    ; => Billy free only at s10_00 and s14_00 within the work window
    (free billy s10_00)
    (free billy s14_00)

    ; Compute/all-free slots from intersection of individual free facts (must be derived by integrator).
    ; Based on the provided availabilities, only s10_00 is free for all three agents.
    (all-free s10_00)

    ; Enforce "Always prefer the earliest feasible meeting slot" as a hard constraint by marking the earliest
    ; all-free slot. Since s10_00 is the only all-free slot, it is also the earliest-all-free.
    (earliest-slot s10_00)
  )

  (:goal (meeting-scheduled))
)