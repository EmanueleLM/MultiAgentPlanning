(define (problem schedule-adam-jerry-matthew)
  (:domain meeting-scheduling)
  (:objects
     adam jerry matthew - participant
     s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - timeslot
  )

  (:init
    ;; Slot mapping (implicit): s1=09:00-09:30, s2=09:30-10:00, s3=10:00-10:30,
    ;; s4=10:30-11:00, s5=11:00-11:30, s6=11:30-12:00, s7=12:00-12:30, s8=12:30-13:00,
    ;; s9=13:00-13:30, s10=13:30-14:00, s11=14:00-14:30, s12=14:30-15:00,
    ;; s13=15:00-15:30, s14=15:30-16:00, s15=16:00-16:30, s16=16:30-17:00.

    ;; Busy facts derived from participants' schedules
    ;; Adam busy: 10:00-10:30 (s3), 12:30-13:00 (s8), 13:30-14:30 (s10,s11)
    (busy adam s3) (busy adam s8) (busy adam s10) (busy adam s11)

    ;; Jerry busy: 09:00-09:30 (s1), 12:00-12:30 (s7), 15:00-16:00 (s13,s14)
    (busy jerry s1) (busy jerry s7) (busy jerry s13) (busy jerry s14)

    ;; Matthew busy: 09:30-11:00 (s2,s3,s4), 11:30-12:30 (s6,s7),
    ;; 13:00-14:00 (s9,s10), 14:30-17:00 (s12,s13,s14,s15,s16)
    (busy matthew s2) (busy matthew s3) (busy matthew s4)
    (busy matthew s6) (busy matthew s7)
    (busy matthew s9) (busy matthew s10)
    (busy matthew s12) (busy matthew s13) (busy matthew s14) (busy matthew s15) (busy matthew s16)
  )

  ;; Goal: a single meeting has been scheduled at some slot free for all participants.
  (:goal (meeting-scheduled))
)