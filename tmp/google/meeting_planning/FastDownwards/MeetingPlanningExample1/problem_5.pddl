(define (problem meet-betty-compiled-problem)
  (:domain meet-betty-compiled)
  (:objects
    t540 t562 t1035 t1095 t1245 t1305 - timepoint
  )
  (:init
    (at-you richmond)
    (now t540)
    (in-window t1035)
    (in-window t1245)
    (can-travel-rd-fd t540 t562)
    (can-wait t562 t1035)
    (can-wait t1035 t1245)
    (can-meet-start t1035 t1095)
    (can-meet-start t1245 t1305)
  )
  (:goal (met))
)