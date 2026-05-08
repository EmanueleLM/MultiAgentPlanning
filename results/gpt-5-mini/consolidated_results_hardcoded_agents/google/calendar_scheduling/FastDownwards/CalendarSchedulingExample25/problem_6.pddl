(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    anthony pamela zachary - participant
    seg_1330_1400 seg_1400_1430 - segment
    s_1330_1430 - slot
  )
  (:init
    ;; slot covers two contiguous 30-minute segments (13:30-14:00, 14:00-14:30)
    (covers s_1330_1430 seg_1330_1400)
    (covers s_1330_1430 seg_1400_1430)
    (next seg_1330_1400 seg_1400_1430)

    ;; availability for Anthony (free both segments)
    (available anthony seg_1330_1400)
    (available anthony seg_1400_1430)

    ;; availability for Pamela (preference: no meetings after 14:30; this slot ends at 14:30)
    (available pamela seg_1330_1400)
    (available pamela seg_1400_1430)

    ;; availability for Zachary (free both segments)
    (available zachary seg_1330_1400)
    (available zachary seg_1400_1430)
  )
  (:goal (scheduled))
)