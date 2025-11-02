(define (problem blocksworld_sequence_instance)
  (:domain blocksworld_sequence)
  (:objects
    a b c d e f g h i j - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37
    s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 - step
  )
  (:init
    (ontable a)
    (on b a)
    (on c b)
    (ontable d)
    (on i d)
    (on j i)
    (on e j)
    (ontable f)
    (on h f)
    (on g h)
    (clear c)
    (clear e)
    (clear g)
    (handempty)
    (step-done s0)
  )
  (:goal (and (step-done s50)))
)