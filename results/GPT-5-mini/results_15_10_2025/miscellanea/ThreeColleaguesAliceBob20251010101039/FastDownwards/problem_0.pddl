(define (problem schedule-2025-10-21)
  (:domain meeting-scheduler)
  (:objects
    alice bob carol - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )

  (:init
    ;; current time initially 09:00 -> t0
    (current t0)

    ;; Availability encoded in 30-minute start increments for 2025-10-21 (09:00..16:30).
    ;; Alice: Available 09:00-11:00 and 13:00-16:00
    ;; Allowed 30-min start times: 09:00,09:30,10:00,10:30 and 13:00,13:30,14:00,14:30,15:00,15:30
    (free alice t0)  ; 09:00
    (free alice t1)  ; 09:30
    (free alice t2)  ; 10:00
    (free alice t3)  ; 10:30
    (free alice t8)  ; 13:00
    (free alice t9)  ; 13:30
    (free alice t10) ; 14:00
    (free alice t11) ; 14:30
    (free alice t12) ; 15:00
    (free alice t13) ; 15:30

    ;; Bob: Available 10:30-12:00 and 14:00-15:30
    ;; Allowed starts: 10:30,11:00,11:30 and 14:00,14:30,15:00
    (free bob t3)  ; 10:30
    (free bob t4)  ; 11:00
    (free bob t5)  ; 11:30
    (free bob t10) ; 14:00
    (free bob t11) ; 14:30
    (free bob t12) ; 15:00

    ;; Carol: Available 09:30-10:30, 11:00-12:30, and 15:00-17:00
    ;; Allowed starts: 09:30,10:00 and 11:00,11:30,12:00 and 15:00,15:30,16:00,16:30
    (free carol t1)  ; 09:30
    (free carol t2)  ; 10:00
    (free carol t4)  ; 11:00
    (free carol t5)  ; 11:30
    (free carol t6)  ; 12:00
    (free carol t12) ; 15:00
    (free carol t13) ; 15:30
    (free carol t14) ; 16:00
    (free carol t15) ; 16:30

    ;; Mark Bob's "morning" start slots (definition used for the tie-breaker).
    ;; Here "Bob's morning" is treated as any 30-min slot starting before 12:00 (09:00..11:30).
    (bob-morning t0) ; 09:00
    (bob-morning t1) ; 09:30
    (bob-morning t2) ; 10:00
    (bob-morning t3) ; 10:30
    (bob-morning t4) ; 11:00
    (bob-morning t5) ; 11:30

    ;; No (interruption-ack) and no (scheduled) in the initial state.
  )

  ;; Goal: have the meeting scheduled at some start time. The planner will minimize
  ;; the number of actions (advances + optional ack) so the earliest feasible start time
  ;; that respects all hard availability constraints will be found. If two start times
  ;; are equally early, the extra step required to acknowledge an interruption of Bob's
  ;; morning makes the non-interrupting option (if available) preferred.
  (:goal (scheduled))
)