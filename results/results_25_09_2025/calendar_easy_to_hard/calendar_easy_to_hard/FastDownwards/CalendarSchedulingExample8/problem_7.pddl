(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
    monday - day
  )
  (:init
    (= (total-cost) 0)
    (meeting-duration-30)

    (within-work-hours s09_00) (within-work-hours s09_30) (within-work-hours s10_00) (within-work-hours s10_30)
    (within-work-hours s11_00) (within-work-hours s11_30) (within-work-hours s12_00) (within-work-hours s12_30)
    (within-work-hours s13_00) (within-work-hours s13_30) (within-work-hours s14_00) (within-work-hours s14_30)
    (within-work-hours s15_00) (within-work-hours s15_30) (within-work-hours s16_00) (within-work-hours s16_30)

    (free adam s09_00) (free adam s09_30) (free adam s10_30)
    (free adam s11_00) (free adam s11_30) (free adam s12_00)
    (free adam s13_00)
    (free adam s14_30) (free adam s15_00) (free adam s15_30)
    (free adam s16_00) (free adam s16_30)

    (free jerry s09_30) (free jerry s10_00) (free jerry s10_30)
    (free jerry s11_00) (free jerry s11_30) (free jerry s12_30)
    (free jerry s13_00) (free jerry s13_30) (free jerry s14_00)
    (free jerry s14_30) (free jerry s16_00) (free jerry s16_30)

    (free matthew s09_00) (free matthew s11_00) (free matthew s12_30) (free matthew s14_00)
  )
  (:goal (or (scheduled s09_00) (scheduled s09_30) (scheduled s10_00) (scheduled s10_30)
             (scheduled s11_00) (scheduled s11_30) (scheduled s12_00) (scheduled s12_30)
             (scheduled s13_00) (scheduled s13_30) (scheduled s14_00) (scheduled s14_30)
             (scheduled s15_00) (scheduled s15_30) (scheduled s16_00) (scheduled s16_30)))
  (:metric minimize (total-cost))
)