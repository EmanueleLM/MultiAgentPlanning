(define (problem meeting-monday)
  (:domain schedule-meeting)
  (:objects
    michael samuel aaron judith kevin - person
    orchestrator - orchestrator-type
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    (orchestrator orchestrator)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; michael free (busy 10:30-11:00, 14:30-15:00)
    (free michael t0900) (free michael t0930) (free michael t1000)
    (free michael t1100) (free michael t1130) (free michael t1200)
    (free michael t1230) (free michael t1300) (free michael t1330)
    (free michael t1400) (free michael t1500) (free michael t1530)
    (free michael t1600) (free michael t1630)

    ;; samuel free (busy 10:30-11:00, 12:30-13:00, 13:30-14:30, 15:30-16:00, 16:30-17:00)
    (free samuel t0900) (free samuel t0930) (free samuel t1000)
    (free samuel t1100) (free samuel t1130) (free samuel t1200)
    (free samuel t1300) (free samuel t1430) (free samuel t1500)
    (free samuel t1600)

    ;; aaron free (busy 11:00-11:30, 12:30-13:00, 13:30-14:00, 15:00-15:30, 16:00-17:00)
    (free aaron t0900) (free aaron t0930) (free aaron t1000) (free aaron t1030)
    (free aaron t1130) (free aaron t1200) (free aaron t1300)
    (free aaron t1400) (free aaron t1430) (free aaron t1530)

    ;; judith free (busy 09:00-09:30, 10:30-11:30, 12:00-12:30, 14:00-15:00, 15:30-16:00, 16:30-17:00)
    (free judith t0930) (free judith t1000) (free judith t1130)
    (free judith t1230) (free judith t1300) (free judith t1330)
    (free judith t1500) (free judith t1600)

    ;; kevin free (busy 09:00-11:00, 11:30-13:00, 13:30-14:00, 14:30-15:00, 15:30-16:00)
    (free kevin t1100) (free kevin t1300) (free kevin t1400)
    (free kevin t1500) (free kevin t1600) (free kevin t1630)
  )
  (:goal (meeting-scheduled))
)