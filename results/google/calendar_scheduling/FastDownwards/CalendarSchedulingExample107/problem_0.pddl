(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16
    peter judith keith evelyn
  )

  (:init
    ;; slots
    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ;; participants
    (participant peter) (participant judith) (participant keith) (participant evelyn)

    ;; availability facts (only slots not listed as busy by each participant)
    ;; Peter unavailable: s1, s4, s6, s8  -> available: s2,s3,s5,s7,s9,s10,s11,s12,s13,s14,s15,s16
    (available peter s2) (available peter s3) (available peter s5) (available peter s7)
    (available peter s9) (available peter s10) (available peter s11) (available peter s12)
    (available peter s13) (available peter s14) (available peter s15) (available peter s16)

    ;; Judith: no scheduled events -> available all slots
    (available judith s1) (available judith s2) (available judith s3) (available judith s4)
    (available judith s5) (available judith s6) (available judith s7) (available judith s8)
    (available judith s9) (available judith s10) (available judith s11) (available judith s12)
    (available judith s13) (available judith s14) (available judith s15) (available judith s16)

    ;; Keith unavailable: s6, s8, s9, s10, s11, s12, s14, s16 -> available: s1,s2,s3,s4,s5,s7,s13,s15
    (available keith s1) (available keith s2) (available keith s3) (available keith s4)
    (available keith s5) (available keith s7) (available keith s13) (available keith s15)

    ;; Evelyn unavailable: s1,s2,s3,s4,s5,s6,s7, s10,s11,s12,s13, s16 -> available: s8,s9,s14,s15
    (available evelyn s8) (available evelyn s9) (available evelyn s14) (available evelyn s15)
  )

  ;; Goal: schedule the single 30-minute meeting at the earliest slot that is free for all participants.
  ;; Computed earliest common available slot is s15 (16:00-16:30).
  (:goal (and (meeting-scheduled) (meeting-at s15)))
)