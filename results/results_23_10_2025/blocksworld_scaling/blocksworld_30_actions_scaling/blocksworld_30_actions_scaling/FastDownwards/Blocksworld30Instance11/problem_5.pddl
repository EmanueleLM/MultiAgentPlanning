(define (problem blocksworld30instance11-problem)
  (:domain blocksworld-multiagent)
  (:objects
    a b c d e f g h i j - block
    robot1 robot2 orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 - step
    table - place
  )
  (:init
    (on a b)
    (on g a)
    (on c g)
    (ontable b)
    (on d i)
    (on h d)
    (ontable i)
    (on j e)
    (ontable e)
    (ontable f)
    (clear c)
    (clear h)
    (clear j)
    (clear f)
    (handempty robot1)
    (handempty robot2)
    (handempty orchestrator)
    (done s0)
  )
  (:goal (done s30))
)