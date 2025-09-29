(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    stephen elijah william jeremy timothy - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    ;; work slots (valid 30-minute start times between 09:00 and 17:00)
    (work-slot t0900) (work-slot t0930) (work-slot t1000) (work-slot t1030)
    (work-slot t1100) (work-slot t1130) (work-slot t1200) (work-slot t1230)
    (work-slot t1300) (work-slot t1330) (work-slot t1400) (work-slot t1430)
    (work-slot t1500) (work-slot t1530) (work-slot t1600) (work-slot t1630)

    ;; Stephen: free entire day
    (free stephen t0900) (free stephen t0930) (free stephen t1000) (free stephen t1030)
    (free stephen t1100) (free stephen t1130) (free stephen t1200) (free stephen t1230)
    (free stephen t1300) (free stephen t1330) (free stephen t1400) (free stephen t1430)
    (free stephen t1500) (free stephen t1530) (free stephen t1600) (free stephen t1630)

    ;; Elijah busy 09:00-09:30, 12:30-13:00, 14:30-15:00, 16:00-16:30 => free others
    (free elijah t0930) (free elijah t1000) (free elijah t1030) (free elijah t1100)
    (free elijah t1130) (free elijah t1200) (free elijah t1300) (free elijah t1330)
    (free elijah t1400) (free elijah t1500) (free elijah t1530) (free elijah t1630)

    ;; William busy 09:30-10:00, 15:30-16:00
    (free william t0900) (free william t1000) (free william t1030) (free william t1100)
    (free william t1130) (free william t1200) (free william t1230) (free william t1300)
    (free william t1330) (free william t1400) (free william t1430) (free william t1500)
    (free william t1600) (free william t1630)

    ;; Jeremy busy 09:00-09:30, 10:00-12:00, 13:00-15:00, 15:30-17:00
    (free jeremy t0930) (free jeremy t1200) (free jeremy t1230) (free jeremy t1500)

    ;; Timothy busy 10:00-10:30, 11:30-14:30, 15:30-16:00
    (free timothy t0900) (free timothy t0930) (free timothy t1030) (free timothy t1100)
    (free timothy t1430) (free timothy t1500) (free timothy t1600) (free timothy t1630)
  )
  (:goal (meeting-scheduled))
)