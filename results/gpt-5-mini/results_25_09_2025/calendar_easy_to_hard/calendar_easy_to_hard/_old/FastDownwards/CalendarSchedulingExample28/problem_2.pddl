(define (problem schedule-meeting-5people)
  (:domain meeting-scheduling)
  (:objects
    jesse nancy isabella harold linda - person
    meet1 - meeting
    slot-0900 slot-0930 slot-1000 slot-1030
    slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )
  (:init
    (work-slot slot-0900) (work-slot slot-0930) (work-slot slot-1000) (work-slot slot-1030)
    (work-slot slot-1100) (work-slot slot-1130) (work-slot slot-1200) (work-slot slot-1230)
    (work-slot slot-1300) (work-slot slot-1330) (work-slot slot-1400) (work-slot slot-1430)
    (work-slot slot-1500) (work-slot slot-1530) (work-slot slot-1600) (work-slot slot-1630)

    ;; Jesse busy 10:00 (slot-1000) and 15:00 (slot-1500) -> available at all other work slots
    (available jesse slot-0900) (available jesse slot-0930) (available jesse slot-1030)
    (available jesse slot-1100) (available jesse slot-1130) (available jesse slot-1200)
    (available jesse slot-1230) (available jesse slot-1300) (available jesse slot-1330)
    (available jesse slot-1400) (available jesse slot-1430) (available jesse slot-1530)
    (available jesse slot-1600) (available jesse slot-1630)

    ;; Nancy busy 09:00 (slot-0900), 10:30 (slot-1030), 13:30 (slot-1330), 14:30 (slot-1430)
    (available nancy slot-0930) (available nancy slot-1000) (available nancy slot-1100)
    (available nancy slot-1130) (available nancy slot-1200) (available nancy slot-1230)
    (available nancy slot-1300) (available nancy slot-1400) (available nancy slot-1500)
    (available nancy slot-1530) (available nancy slot-1600) (available nancy slot-1630)

    ;; Isabella busy 09:00-10:00 (slot-0900, slot-0930), 11:30 (slot-1130), 15:30 (slot-1530)
    (available isabella slot-1000) (available isabella slot-1030) (available isabella slot-1100)
    (available isabella slot-1200) (available isabella slot-1230) (available isabella slot-1300)
    (available isabella slot-1330) (available isabella slot-1400) (available isabella slot-1430)
    (available isabella slot-1500) (available isabella slot-1600) (available isabella slot-1630)

    ;; Harold busy 09:00-10:00 (slot-0900, slot-0930) and 10:30-16:30 (slot-1030..slot-1600) -> only slot-1000 and slot-1630 free
    (available harold slot-1000) (available harold slot-1630)

    ;; Linda busy 09:00-10:00 (slot-0900, slot-0930), 12:00 (slot-1200), 13:30-16:00 (slot-1330, slot-1400, slot-1430, slot-1500, slot-1530)
    (available linda slot-1000) (available linda slot-1030) (available linda slot-1100)
    (available linda slot-1130) (available linda slot-1230) (available linda slot-1300)
    (available linda slot-1600) (available linda slot-1630)
  )

  (:goal (and (scheduled-at meet1 slot-1630)))
)