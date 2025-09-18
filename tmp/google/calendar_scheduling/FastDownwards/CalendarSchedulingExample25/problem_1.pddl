(define (problem orchestrate-meeting)
  (:domain orchestrated-meeting)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30
  )

  (:init
    (person anthony) (person pamela) (person zachary)
    (slot s09_00) (slot s09_30) (slot s10_00) (slot s10_30)
    (slot s11_00) (slot s11_30) (slot s12_00) (slot s12_30)
    (slot s13_00) (slot s13_30) (slot s14_00) (slot s14_30)
    (slot s15_00) (slot s15_30) (slot s16_00) (slot s16_30)
    (next s09_00 s09_30) (next s09_30 s10_00) (next s10_00 s10_30) (next s10_30 s11_00)
    (next s11_00 s11_30) (next s11_30 s12_00) (next s12_00 s12_30) (next s12_30 s13_00)
    (next s13_00 s13_30) (next s13_30 s14_00) (next s14_00 s14_30) (next s14_30 s15_00)
    (next s15_00 s15_30) (next s15_30 s16_00) (next s16_00 s16_30)
    (free anthony s09_00)
    (free anthony s10_00) (free anthony s10_30)
    (free anthony s11_00) (free anthony s11_30)
    (free anthony s13_00) (free anthony s13_30)
    (free anthony s14_00) (free anthony s14_30)
    (free anthony s15_00) (free anthony s15_30)
    (free anthony s16_30)
    (free pamela s10_00) (free pamela s10_30)
    (free pamela s11_00) (free pamela s11_30)
    (free pamela s12_00) (free pamela s12_30)
    (free pamela s13_00) (free pamela s13_30)
    (free zachary s11_30) (free zachary s12_30) (free zachary s13_30)
    (free zachary s14_00) (free zachary s15_00) (free zachary s15_30)
  )

  (:goal (and
    (meeting-scheduled)
    (meeting-with anthony)
    (meeting-with pamela)
    (meeting-with zachary)
  ))
)