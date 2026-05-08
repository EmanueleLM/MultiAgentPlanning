(define (problem schedule-monday)
  (:domain orchestrator)

  (:objects
    adam jerry matthew - participant
    meeting1 - meeting
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )

  (:init
    ;; participants and slots
    (participant adam) (participant jerry) (participant matthew)

    (slot s1) (slot s2) (slot s3) (slot s4) (slot s5) (slot s6) (slot s7) (slot s8)
    (slot s9) (slot s10) (slot s11) (slot s12) (slot s13) (slot s14) (slot s15) (slot s16)

    ;; meeting object
    (meeting meeting1)

    ;; Audited availability mapped to 30-minute slots (09:00-17:00 -> s1..s16)
    ;; Slot mapping:
    ;; s1=09:00-09:30, s2=09:30-10:00, s3=10:00-10:30, s4=10:30-11:00,
    ;; s5=11:00-11:30, s6=11:30-12:00, s7=12:00-12:30, s8=12:30-13:00,
    ;; s9=13:00-13:30, s10=13:30-14:00, s11=14:00-14:30, s12=14:30-15:00,
    ;; s13=15:00-15:30, s14=15:30-16:00, s15=16:00-16:30, s16=16:30-17:00

    ;; Adam's audited availability:
    (free adam s1) (free adam s2)
    (free adam s4) (free adam s5) (free adam s6) (free adam s7)
    (free adam s9)
    (free adam s12) (free adam s13) (free adam s14) (free adam s15) (free adam s16)

    ;; Jerry's audited availability:
    (free jerry s2) (free jerry s3) (free jerry s4) (free jerry s5) (free jerry s6)
    (free jerry s8) (free jerry s9) (free jerry s10) (free jerry s11) (free jerry s12)
    (free jerry s15) (free jerry s16)

    ;; Matthew's audited availability:
    (free matthew s1)
    (free matthew s5)
    (free matthew s8)
    (free matthew s11)
  )

  (:goal
    (and
      ;; The meeting must be scheduled and fixed to the only mutually available 30-minute slot
      (meeting-scheduled meeting1)
      (meeting-at meeting1 s5)

      ;; Participant occupancy for that scheduled slot (enforced final condition)
      (occupied adam s5)
      (occupied jerry s5)
      (occupied matthew s5)

      ;; Enforce the explicit assignment order assumption
      (assigned-first adam)
      (assigned-second jerry)
      (assigned-third matthew)
    )
  )
)