(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    anthony pamela zachary - participant
    seg_1330_1400 seg_1400_1430 - segment
    s_1330_1430 - slot
  )
  (:init
    ;; Slot composition: two contiguous 30-minute segments covering the 60-minute slot
    (covers s_1330_1430 seg_1330_1400)
    (covers s_1330_1430 seg_1400_1430)
    (next seg_1330_1400 seg_1400_1430)

    ;; Availabilities derived from input schedules: all participants free on both segments
    (available anthony seg_1330_1400)
    (available anthony seg_1400_1430)

    (available pamela seg_1330_1400)
    (available pamela seg_1400_1430)

    (available zachary seg_1330_1400)
    (available zachary seg_1400_1430)
  )
  (:goal (scheduled))
)