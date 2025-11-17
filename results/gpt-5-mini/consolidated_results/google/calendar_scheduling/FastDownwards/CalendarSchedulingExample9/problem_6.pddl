(define (problem schedule-meeting-monday)
  (:domain schedule-meeting)

  (:objects
    diane kelly deborah - participant

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (participant diane) (participant kelly) (participant deborah)

    (work_slot s0900) (work_slot s0930) (work_slot s1000) (work_slot s1030)
    (work_slot s1100) (work_slot s1130) (work_slot s1200) (work_slot s1230)
    (work_slot s1300) (work_slot s1330) (work_slot s1400) (work_slot s1430)
    (work_slot s1500) (work_slot s1530) (work_slot s1600) (work_slot s1630)

    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Free slots for Diane (busy at s0900, s1200, s1430, s1500)
    (free diane s0930) (free diane s1000) (free diane s1030)
    (free diane s1100) (free diane s1130) (free diane s1230)
    (free diane s1300) (free diane s1330) (free diane s1400)
    (free diane s1530) (free diane s1600) (free diane s1630)

    ;; Free slots for Kelly (busy at s0930, s1030)
    (free kelly s0900) (free kelly s1000) (free kelly s1100)
    (free kelly s1130) (free kelly s1200) (free kelly s1230)
    (free kelly s1300) (free kelly s1330) (free kelly s1400)
    (free kelly s1430) (free kelly s1500) (free kelly s1530)
    (free kelly s1600) (free kelly s1630)

    ;; Free slots for Deborah (busy at s0900, s1000..s1330, and s1430..s1630)
    (free deborah s0930) (free deborah s1400)
  )

  (:goal (scheduled))
)