(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    stephen elijah william jeremy timothy - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    (free stephen t0900) (free stephen t0930) (free stephen t1000) (free stephen t1030)
    (free stephen t1100) (free stephen t1130) (free stephen t1200) (free stephen t1230)
    (free stephen t1300) (free stephen t1330) (free stephen t1400) (free stephen t1430)
    (free stephen t1500) (free stephen t1530) (free stephen t1600) (free stephen t1630)

    (free elijah t0930) (free elijah t1000) (free elijah t1030) (free elijah t1100)
    (free elijah t1130) (free elijah t1200) (free elijah t1300) (free elijah t1330)
    (free elijah t1400) (free elijah t1500) (free elijah t1530) (free elijah t1630)

    (free william t0900) (free william t1000) (free william t1030) (free william t1100)
    (free william t1130) (free william t1200) (free william t1230) (free william t1300)
    (free william t1330) (free william t1400) (free william t1430) (free william t1500)
    (free william t1600) (free william t1630)

    (free jeremy t0930) (free jeremy t1200) (free jeremy t1230) (free jeremy t1500)

    (free timothy t0900) (free timothy t0930) (free timothy t1030) (free timothy t1100)
    (free timothy t1430) (free timothy t1500) (free timothy t1600) (free timothy t1630)

    (slot-free t1500)
    (earliest-slot t1500)
  )
  (:goal (meeting-scheduled))
)