(define (problem integrated-schedule-monday)
  (:domain integrated-meeting-scheduling)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    (work-slot s09_00) (work-slot s09_30) (work-slot s10_00) (work-slot s10_30)
    (work-slot s11_00) (work-slot s11_30) (work-slot s12_00) (work-slot s12_30)
    (work-slot s13_00) (work-slot s13_30) (work-slot s14_00) (work-slot s14_30)
    (work-slot s15_00) (work-slot s15_30) (work-slot s16_00) (work-slot s16_30)

    (is-orchestrator orchestrator)

    (available alan s09_30) (available alan s10_30) (available alan s12_30)
    (available alan s13_00) (available alan s13_30) (available alan s14_30)
    (available alan s15_00) (available alan s15_30) (available alan s16_00) (available alan s16_30)

    (available michael s09_00) (available michael s09_30) (available michael s10_00) (available michael s10_30)
    (available michael s11_00) (available michael s11_30) (available michael s12_00) (available michael s12_30)
    (available michael s13_00) (available michael s13_30) (available michael s14_00) (available michael s14_30)
    (available michael s15_00) (available michael s15_30) (available michael s16_00) (available michael s16_30)

    (available michelle s09_00) (available michelle s09_30) (available michelle s10_00) (available michelle s10_30)
    (available michelle s11_00) (available michelle s11_30) (available michelle s12_00) (available michelle s12_30)
    (available michelle s13_00) (available michelle s13_30) (available michelle s14_00) (available michelle s14_30)
    (available michelle s15_00) (available michelle s15_30) (available michelle s16_00) (available michelle s16_30)

    (available roy s09_00) (available roy s10_00) (available roy s10_30)
    (available roy s11_00) (available roy s11_30) (available roy s12_00)
    (available roy s13_00) (available roy s14_30) (available roy s15_00) (available roy s15_30)
    (available roy s16_00) (available roy s16_30)

    (available judy s10_30) (available judy s15_30)

    (available natalie s09_30) (available natalie s10_00) (available natalie s10_30) (available natalie s12_30)

    (available brian s09_00) (available brian s10_30)
    (available brian s11_30) (available brian s12_00) (available brian s12_30)
    (available brian s13_00) (available brian s14_00) (available brian s15_00)
    (available brian s16_00)
  )
  (:goal (meeting-scheduled))
)