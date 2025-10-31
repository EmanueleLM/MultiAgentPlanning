(define (problem CalendarSchedulingExample34-problem)
  (:domain calendar-scheduling)
  (:objects
    christine janice bobby elizabeth tyler edward - person
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    ; Christine busy: 09:30-10:30 -> s2,s3 ; 12:00-12:30 -> s7 ; 13:00-13:30 -> s9 ; 14:30-15:00 -> s12 ; 16:00-16:30 -> s15
    (busy christine s2)
    (busy christine s3)
    (busy christine s7)
    (busy christine s9)
    (busy christine s12)
    (busy christine s15)

    ; Janice busy: none

    ; Bobby busy: 12:00-12:30 -> s7 ; 14:30-15:00 -> s12
    (busy bobby s7)
    (busy bobby s12)

    ; Elizabeth busy: 09:00-09:30 -> s1 ; 11:30-13:00 -> s6,s7,s8 ; 13:30-14:00 -> s10 ; 15:00-15:30 -> s13 ; 16:00-17:00 -> s15,s16
    (busy elizabeth s1)
    (busy elizabeth s6)
    (busy elizabeth s7)
    (busy elizabeth s8)
    (busy elizabeth s10)
    (busy elizabeth s13)
    (busy elizabeth s15)
    (busy elizabeth s16)

    ; Tyler busy: 09:00-11:00 -> s1,s2,s3,s4 ; 12:00-12:30 -> s7 ; 13:00-13:30 -> s9 ; 15:30-16:00 -> s14 ; 16:30-17:00 -> s16
    (busy tyler s1)
    (busy tyler s2)
    (busy tyler s3)
    (busy tyler s4)
    (busy tyler s7)
    (busy tyler s9)
    (busy tyler s14)
    (busy tyler s16)

    ; Edward busy: 09:00-09:30 -> s1 ; 10:00-11:00 -> s3,s4 ; 11:30-14:00 -> s6,s7,s8,s9 ; 14:30-15:30 -> s12,s13 ; 16:00-17:00 -> s15,s16
    (busy edward s1)
    (busy edward s3)
    (busy edward s4)
    (busy edward s6)
    (busy edward s7)
    (busy edward s8)
    (busy edward s9)
    (busy edward s12)
    (busy edward s13)
    (busy edward s15)
    (busy edward s16)

    ; preferred slots = before 13:00 (09:00 up to 12:30) -> s1..s8
    (preferred s1)
    (preferred s2)
    (preferred s3)
    (preferred s4)
    (preferred s5)
    (preferred s6)
    (preferred s7)
    (preferred s8)
  )
  (:goal (and
    (meeting-scheduled)
    (scheduled-preferred)
  ))
)