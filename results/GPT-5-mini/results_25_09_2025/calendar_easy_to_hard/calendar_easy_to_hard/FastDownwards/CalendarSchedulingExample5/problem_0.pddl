(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    kathryn charlotte lauren - agent
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
  )

  (:init
    ;; Entities
    (agent kathryn) (agent charlotte) (agent lauren)
    (slot t1) (slot t2) (slot t3) (slot t4) (slot t5) (slot t6) (slot t7) (slot t8)
    (slot t9) (slot t10) (slot t11) (slot t12) (slot t13) (slot t14) (slot t15) (slot t16)

    ;; Availability encoded from agents' private schedules and Charlotte's preference
    ;; Time slots (30-minute) mapping:
    ;; t1: 09:00-09:30, t2: 09:30-10:00, t3: 10:00-10:30, t4: 10:30-11:00,
    ;; t5: 11:00-11:30, t6: 11:30-12:00, t7: 12:00-12:30, t8: 12:30-13:00,
    ;; t9: 13:00-13:30, t10: 13:30-14:00, t11: 14:00-14:30, t12: 14:30-15:00,
    ;; t13: 15:00-15:30, t14: 15:30-16:00, t15: 16:00-16:30, t16: 16:30-17:00

    ;; Kathryn's availability (blocked: t1, t4, t6, t10, t11, t16)
    (available kathryn t2) (available kathryn t3) (available kathryn t5)
    (available kathryn t7) (available kathryn t8) (available kathryn t9)
    (available kathryn t12) (available kathryn t13) (available kathryn t14)
    (available kathryn t15)

    ;; Charlotte's availability and preference (blocked: t7, t15; preference: do not meet after 13:30 -> meeting must end by 13:30)
    ;; We enforce the preference by not marking Charlotte available for any slot starting after 13:00 (i.e., no availability for t10..t16)
    (available charlotte t1) (available charlotte t2) (available charlotte t3)
    (available charlotte t4) (available charlotte t5) (available charlotte t6)
    (available charlotte t8) (available charlotte t9)

    ;; Lauren's availability (blocked: t1,t2, t7, t10,t11, t13,t14, t16)
    (available lauren t3) (available lauren t4) (available lauren t5)
    (available lauren t6) (available lauren t8) (available lauren t9)
    (available lauren t12) (available lauren t15)
  )

  ;; Goal: a single 30-minute meeting scheduled where all participants have agreed
  (:goal (meeting-scheduled))
)