(define (problem schedule-monday-09-17-30min)
  (:domain meeting-scheduling)

  ;; Discrete 30-minute start slots between 09:00 and 17:00 on Monday
  ;; t0 = 09:00, t1 = 09:30, t2 = 10:00, t3 = 10:30, t4 = 11:00, t5 = 11:30,
  ;; t6 = 12:00, t7 = 12:30, t8 = 13:00, t9 = 13:30, t10 = 14:00, t11 = 14:30,
  ;; t12 = 15:00, t13 = 15:30, t14 = 16:00, t15 = 16:30
  (:objects
    marie janice elijah theresa - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )

  (:init
    ;; participants
    (participant marie)
    (participant janice)
    (participant elijah)
    (participant theresa)

    ;; AVAILABILITIES derived from each agent's busy intervals (busy intervals are interpreted as unavailable).
    ;; Marie: busy 11:00-11:30 (t4), and 15:00-16:30 (t12,t13,t14) -> unavailable at those starts; available otherwise.
    (available marie t0) (available marie t1) (available marie t2) (available marie t3)
    (available marie t5) (available marie t6) (available marie t7) (available marie t8)
    (available marie t9) (available marie t10) (available marie t11) (available marie t15)

    ;; Janice: busy 12:30-13:00 (t7), and 13:30-15:00 (t9,t10,t11) -> unavailable at those starts.
    (available janice t0) (available janice t1) (available janice t2) (available janice t3)
    (available janice t4) (available janice t5) (available janice t6) (available janice t8)
    (available janice t12) (available janice t13) (available janice t14) (available janice t15)

    ;; Elijah: busy 10:00-13:00 (t2,t3,t4,t5,t6,t7), busy 14:30-15:00 (t11), busy 16:00-16:30 (t14)
    ;; -> available where not blocked
    (available elijah t0) (available elijah t1)
    (available elijah t8) (available elijah t9) (available elijah t10)
    (available elijah t12) (available elijah t13) (available elijah t15)

    ;; Theresa: busy 09:30-10:30 (t1,t2), 12:00-13:00 (t6,t7), 13:30-14:00 (t9), 14:30-15:00 (t11),
    ;; 15:30-16:00 (t13), 16:30-17:00 (t15).
    ;; PLUS explicit hard preference (treated as hard constraint): do not meet after 12:00.
    ;; Therefore only allowed start times are those <= 11:30 (t0..t5). From these, t1 and t2 are blocked by busy intervals.
    (available theresa t0) (available theresa t3) (available theresa t4) (available theresa t5)

    ;; EARLIEST joint feasible start precomputed from the above availabilities and Theresa's hard preference:
    ;; The earliest start where ALL participants are available is t0 (09:00). We assert that as (earliest t0)
    (earliest t0)
  )

  ;; Goal: produce a valid scheduled 30-minute meeting slot (we request the earliest feasible slot: t0).
  (:goal (and (meeting-at t0)))
)