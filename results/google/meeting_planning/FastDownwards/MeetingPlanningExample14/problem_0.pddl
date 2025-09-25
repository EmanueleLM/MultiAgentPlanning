(define (problem meet-mary-120min)
  (:domain meeting-scheduling)
  (:objects
    visitor mary - agent
    Nob_Hill Marina_District - location
  )

  (:init
    ;; Locations
    (at visitor Nob_Hill)
    (at mary Marina_District)    ;; Mary will be at Marina_District during her available window

    ;; Time in minutes from midnight:
    ;; Visitor arrives at Nob_Hill at 09:00 -> 9*60 = 540
    (= (time) 540)

    ;; Mary's availability: 20:00 (1200) to 22:00 (1320)
    (= (mary-from) 1200)
    (= (mary-to) 1320)
  )

  (:goal (met))
)