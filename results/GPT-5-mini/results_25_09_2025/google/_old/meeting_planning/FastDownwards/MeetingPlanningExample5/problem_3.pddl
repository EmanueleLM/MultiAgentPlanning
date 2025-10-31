(define (problem meeting-instance-example)
  (:domain meeting-orchestrator)

  (:objects
    a1 a2 - agent
    locA locB locM - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 - timepoint
  )

  (:init
    (at a1 locA)
    (at a2 locB)

    (current-time t0)

    (can-wait t0 t1) (can-wait t1 t2) (can-wait t2 t3) (can-wait t3 t4) (can-wait t4 t5)
    (can-wait t5 t6) (can-wait t6 t7) (can-wait t7 t8) (can-wait t8 t9) (can-wait t9 t10)

    (meeting-span t0 t2) (meeting-span t1 t3) (meeting-span t2 t4) (meeting-span t3 t5)
    (meeting-span t4 t6) (meeting-span t5 t7) (meeting-span t6 t8) (meeting-span t7 t9)
    (meeting-span t8 t10)

    (can-start a1 t0) (can-start a1 t1) (can-start a1 t2) (can-start a1 t3)
    (can-start a1 t4) (can-start a1 t5) (can-start a1 t6) (can-start a1 t7) (can-start a1 t8)
    (can-start a2 t3) (can-start a2 t4) (can-start a2 t5) (can-start a2 t6) (can-start a2 t7) (can-start a2 t8)

    (can-travel-d2 a1 locA locM t0 t2) (can-travel-d2 a1 locA locM t1 t3) (can-travel-d2 a1 locA locM t2 t4)
    (can-travel-d2 a1 locA locM t3 t5) (can-travel-d2 a1 locA locM t4 t6) (can-travel-d2 a1 locA locM t5 t7)
    (can-travel-d2 a1 locA locM t6 t8) (can-travel-d2 a1 locA locM t7 t9) (can-travel-d2 a1 locA locM t8 t10)
    (can-travel-d2 a1 locM locA t0 t2) (can-travel-d2 a1 locM locA t1 t3) (can-travel-d2 a1 locM locA t2 t4)
    (can-travel-d2 a1 locM locA t3 t5) (can-travel-d2 a1 locM locA t4 t6) (can-travel-d2 a1 locM locA t5 t7)
    (can-travel-d2 a1 locM locA t6 t8) (can-travel-d2 a1 locM locA t7 t9) (can-travel-d2 a1 locM locA t8 t10)

    (can-travel-d5 a1 locA locB t0 t5) (can-travel-d5 a1 locA locB t1 t6) (can-travel-d5 a1 locA locB t2 t7)
    (can-travel-d5 a1 locA locB t3 t8) (can-travel-d5 a1 locA locB t4 t9) (can-travel-d5 a1 locA locB t5 t10)

    (can-travel-d4 a2 locB locM t0 t4) (can-travel-d4 a2 locB locM t1 t5) (can-travel-d4 a2 locB locM t2 t6)
    (can-travel-d4 a2 locB locM t3 t7) (can-travel-d4 a2 locB locM t4 t8) (can-travel-d4 a2 locB locM t5 t9)
    (can-travel-d4 a2 locB locM t6 t10)
    (can-travel-d4 a2 locM locB t0 t4) (can-travel-d4 a2 locM locB t1 t5) (can-travel-d4 a2 locM locB t2 t6)
    (can-travel-d4 a2 locM locB t3 t7) (can-travel-d4 a2 locM locB t4 t8) (can-travel-d4 a2 locM locB t5 t9)
    (can-travel-d4 a2 locM locB t6 t10)

    (can-travel-d5 a2 locB locA t0 t5) (can-travel-d5 a2 locB locA t1 t6) (can-travel-d5 a2 locB locA t2 t7)
    (can-travel-d5 a2 locB locA t3 t8) (can-travel-d5 a2 locB locA t4 t9) (can-travel-d5 a2 locB locA t5 t10)
  )

  (:goal (meeting-done))
)