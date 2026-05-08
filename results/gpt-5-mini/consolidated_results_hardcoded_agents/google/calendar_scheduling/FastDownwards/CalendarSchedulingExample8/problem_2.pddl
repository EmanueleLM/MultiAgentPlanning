(define (problem schedule-adam-jerry-matthew)
  (:domain meeting-scheduling)
  (:objects
     adam jerry matthew - participant
     s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - timeslot
  )

  (:init
    ;; Only explicitly state busy (occupied) slots; all other slots are implicitly free.
    ;; Adam busy: s3 (10:00-10:30), s8 (12:30-13:00), s10 (13:30-14:00), s11 (14:00-14:30)
    (occupied adam s3) (occupied adam s8) (occupied adam s10) (occupied adam s11)

    ;; Jerry busy: s1 (09:00-09:30), s7 (12:00-12:30), s13 (15:00-15:30), s14 (15:30-16:00)
    (occupied jerry s1) (occupied jerry s7) (occupied jerry s13) (occupied jerry s14)

    ;; Matthew busy: s2,s3,s4 (09:30-11:00), s6,s7 (11:30-12:30), s9,s10 (13:00-14:00),
    ;; s12,s13,s14,s15,s16 (14:30-17:00)
    (occupied matthew s2) (occupied matthew s3) (occupied matthew s4)
    (occupied matthew s6) (occupied matthew s7)
    (occupied matthew s9) (occupied matthew s10)
    (occupied matthew s12) (occupied matthew s13) (occupied matthew s14) (occupied matthew s15) (occupied matthew s16)
  )

  (:goal (meeting-scheduled))
)