(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)

  (:objects
    stephen elijah william jeremy timothy - agent

    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    (participant stephen)
    (participant elijah)
    (participant william)
    (participant jeremy)
    (participant timothy)

    (free stephen s09_00) (free stephen s09_30) (free stephen s10_00) (free stephen s10_30)
    (free stephen s11_00) (free stephen s11_30) (free stephen s12_00) (free stephen s12_30)
    (free stephen s13_00) (free stephen s13_30) (free stephen s14_00) (free stephen s14_30)
    (free stephen s15_00) (free stephen s15_30) (free stephen s16_00) (free stephen s16_30)

    (free elijah s09_30) (free elijah s10_00) (free elijah s10_30) (free elijah s11_00)
    (free elijah s11_30) (free elijah s12_00) (free elijah s13_00) (free elijah s13_30)
    (free elijah s14_00) (free elijah s15_00) (free elijah s15_30) (free elijah s16_30)

    (free william s09_00) (free william s10_00) (free william s10_30) (free william s11_00)
    (free william s11_30) (free william s12_00) (free william s12_30) (free william s13_00)
    (free william s13_30) (free william s14_00) (free william s14_30) (free william s15_00)
    (free william s16_00) (free william s16_30)

    (free jeremy s09_30) (free jeremy s12_00) (free jeremy s12_30) (free jeremy s15_00)

    (free timothy s09_00) (free timothy s09_30) (free timothy s10_30) (free timothy s11_00)
    (free timothy s15_00) (free timothy s16_00) (free timothy s16_30)
  )

  (:goal (meeting-scheduled))
)