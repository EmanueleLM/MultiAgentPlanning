(define (problem multiagent-meeting-problem)
  (:domain multiagent-meeting)
  (:objects
    nob-hill sunset-district - location
  )
  (:init
    ;; Both agents arrive at Nob Hill at 09:00 = 540 minutes after midnight
    (at-vis nob-hill)
    (at-other nob-hill)

    (= (time) 540)

    ;; travel times (public information)
    (= (travel-nh-sd) 25)   ;; Nob Hill -> Sunset District: 25 minutes
    (= (travel-sd-nh) 27)   ;; Sunset District -> Nob Hill: 27 minutes

    ;; Carol's availability window in the Sunset District: 14:00 (840) to 20:30 (1230)
    (= (carol-available-start) 840)
    (= (carol-available-end) 1230)
  )

  ;; Goal: achieve a meeting of at least 75 minutes with Carol (represented by met-carol)
  (:goal (met-carol))

  ;; Encourage earlier schedules by minimizing the finishing time
  (:metric minimize (time))
)