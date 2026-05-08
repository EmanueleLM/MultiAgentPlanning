(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    anthony pamela zachary - participant
    seg_1330_1400 seg_1400_1430 - segment
    s_1330_1430 - slot
  )
  (:init
    ;; slot covers two contiguous 30-min segments (13:30-14:00, 14:00-14:30)
    (covers s_1330_1430 seg_1330_1400)
    (covers s_1330_1430 seg_1400_1430)
    (next seg_1330_1400 seg_1400_1430)

    ;; availability for anthony
    (available anthony seg_1330_1400)
    (available anthony seg_1400_1430)

    ;; availability for pamela
    (available pamela seg_1330_1400)
    (available pamela seg_1400_1430)

    ;; availability for zachary
    (available zachary seg_1330_1400)
    (available zachary seg_1400_1430)
  )
  (:goal (scheduled))
)