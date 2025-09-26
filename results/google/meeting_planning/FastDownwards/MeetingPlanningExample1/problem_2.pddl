(define (problem meet-betty-early-classical)
  (:domain sf-meeting)
  (:objects
    you betty - agent
    richmond financial - location
    t540 t562 t1035 t1095 t1155 t1215 t1275 t1305 - time
    dur60 dur120 dur180 dur240 dur270 - duration
  )

  (:init
    (= (total-cost) 0)

    (at you richmond t540)

    (at betty financial t1035)
    (at betty financial t1095)
    (at betty financial t1155)
    (at betty financial t1215)
    (at betty financial t1275)
    (at betty financial t1305)

    (can-travel richmond financial t540 t562)

    (can-wait t562 t1035)
    (can-wait t1035 t1095)
    (can-wait t1095 t1155)
    (can-wait t1155 t1215)
    (can-wait t1215 t1275)
    (can-wait t1275 t1305)

    (can-meet t1035 t1095 dur60)
    (can-meet t1035 t1155 dur120)
    (can-meet t1035 t1215 dur180)
    (can-meet t1035 t1275 dur240)
    (can-meet t1035 t1305 dur270)
  )

  (:goal (or (met dur60) (met dur120) (met dur180) (met dur240) (met dur270)))

  (:metric minimize (total-cost))
)