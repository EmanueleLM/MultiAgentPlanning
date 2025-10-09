(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    elijah janet brian carl timothy - participant
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  ; Slot mapping: s1=09:00-09:30, s2=09:30-10:00, s3=10:00-10:30, s4=10:30-11:00,
  ; s5=11:00-11:30, s6=11:30-12:00, s7=12:00-12:30, s8=12:30-13:00,
  ; s9=13:00-13:30, s10=13:30-14:00, s11=14:00-14:30, s12=14:30-15:00,
  ; s13=15:00-15:30, s14=15:30-16:00, s15=16:00-16:30, s16=16:30-17:00
  (:init
    ; Elijah busy: 10:00-11:00 -> s3,s4 ; 12:00-12:30 -> s7 ; 15:00-15:30 -> s13
    (busy elijah s3) (busy elijah s4) (busy elijah s7) (busy elijah s13)

    ; Janet busy: 09:30-10:30 -> s2,s3,s4 ; 13:30-15:30 -> s10,s11,s12,s13
    (busy janet s2) (busy janet s3) (busy janet s4)
    (busy janet s10) (busy janet s11) (busy janet s12) (busy janet s13)

    ; Brian: No meetings on Monday -> busy all slots s1..s16
    (busy brian s1) (busy brian s2) (busy brian s3) (busy brian s4)
    (busy brian s5) (busy brian s6) (busy brian s7) (busy brian s8)
    (busy brian s9) (busy brian s10) (busy brian s11) (busy brian s12)
    (busy brian s13) (busy brian s14) (busy brian s15) (busy brian s16)

    ; Carl busy: 09:30-16:30 -> s2..s15
    (busy carl s2) (busy carl s3) (busy carl s4) (busy carl s5)
    (busy carl s6) (busy carl s7) (busy carl s8) (busy carl s9)
    (busy carl s10) (busy carl s11) (busy carl s12) (busy carl s13)
    (busy carl s14) (busy carl s15)

    ; Timothy busy: 10:30-12:00 -> s4,s5,s6 ; 13:30-14:00 -> s10 ;
    ; 14:30-16:00 -> s12,s13,s14 ; 16:30-17:00 -> s16
    (busy timothy s4) (busy timothy s5) (busy timothy s6)
    (busy timothy s10)
    (busy timothy s12) (busy timothy s13) (busy timothy s14)
    (busy timothy s16)
  )
  (:goal (and (meeting-scheduled)))
)