(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    diane jack eugene patricia - participant
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - slot
  )
  (:init
    (agent diane) (agent jack) (agent eugene) (agent patricia)

    (free diane s1) (free diane s3) (free diane s4) (free diane s5)
    (free diane s6) (free diane s7) (free diane s8) (free diane s9)
    (free diane s10) (free diane s11) (free diane s13) (free diane s14)
    (free diane s15) (free diane s16)

    (free jack s1) (free jack s2) (free jack s3) (free jack s4)
    (free jack s5) (free jack s6) (free jack s7) (free jack s8)
    (free jack s9) (free jack s11) (free jack s13) (free jack s14)
    (free jack s15) (free jack s16)

    (free eugene s3) (free eugene s6) (free eugene s12) (free eugene s16)

    (free patricia s1) (free patricia s4) (free patricia s7)
    (free patricia s11) (free patricia s12) (free patricia s16)
  )

  (:goal (scheduled s16))
)