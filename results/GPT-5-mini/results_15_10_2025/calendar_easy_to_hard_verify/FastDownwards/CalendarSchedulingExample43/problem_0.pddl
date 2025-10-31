(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    wayne edward lauren helen michael joseph vincent - participant
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    ;; Wayne available (busy 14:30-15:00 -> s12; busy 15:30-16:00 -> s14)
    (available wayne s1) (available wayne s2) (available wayne s3) (available wayne s4)
    (available wayne s5) (available wayne s6) (available wayne s7) (available wayne s8)
    (available wayne s9) (available wayne s10) (available wayne s11)
    (available wayne s13) (available wayne s15) (available wayne s16)

    ;; Edward: free entire day
    (available edward s1) (available edward s2) (available edward s3) (available edward s4)
    (available edward s5) (available edward s6) (available edward s7) (available edward s8)
    (available edward s9) (available edward s10) (available edward s11) (available edward s12)
    (available edward s13) (available edward s14) (available edward s15) (available edward s16)

    ;; Lauren: free entire day
    (available lauren s1) (available lauren s2) (available lauren s3) (available lauren s4)
    (available lauren s5) (available lauren s6) (available lauren s7) (available lauren s8)
    (available lauren s9) (available lauren s10) (available lauren s11) (available lauren s12)
    (available lauren s13) (available lauren s14) (available lauren s15) (available lauren s16)

    ;; Helen: free entire day
    (available helen s1) (available helen s2) (available helen s3) (available helen s4)
    (available helen s5) (available helen s6) (available helen s7) (available helen s8)
    (available helen s9) (available helen s10) (available helen s11) (available helen s12)
    (available helen s13) (available helen s14) (available helen s15) (available helen s16)

    ;; Michael unavailable: 09:00-10:00 (s1,s2), 10:30-11:30 (s4,s5), 12:00-13:00 (s7,s8),
    ;; 13:30-14:30 (s10,s11), 16:00-17:00 (s15,s16)
    ;; So available: s3, s6, s9, s12, s13, s14
    (available michael s3) (available michael s6) (available michael s9)
    (available michael s12) (available michael s13) (available michael s14)

    ;; Joseph unavailable: 09:00-12:00 (s1..s6), 14:00-14:30 (s11), 15:30-16:00 (s14)
    ;; So available: s7, s8, s9, s10, s12, s13, s15, s16
    (available joseph s7) (available joseph s8) (available joseph s9) (available joseph s10)
    (available joseph s12) (available joseph s13) (available joseph s15) (available joseph s16)

    ;; Vincent unavailable: 09:00-10:30 (s1,s2,s3), 11:30-13:00 (s6,s7,s8),
    ;; 13:30-14:00 (s10), 14:30-17:00 (s12..s16)
    ;; So available: s4, s5, s9, s11
    (available vincent s4) (available vincent s5) (available vincent s9) (available vincent s11)
  )
  ;; Goal: schedule the single 30-minute meeting at the earliest feasible slot (s9 = 13:00-13:30)
  (:goal (and (meeting-scheduled) (scheduled s9)))
)