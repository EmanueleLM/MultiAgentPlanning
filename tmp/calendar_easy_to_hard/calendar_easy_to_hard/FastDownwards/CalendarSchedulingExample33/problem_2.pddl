(define (problem schedule-monday-all)
  (:domain integrated-meeting-scheduling)

  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot

    theresa alexander virginia lisa natalie victoria - person
  )

  (:init
    (free theresa s09_00)
    (free theresa s10_30) (free theresa s11_00) (free theresa s11_30)
    (free theresa s12_00) (free theresa s12_30) (free theresa s13_00) (free theresa s13_30)
    (free theresa s14_00) (free theresa s14_30)
    (free theresa s16_00) (free theresa s16_30)

    (free alexander s09_00) (free alexander s09_30)
    (free alexander s10_00) (free alexander s10_30)
    (free alexander s11_00) (free alexander s11_30)
    (free alexander s12_30) (free alexander s13_00)
    (free alexander s14_00) (free alexander s14_30)
    (free alexander s15_00) (free alexander s15_30)
    (free alexander s16_00) (free alexander s16_30)

    (free virginia s09_00) (free virginia s09_30) (free virginia s10_00) (free virginia s10_30)
    (free virginia s11_00) (free virginia s11_30) (free virginia s12_00) (free virginia s12_30)
    (free virginia s13_00) (free virginia s13_30) (free virginia s14_00) (free virginia s14_30)
    (free virginia s15_00) (free virginia s15_30) (free virginia s16_00) (free virginia s16_30)

    (free lisa s09_00) (free lisa s09_30) (free lisa s10_00)
    (free lisa s12_30) (free lisa s13_00) (free lisa s14_30)
    (free lisa s15_00) (free lisa s15_30)

    (free natalie s09_30) (free natalie s10_00) (free natalie s10_30)
    (free natalie s12_30) (free natalie s13_00) (free natalie s15_30)

    (free victoria s09_00) (free victoria s10_30)
    (free victoria s12_30) (free victoria s13_00) (free victoria s14_30) (free victoria s16_30)
  )

  (:goal (meeting-scheduled))
)