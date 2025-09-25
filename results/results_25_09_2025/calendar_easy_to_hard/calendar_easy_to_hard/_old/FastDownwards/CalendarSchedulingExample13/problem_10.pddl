(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    diane jack eugene patricia - person
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )
  (:init
    (free diane s09_00) (free diane s10_00) (free diane s10_30) (free diane s11_00) (free diane s11_30) (free diane s12_00) (free diane s12_30) (free diane s13_00) (free diane s13_30) (free diane s14_00) (free diane s15_00) (free diane s15_30) (free diane s16_00) (free diane s16_30)
    (free jack s09_00) (free jack s09_30) (free jack s10_00) (free jack s10_30) (free jack s11_00) (free jack s11_30) (free jack s12_00) (free jack s12_30) (free jack s13_00) (free jack s14_00) (free jack s15_00) (free jack s15_30) (free jack s16_00) (free jack s16_30)
    (free eugene s10_00) (free eugene s11_30) (free eugene s14_30) (free eugene s16_30)
    (free patricia s09_00) (free patricia s10_30) (free patricia s11_30) (free patricia s12_00) (free patricia s14_00) (free patricia s14_30) (free patricia s16_30)
  )
  (:goal (and
    (meeting-scheduled)
    (meeting-with diane)
    (meeting-with jack)
    (meeting-with eugene)
    (meeting-with patricia)
  ))
)