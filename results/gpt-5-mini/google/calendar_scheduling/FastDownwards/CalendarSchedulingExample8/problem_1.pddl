(define (problem schedule-monday)
  (:domain orchestrator)
  (:objects
    adam jerry matthew - participant
    meeting1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    (free adam s1) (free adam s2)
    (free adam s4) (free adam s5) (free adam s6) (free adam s7)
    (free adam s9)
    (free adam s12) (free adam s13) (free adam s14) (free adam s15) (free adam s16)
    (free jerry s2) (free jerry s3) (free jerry s4) (free jerry s5) (free jerry s6)
    (free jerry s8) (free jerry s9) (free jerry s10) (free jerry s11) (free jerry s12)
    (free jerry s15) (free jerry s16)
    (free matthew s1)
    (free matthew s5)
    (free matthew s8)
    (free matthew s11)
  )
  (:goal
    (and
      (meeting-scheduled meeting1)
      (meeting-at meeting1 s5)
      (occupied adam s5)
      (occupied jerry s5)
      (occupied matthew s5)
      (assigned-first adam)
      (assigned-second jerry)
      (assigned-third matthew)
    )
  )
)