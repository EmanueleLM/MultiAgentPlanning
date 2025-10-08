(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    marie janice elijah theresa - participant
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  ;; Initial state: mark free slots for each participant according to provided busy intervals
  ;; Busy intervals were converted to unavailable slots; Theresa's "no meetings after 12:00" is enforced
  ;; by not marking her free for any slot that starts at or after 12:00 (s7..s16).

  (:init
    ;; total-cost zero
    (= (total-cost) 0)

    ;; Marie free: all except s5 (11:00-11:30) and s13,s14,s15 (15:00-16:30)
    (free marie s1) (free marie s2) (free marie s3) (free marie s4)
    (free marie s6) (free marie s7) (free marie s8) (free marie s9)
    (free marie s10) (free marie s11) (free marie s12) (free marie s16)

    ;; Janice free: all except s8 (12:30-13:00) and s10,s11,s12 (13:30-15:00)
    (free janice s1) (free janice s2) (free janice s3) (free janice s4)
    (free janice s5) (free janice s6) (free janice s7)
    (free janice s9) (free janice s13) (free janice s14) (free janice s15) (free janice s16)

    ;; Elijah free: all except s3,s4,s5,s6,s7,s8 (10:00-13:00), s12 (14:30-15:00), s15 (16:00-16:30)
    (free elijah s1) (free elijah s2)
    (free elijah s9) (free elijah s10) (free elijah s11)
    (free elijah s13) (free elijah s14) (free elijah s16)

    ;; Theresa free: enforce busy intervals AND preference "no meetings after 12:00" (treated as hard)
    ;; Busy: s2,s3,s7,s8,s10,s12,s14,s16; and no meetings after 12:00 -> only allow s1..s6 subject to busy.
    (free theresa s1) (free theresa s4) (free theresa s5) (free theresa s6)
  )

  ;; Minimize total-cost to prefer earliest feasible slot
  (:metric minimize (total-cost))

  ;; Goal: a single meeting scheduled at some slot (meeting-scheduled becomes true)
  (:goal (meeting-scheduled))
)