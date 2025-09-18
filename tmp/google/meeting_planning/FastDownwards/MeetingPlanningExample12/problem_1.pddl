(define (problem integrated-meet-barbara-problem)
  (:domain integrated-meeting-domain)

  (:objects
    barbara - person
    north-beach alamo-square - location

    t540 t556 t571 t1080 t1096 t1170 t1186 t1290 - timepoint
  )

  (:init
    ;; initial locations
    (at-visitor north-beach)
    (at-agent north-beach)
    (at-person barbara alamo-square)

    ;; initial timepoint
    (at-time t540)

    ;; time arithmetic/precomputed relations
    ;; 16-minute forward steps
    (next16 t540 t556)
    (next16 t1080 t1096)

    ;; 15-minute forward steps
    (next15 t556 t571)
    (next15 t1096 t1111)

    ;; 90-minute additions
    (plus90 t1080 t1170)
    (plus90 t1096 t1186)

    ;; ordering/predicates for windows
    (before1080 t540)
    (before1080 t556)
    (before1080 t571)

    (in-start-window t1080)
    (in-start-window t1096)

    ;; initial cost
    (= (total-cost) 0)
  )

  (:goal (met barbara))

  (:metric minimize (total-cost))
)