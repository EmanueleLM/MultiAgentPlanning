(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    donna john billy - agent

    s09_00_09_30  s09_30_10_00  s10_00_10_30  s10_30_11_00
    s11_00_11_30  s11_30_12_00  s12_00_12_30  s12_30_13_00
    s13_00_13_30  s13_30_14_00  s14_00_14_30  s14_30_15_00
    s15_00_15_30  s15_30_16_00  s16_00_16_30  s16_30_17_00 - slot
  )

  (:init
    ; Donna free slots (busy: 14:00-14:30, 15:30-16:00)
    (free donna s09_00_09_30)
    (free donna s09_30_10_00)
    (free donna s10_00_10_30)
    (free donna s10_30_11_00)
    (free donna s11_00_11_30)
    (free donna s11_30_12_00)
    (free donna s12_00_12_30)
    (free donna s12_30_13_00)
    (free donna s13_00_13_30)
    (free donna s13_30_14_00)
    (free donna s14_30_15_00)
    (free donna s15_00_15_30)
    (free donna s16_00_16_30)
    (free donna s16_30_17_00)

    ; John free slots (busy: 11:00-11:30, 16:30-17:00)
    (free john s09_00_09_30)
    (free john s09_30_10_00)
    (free john s10_00_10_30)
    (free john s10_30_11_00)
    (free john s11_30_12_00)
    (free john s12_00_12_30)
    (free john s12_30_13_00)
    (free john s13_00_13_30)
    (free john s13_30_14_00)
    (free john s14_00_14_30)
    (free john s14_30_15_00)
    (free john s15_00_15_30)
    (free john s15_30_16_00)
    (free john s16_00_16_30)

    ; Billy free slots (busy: 09:00-10:00, 10:30-14:00, 14:30-17:00)
    (free billy s10_00_10_30)
    (free billy s14_00_14_30)

    ; Combined predicate: only slots free for all participants are marked all-free.
    ; Intersection of free sets yields only s10_00_10_30 as common free slot.
    (all-free s10_00_10_30)

    ; Encode preference-as-hard-constraint: require earliest common slot only.
    (earliest s10_00_10_30)
  )

  (:goal (and
    (scheduled s10_00_10_30)
  ))
)