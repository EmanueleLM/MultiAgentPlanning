(define (problem orchestrator-problem)
  (:domain schedule-meeting-domain)

  (:objects
    stephen edward angela orchestrator - agent

    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    (succ s09_00 s09_30) (succ s09_30 s10_00) (succ s10_00 s10_30) (succ s10_30 s11_00)
    (succ s11_00 s11_30) (succ s11_30 s12_00) (succ s12_00 s12_30) (succ s12_30 s13_00)
    (succ s13_00 s13_30) (succ s13_30 s14_00) (succ s14_00 s14_30) (succ s14_30 s15_00)
    (succ s15_00 s15_30) (succ s15_30 s16_00) (succ s16_00 s16_30)

    (free stephen s09_00) (free stephen s09_30) (free stephen s10_30)
    (free stephen s11_00) (free stephen s11_30) (free stephen s12_00)
    (free stephen s12_30) (free stephen s13_30) (free stephen s14_00)
    (free stephen s15_00) (free stephen s15_30) (free stephen s16_30)

    (free edward s09_30) (free edward s10_30)
    (free edward s11_00) (free edward s11_30) (free edward s12_00) (free edward s12_30)
    (free edward s13_00) (free edward s14_30) (free edward s16_00) (free edward s16_30)

    (free angela s11_30) (free angela s12_00) (free angela s13_00) (free angela s15_30)
  )

  (:goal (meeting-scheduled s11_30))
)