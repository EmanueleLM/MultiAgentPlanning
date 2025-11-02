(define (problem schedule-single-30min-monday)
  (:domain meeting-scheduling)
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )
  (:init
    (available samantha t0) (available samantha t1) (available samantha t2) (available samantha t3)
    (available samantha t5) (available samantha t6) (available samantha t7)
    (available samantha t9) (available samantha t10) (available samantha t11)
    (available samantha t12) (available samantha t14)

    (available brian t0) (available brian t1) (available brian t2) (available brian t3)
    (available brian t4) (available brian t5) (available brian t6) (available brian t7)
    (available brian t8) (available brian t9) (available brian t10) (available brian t11)
    (available brian t12) (available brian t13) (available brian t14) (available brian t15)

    (available arthur t0) (available arthur t1) (available arthur t2) (available arthur t3)
    (available arthur t4) (available arthur t5) (available arthur t6) (available arthur t7)
    (available arthur t8) (available arthur t10) (available arthur t11)
    (available arthur t12) (available arthur t13) (available arthur t15)

    (available matthew t0) (available matthew t1) (available matthew t2) (available matthew t3)
    (available matthew t4) (available matthew t5) (available matthew t6) (available matthew t7)
    (available matthew t8) (available matthew t9) (available matthew t10) (available matthew t11)
    (available matthew t12) (available matthew t13) (available matthew t14) (available matthew t15)

    (available marilyn t2) (available marilyn t5) (available marilyn t8)
    (available marilyn t9) (available marilyn t11) (available marilyn t12)
    (available marilyn t13) (available marilyn t15)

    (available mark t0) (available mark t4) (available mark t9)
    (available mark t11) (available mark t14) (available mark t15)

    (available andrea t0) (available andrea t4)
    (available andrea t11) (available andrea t13) (available andrea t14) (available andrea t15)
  )
  (:goal (and
    (attending samantha)
    (attending brian)
    (attending arthur)
    (attending matthew)
    (attending marilyn)
    (attending mark)
    (attending andrea)
  ))
)