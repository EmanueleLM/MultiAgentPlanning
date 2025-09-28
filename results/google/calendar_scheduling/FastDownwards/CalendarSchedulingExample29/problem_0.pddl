(define (problem meeting-monday)
  (:domain schedule-meeting)

  (:objects
    michael samuel aaron judith kevin
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630
  )

  (:init
    ;; available slots in the environment (30-minute starts between 09:00 and 16:30)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030)
    (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; michael's free start slots (busy: 10:30-11:00 -> t1030 blocked; 14:30-15:00 -> t1430 blocked)
    (free michael t0900) (free michael t0930) (free michael t1000)
    (free michael t1100) (free michael t1130) (free michael t1200)
    (free michael t1230) (free michael t1300) (free michael t1330)
    (free michael t1400) (free michael t1500) (free michael t1530)
    (free michael t1600) (free michael t1630)

    ;; samuel's free start slots (busy: 10:30-11:00 -> t1030; 12:30-13:00 -> t1230;
    ;; 13:30-14:30 -> t1330 and t1400; 15:30-16:00 -> t1530; 16:30-17:00 -> t1630)
    (free samuel t0900) (free samuel t0930) (free samuel t1000)
    (free samuel t1100) (free samuel t1130) (free samuel t1200)
    (free samuel t1300) (free samuel t1430) (free samuel t1500) (free samuel t1600)

    ;; aaron's free start slots (busy: 11:00-11:30 -> t1100; 12:30-13:00 -> t1230;
    ;; 13:30-14:00 -> t1330; 15:00-15:30 -> t1500; 16:00-17:00 -> t1600 and t1630)
    (free aaron t0900) (free aaron t0930) (free aaron t1000) (free aaron t1030)
    (free aaron t1130) (free aaron t1200) (free aaron t1300)
    (free aaron t1400) (free aaron t1430) (free aaron t1530)

    ;; judith's free start slots (busy: 09:00-09:30 -> t0900; 10:30-11:30 -> t1030 and t1100;
    ;; 12:00-12:30 -> t1200; 14:00-15:00 -> t1400 and t1430; 15:30-16:00 -> t1530; 16:30-17:00 -> t1630)
    (free judith t0930) (free judith t1000)
    (free judith t1130) (free judith t1230)
    (free judith t1300) (free judith t1330)
    (free judith t1500) (free judith t1600)

    ;; kevin's free start slots (busy: 09:00-11:00 -> t0900,t0930,t1000,t1030;
    ;; 11:30-13:00 -> t1130,t1200,t1230; 13:30-14:00 -> t1330; 14:30-15:00 -> t1430;
    ;; 15:30-16:00 -> t1530)
    (free kevin t1100) (free kevin t1300)
    (free kevin t1400) (free kevin t1500)
    (free kevin t1600) (free kevin t1630)
  )

  ;; Goal: a meeting start time is scheduled that satisfies all agents' hard constraints.
  (:goal (meeting-scheduled))
)