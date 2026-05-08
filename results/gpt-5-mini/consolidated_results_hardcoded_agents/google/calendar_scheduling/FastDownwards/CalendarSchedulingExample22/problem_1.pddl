(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    theresa charles betty - participant
    m1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; successor relations for contiguous 30-minute slots from 09:00 to 17:00
    (next s1 s2)   ;; 09:00-09:30 -> 09:30-10:00
    (next s2 s3)   ;; 09:30-10:00 -> 10:00-10:30
    (next s3 s4)   ;; 10:00-10:30 -> 10:30-11:00
    (next s4 s5)   ;; 10:30-11:00 -> 11:00-11:30
    (next s5 s6)   ;; 11:00-11:30 -> 11:30-12:00
    (next s6 s7)   ;; 11:30-12:00 -> 12:00-12:30
    (next s7 s8)   ;; 12:00-12:30 -> 12:30-13:00
    (next s8 s9)   ;; 12:30-13:00 -> 13:00-13:30
    (next s9 s10)  ;; 13:00-13:30 -> 13:30-14:00
    (next s10 s11) ;; 13:30-14:00 -> 14:00-14:30
    (next s11 s12) ;; 14:00-14:30 -> 14:30-15:00
    (next s12 s13) ;; 14:30-15:00 -> 15:00-15:30
    (next s13 s14) ;; 15:00-15:30 -> 15:30-16:00
    (next s14 s15) ;; 15:30-16:00 -> 16:00-16:30
    (next s15 s16) ;; 16:00-16:30 -> 16:30-17:00

    ;; Busy slots for Theresa (from provided schedule)
    (busy theresa s1)  ;; 09:00-09:30
    (busy theresa s8)  ;; 12:30-13:00
    (busy theresa s9)  ;; 13:00-13:30
    (busy theresa s11) ;; 14:00-14:30
    (busy theresa s12) ;; 14:30-15:00
    (busy theresa s16) ;; 16:30-17:00

    ;; Busy slots for Charles (from provided schedule)
    (busy charles s3)  ;; 10:00-10:30
    (busy charles s6)  ;; 11:30-12:00
    (busy charles s7)  ;; 12:00-12:30
    (busy charles s11) ;; 14:00-14:30
    (busy charles s12) ;; 14:30-15:00
    (busy charles s13) ;; 15:00-15:30

    ;; Busy slots for Betty (from provided schedule)
    (busy betty s1)  ;; 09:00-09:30
    (busy betty s2)  ;; 09:30-10:00
    (busy betty s3)  ;; 10:00-10:30
    (busy betty s7)  ;; 12:00-12:30
    (busy betty s9)  ;; 13:00-13:30
    (busy betty s10) ;; 13:30-14:00
    (busy betty s13) ;; 15:00-15:30
    (busy betty s14) ;; 15:30-16:00

    ;; Meeting initially unscheduled
    (unscheduled m1)
  )

  ;; Goal: ensure the meeting becomes scheduled (any valid start slot)
  (:goal (not (unscheduled m1)))
)