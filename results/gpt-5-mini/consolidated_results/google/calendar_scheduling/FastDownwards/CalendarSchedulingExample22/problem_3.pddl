(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    theresa charles betty - participant
    m1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; successor relations for contiguous half-hour slots between 09:00-17:00
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)
    (next s5 s6)
    (next s6 s7)
    (next s7 s8)
    (next s8 s9)
    (next s9 s10)
    (next s10 s11)
    (next s11 s12)
    (next s12 s13)
    (next s13 s14)
    (next s14 s15)
    (next s15 s16)

    ;; Busy slots mapped to half-hour slots:
    ;; Slot mapping:
    ;; s1 09:00-09:30, s2 09:30-10:00, s3 10:00-10:30, s4 10:30-11:00,
    ;; s5 11:00-11:30, s6 11:30-12:00, s7 12:00-12:30, s8 12:30-13:00,
    ;; s9 13:00-13:30, s10 13:30-14:00, s11 14:00-14:30, s12 14:30-15:00,
    ;; s13 15:00-15:30, s14 15:30-16:00, s15 16:00-16:30, s16 16:30-17:00

    ;; Theresa busy: 09:00-09:30 (s1), 12:30-13:30 (s8,s9), 14:00-15:00 (s11,s12), 16:30-17:00 (s16)
    (busy theresa s1)
    (busy theresa s8)
    (busy theresa s9)
    (busy theresa s11)
    (busy theresa s12)
    (busy theresa s16)

    ;; Charles busy: 10:00-10:30 (s3), 11:30-12:30 (s6,s7), 14:00-15:30 (s11,s12,s13)
    (busy charles s3)
    (busy charles s6)
    (busy charles s7)
    (busy charles s11)
    (busy charles s12)
    (busy charles s13)

    ;; Betty busy: 09:00-10:30 (s1,s2,s3), 12:00-12:30 (s7), 13:00-14:00 (s9,s10), 15:00-16:00 (s13,s14)
    (busy betty s1)
    (busy betty s2)
    (busy betty s3)
    (busy betty s7)
    (busy betty s9)
    (busy betty s10)
    (busy betty s13)
    (busy betty s14)

    ;; meeting initially unscheduled
    (unscheduled m1)
  )

  ;; Goal: the meeting must be scheduled occupying two consecutive slots
  (:goal (not (unscheduled m1)))
)