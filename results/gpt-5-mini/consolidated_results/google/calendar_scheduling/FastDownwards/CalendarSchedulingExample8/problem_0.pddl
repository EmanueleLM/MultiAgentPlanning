(define (problem schedule-adam-jerry-matthew)
  (:domain meeting-scheduling)
  (:objects
     adam jerry matthew - participant
     s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - timeslot
  )
  ;; Timeslots represent Monday 09:00-17:00 in 30-minute increments:
  ;; s1=09:00-09:30, s2=09:30-10:00, s3=10:00-10:30, s4=10:30-11:00,
  ;; s5=11:00-11:30, s6=11:30-12:00, s7=12:00-12:30, s8=12:30-13:00,
  ;; s9=13:00-13:30, s10=13:30-14:00, s11=14:00-14:30, s12=14:30-15:00,
  ;; s13=15:00-15:30, s14=15:30-16:00, s15=16:00-16:30, s16=16:30-17:00

  (:init
    ;; Adam's audited availability: busy 10:00-11:00 (s3,s4), free otherwise
    (occupied adam s3) (occupied adam s4)
    (free adam s1) (free adam s2) (free adam s5) (free adam s6) (free adam s7) (free adam s8)
    (free adam s9) (free adam s10) (free adam s11) (free adam s12) (free adam s13) (free adam s14) (free adam s15) (free adam s16)

    ;; Jerry's audited availability: busy 13:00-14:30 (s9,s10,s11), free otherwise
    (occupied jerry s9) (occupied jerry s10) (occupied jerry s11)
    (free jerry s1) (free jerry s2) (free jerry s3) (free jerry s4) (free jerry s5) (free jerry s6) (free jerry s7) (free jerry s8)
    (free jerry s12) (free jerry s13) (free jerry s14) (free jerry s15) (free jerry s16)

    ;; Matthew's audited availability: busy 09:30-10:00 (s2) and 15:00-15:30 (s13), free otherwise
    (occupied matthew s2) (occupied matthew s13)
    (free matthew s1) (free matthew s3) (free matthew s4) (free matthew s5) (free matthew s6) (free matthew s7) (free matthew s8)
    (free matthew s9) (free matthew s10) (free matthew s11) (free matthew s12) (free matthew s14) (free matthew s15) (free matthew s16)
  )

  ;; Goal: a single meeting is scheduled at a timeslot that is (by construction)
  ;; free for Adam, Jerry, and Matthew. We require scheduling at s6 (11:30-12:00),
  ;; which is free for all three in the initial state.
  (:goal (scheduled s6))
)