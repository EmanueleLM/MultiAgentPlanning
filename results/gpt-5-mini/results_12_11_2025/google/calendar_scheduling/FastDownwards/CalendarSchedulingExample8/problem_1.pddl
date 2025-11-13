(define (problem schedule-adam-jerry-matthew)
  (:domain meeting-scheduling)
  (:objects
     adam jerry matthew - participant
     s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - timeslot
  )
  ;; Timeslots (30-minute increments) for Monday 09:00-17:00:
  ;; s1=09:00-09:30, s2=09:30-10:00, s3=10:00-10:30, s4=10:30-11:00,
  ;; s5=11:00-11:30, s6=11:30-12:00, s7=12:00-12:30, s8=12:30-13:00,
  ;; s9=13:00-13:30, s10=13:30-14:00, s11=14:00-14:30, s12=14:30-15:00,
  ;; s13=15:00-15:30, s14=15:30-16:00, s15=16:00-16:30, s16=16:30-17:00

  (:init
    ;; Adam busy: 10:00-10:30 (s3), 12:30-13:00 (s8), 13:30-14:30 (s10,s11)
    (occupied adam s3) (occupied adam s8) (occupied adam s10) (occupied adam s11)
    (free adam s1) (free adam s2) (free adam s4) (free adam s5) (free adam s6)
    (free adam s7) (free adam s9) (free adam s12) (free adam s13) (free adam s14)
    (free adam s15) (free adam s16)

    ;; Jerry busy: 09:00-09:30 (s1), 12:00-12:30 (s7), 15:00-16:00 (s13,s14)
    (occupied jerry s1) (occupied jerry s7) (occupied jerry s13) (occupied jerry s14)
    (free jerry s2) (free jerry s3) (free jerry s4) (free jerry s5) (free jerry s6)
    (free jerry s8) (free jerry s9) (free jerry s10) (free jerry s11) (free jerry s12)
    (free jerry s15) (free jerry s16)

    ;; Matthew busy: 09:30-11:00 (s2,s3,s4), 11:30-12:30 (s6,s7),
    ;; 13:00-14:00 (s9,s10), 14:30-17:00 (s12,s13,s14,s15,s16)
    (occupied matthew s2) (occupied matthew s3) (occupied matthew s4)
    (occupied matthew s6) (occupied matthew s7)
    (occupied matthew s9) (occupied matthew s10)
    (occupied matthew s12) (occupied matthew s13) (occupied matthew s14) (occupied matthew s15) (occupied matthew s16)
    (free matthew s1) (free matthew s5) (free matthew s8) (free matthew s11)
  )

  ;; Goal: require that a single meeting is scheduled for the group.
  ;; (The action can only succeed at a timeslot free for Adam, Jerry, and Matthew;
  ;; given the initial facts, the solver will therefore schedule at the feasible slot.)
  (:goal (meeting-scheduled))
)