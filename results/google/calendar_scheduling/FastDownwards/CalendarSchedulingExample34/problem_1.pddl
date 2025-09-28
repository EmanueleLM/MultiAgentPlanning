(define (problem calendar-scheduling-problem34)
  (:domain calendar-scheduling)
  (:objects
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
    christine janice bobby elizabeth tyler edward - participant
  )
  (:init
    ;; total cost starts at 0
    (= (total-cost) 0)

    ;; Janice preference: prefer before 13:00 -> slots s1..s8 are before13
    (before13 s1)
    (before13 s2)
    (before13 s3)
    (before13 s4)
    (before13 s5)
    (before13 s6)
    (before13 s7)
    (before13 s8)

    ;; Busy intervals encoded as busy facts per 30-min slot
    ;; Christine busy: 09:30-10:30 -> s2,s3; 12:00-12:30 -> s7; 13:00-13:30 -> s9; 14:30-15:00 -> s12; 16:00-16:30 -> s15
    (busy christine s2)
    (busy christine s3)
    (busy christine s7)
    (busy christine s9)
    (busy christine s12)
    (busy christine s15)

    ;; Janice busy: none (no busy facts)

    ;; Bobby busy: 12:00-12:30 -> s7; 14:30-15:00 -> s12
    (busy bobby s7)
    (busy bobby s12)

    ;; Elizabeth busy: 09:00-09:30 -> s1; 11:30-13:00 -> s6,s7,s8; 13:30-14:00 -> s10; 15:00-15:30 -> s13; 16:00-17:00 -> s15,s16
    (busy elizabeth s1)
    (busy elizabeth s6)
    (busy elizabeth s7)
    (busy elizabeth s8)
    (busy elizabeth s10)
    (busy elizabeth s13)
    (busy elizabeth s15)
    (busy elizabeth s16)

    ;; Tyler busy: 09:00-11:00 -> s1,s2,s3,s4; 12:00-12:30 -> s7; 13:00-13:30 -> s9; 15:30-16:00 -> s14; 16:30-17:00 -> s16
    (busy tyler s1)
    (busy tyler s2)
    (busy tyler s3)
    (busy tyler s4)
    (busy tyler s7)
    (busy tyler s9)
    (busy tyler s14)
    (busy tyler s16)

    ;; Edward busy: 09:00-09:30 -> s1; 10:00-11:00 -> s3,s4; 11:30-14:00 -> s6,s7,s8,s9,s10; 14:30-15:30 -> s12,s13; 16:00-17:00 -> s15,s16
    (busy edward s1)
    (busy edward s3)
    (busy edward s4)
    (busy edward s6)
    (busy edward s7)
    (busy edward s8)
    (busy edward s9)
    (busy edward s10)
    (busy edward s12)
    (busy edward s13)
    (busy edward s15)
    (busy edward s16)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)