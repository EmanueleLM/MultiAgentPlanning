(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    kathryn charlotte lauren - agent
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
  )
  (:init
    (agent kathryn) (agent charlotte) (agent lauren)
    (slot t1) (slot t2) (slot t3) (slot t4) (slot t5) (slot t6) (slot t7) (slot t8)
    (slot t9) (slot t10) (slot t11) (slot t12) (slot t13) (slot t14) (slot t15) (slot t16)
    (available kathryn t2) (available kathryn t3) (available kathryn t5)
    (available kathryn t7) (available kathryn t8) (available kathryn t9)
    (available kathryn t12) (available kathryn t13) (available kathryn t14)
    (available kathryn t15)
    (available charlotte t1) (available charlotte t2) (available charlotte t3)
    (available charlotte t4) (available charlotte t5) (available charlotte t6)
    (available charlotte t8) (available charlotte t9)
    (available lauren t3) (available lauren t4) (available lauren t5)
    (available lauren t6) (available lauren t8) (available lauren t9)
    (available lauren t12) (available lauren t15)
  )
  (:goal (meeting-scheduled))
)