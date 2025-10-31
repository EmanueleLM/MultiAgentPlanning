(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
    thomas dylan jerry
  )

  (:init
    ;; slots covering Monday 09:00-17:00 in 30-minute granularity
    (slot t1)  ; 09:00-09:30
    (slot t2)  ; 09:30-10:00
    (slot t3)  ; 10:00-10:30
    (slot t4)  ; 10:30-11:00
    (slot t5)  ; 11:00-11:30
    (slot t6)  ; 11:30-12:00
    (slot t7)  ; 12:00-12:30
    (slot t8)  ; 12:30-13:00
    (slot t9)  ; 13:00-13:30
    (slot t10) ; 13:30-14:00
    (slot t11) ; 14:00-14:30
    (slot t12) ; 14:30-15:00
    (slot t13) ; 15:00-15:30
    (slot t14) ; 15:30-16:00
    (slot t15) ; 16:00-16:30
    (slot t16) ; 16:30-17:00

    ;; adjacency (consecutive) relations for 30-minute slots
    (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9)
    (next t9 t10) (next t10 t11) (next t11 t12) (next t12 t13)
    (next t13 t14) (next t14 t15) (next t15 t16)

    ;; Participant availabilities derived from provided busy intervals.
    ;; Thomas: free entire day 09:00-17:00
    (free thomas t1) (free thomas t2) (free thomas t3) (free thomas t4)
    (free thomas t5) (free thomas t6) (free thomas t7) (free thomas t8)
    (free thomas t9) (free thomas t10) (free thomas t11) (free thomas t12)
    (free thomas t13) (free thomas t14) (free thomas t15) (free thomas t16)

    ;; Dylan: unavailable 10:30-11:00 (t4) and 13:30-14:00 (t10)
    ;; So free in all other slots within work hours
    (free dylan t1) (free dylan t2) (free dylan t3)
    (free dylan t5) (free dylan t6) (free dylan t7) (free dylan t8) (free dylan t9)
    (free dylan t11) (free dylan t12) (free dylan t13) (free dylan t14) (free dylan t15) (free dylan t16)

    ;; Jerry: unavailable 09:00-11:00 (t1,t2,t3,t4), 11:30-14:30 (t6,t7,t8,t9,t10,t11), and 16:00-17:00 (t15,t16)
    ;; So Jerry is free only in the remaining slots within work hours
    (free jerry t5) (free jerry t12) (free jerry t13) (free jerry t14)
  )

  ;; Goal: encode the earliest feasible 60-minute slot (two consecutive 30-min slots)
  ;; Based on the hard constraints above, the earliest feasible start is 14:30 (t12),
  ;; requiring t12 and t13 to be free for all participants.
  (:goal (and (scheduled t12 t13)))
)