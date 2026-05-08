(define (problem schedule-kcl-monday)
  (:domain calendar-meeting)
  (:objects
    kathryn charlotte lauren - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    (allowed t1000) (allowed t1100) (allowed t1230) (allowed t1300)

    (free_kathryn t0930) (free_kathryn t1000) (free_kathryn t1100) (free_kathryn t1200)
    (free_kathryn t1230) (free_kathryn t1300) (free_kathryn t1430) (free_kathryn t1500)
    (free_kathryn t1530) (free_kathryn t1600)

    (free_charlotte t0900) (free_charlotte t0930) (free_charlotte t1000) (free_charlotte t1030)
    (free_charlotte t1100) (free_charlotte t1130) (free_charlotte t1230) (free_charlotte t1300)
    (free_charlotte t1330) (free_charlotte t1400) (free_charlotte t1430) (free_charlotte t1500)
    (free_charlotte t1530) (free_charlotte t1630)

    (free_lauren t1000) (free_lauren t1030) (free_lauren t1100) (free_lauren t1130)
    (free_lauren t1230) (free_lauren t1300) (free_lauren t1430) (free_lauren t1600)
  )
  (:goal (scheduled))
)