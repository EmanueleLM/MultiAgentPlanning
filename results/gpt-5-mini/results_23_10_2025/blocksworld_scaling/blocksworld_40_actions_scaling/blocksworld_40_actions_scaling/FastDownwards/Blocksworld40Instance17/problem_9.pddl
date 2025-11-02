(define (problem blocksworld40_instance17)
  (:domain blocksworld_instance17)
  (:objects
    a b c d e f g h i j k l - block
    agent_alpha agent_beta - agent
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
    s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 - step
  )

  (:init
    (ontable a)
    (on b a)

    (ontable c)
    (on e c)
    (on j e)

    (ontable h)
    (on f h)

    (ontable g)
    (on l g)
    (on i l)

    (ontable k)
    (on d k)

    (clear b)
    (clear j)
    (clear d)
    (clear f)
    (clear i)

    (handempty)
    (at-step s1)

    (assigned s1 agent_alpha) (assigned s2 agent_beta)
    (assigned s3 agent_alpha) (assigned s4 agent_beta)
    (assigned s5 agent_alpha) (assigned s6 agent_beta)
    (assigned s7 agent_alpha) (assigned s8 agent_beta)
    (assigned s9 agent_alpha) (assigned s10 agent_beta)
    (assigned s11 agent_alpha) (assigned s12 agent_beta)
    (assigned s13 agent_alpha) (assigned s14 agent_beta)
    (assigned s15 agent_alpha) (assigned s16 agent_beta)
    (assigned s17 agent_alpha) (assigned s18 agent_beta)
    (assigned s19 agent_alpha) (assigned s20 agent_beta)
    (assigned s21 agent_alpha) (assigned s22 agent_beta)
    (assigned s23 agent_alpha) (assigned s24 agent_beta)
    (assigned s25 agent_alpha) (assigned s26 agent_beta)
    (assigned s27 agent_alpha) (assigned s28 agent_beta)
    (assigned s29 agent_alpha) (assigned s30 agent_beta)
    (assigned s31 agent_alpha) (assigned s32 agent_beta)
    (assigned s33 agent_alpha) (assigned s34 agent_beta)
    (assigned s35 agent_alpha) (assigned s36 agent_beta)
    (assigned s37 agent_alpha) (assigned s38 agent_beta)
    (assigned s39 agent_alpha) (assigned s40 agent_beta)
  )

  (:goal (and
    (ontable c)
    (on e c)
    (on d e)
    (on h d)

    (ontable g)
    (on l g)
    (on f l)

    (ontable k)
    (on j k)

    (ontable i)
    (on a i)
    (on b a)

    (handempty)
  ))
)