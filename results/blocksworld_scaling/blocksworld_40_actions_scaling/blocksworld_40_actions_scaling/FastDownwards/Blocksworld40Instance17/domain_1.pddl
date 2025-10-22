(define (domain blocksworld_instance17)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-step ?s - step)
    (assigned ?s - step ?a - agent)
  )

  ;; Step 1
  (:action step1-unstack-B-A
    :precondition (and (at-step s1) (assigned s1 agent_alpha) (on b a) (clear b) (handempty))
    :effect (and
      (not (on b a))
      (holding b)
      (not (clear b))
      (clear a)
      (not (at-step s1))
      (at-step s2)
      (not (handempty))
    )
  )

  ;; Step 2
  (:action step2-stack-B-A
    :precondition (and (at-step s2) (assigned s2 agent_beta) (holding b) (clear a))
    :effect (and
      (on b a)
      (not (holding b))
      (clear b)
      (not (clear a))
      (not (at-step s2))
      (at-step s3)
      (handempty)
    )
  )

  ;; Step 3
  (:action step3-unstack-F-H
    :precondition (and (at-step s3) (assigned s3 agent_alpha) (on f h) (clear f) (handempty))
    :effect (and
      (not (on f h))
      (holding f)
      (not (clear f))
      (clear h)
      (not (at-step s3))
      (at-step s4)
      (not (handempty))
    )
  )

  ;; Step 4
  (:action step4-stack-F-J
    :precondition (and (at-step s4) (assigned s4 agent_beta) (holding f) (clear j))
    :effect (and
      (on f j)
      (not (holding f))
      (clear f)
      (not (clear j))
      (not (at-step s4))
      (at-step s5)
      (handempty)
    )
  )

  ;; Step 5
  (:action step5-unstack-B-A
    :precondition (and (at-step s5) (assigned s5 agent_alpha) (on b a) (clear b) (handempty))
    :effect (and
      (not (on b a))
      (holding b)
      (not (clear b))
      (clear a)
      (not (at-step s5))
      (at-step s6)
      (not (handempty))
    )
  )

  ;; Step 6
  (:action step6-putdown-B
    :precondition (and (at-step s6) (assigned s6 agent_beta) (holding b))
    :effect (and
      (ontable b)
      (not (holding b))
      (clear b)
      (not (at-step s6))
      (at-step s7)
      (handempty)
    )
  )

  ;; Step 7
  (:action step7-unstack-I-L
    :precondition (and (at-step s7) (assigned s7 agent_alpha) (on i l) (clear i) (handempty))
    :effect (and
      (not (on i l))
      (holding i)
      (not (clear i))
      (clear l)
      (not (at-step s7))
      (at-step s8)
      (not (handempty))
    )
  )

  ;; Step 8
  (:action step8-stack-I-D
    :precondition (and (at-step s8) (assigned s8 agent_beta) (holding i) (clear d))
    :effect (and
      (on i d)
      (not (holding i))
      (clear i)
      (not (clear d))
      (not (at-step s8))
      (at-step s9)
      (handempty)
    )
  )

  ;; Step 9
  (:action step9-unstack-F-J
    :precondition (and (at-step s9) (assigned s9 agent_alpha) (on f j) (clear f) (handempty))
    :effect (and
      (not (on f j))
      (holding f)
      (not (clear f))
      (clear j)
      (not (at-step s9))
      (at-step s10)
      (not (handempty))
    )
  )

  ;; Step 10
  (:action step10-stack-F-L
    :precondition (and (at-step s10) (assigned s10 agent_beta) (holding f) (clear l))
    :effect (and
      (on f l)
      (not (holding f))
      (clear f)
      (not (clear l))
      (not (at-step s10))
      (at-step s11)
      (handempty)
    )
  )

  ;; Step 11
  (:action step11-pickup-A
    :precondition (and (at-step s11) (assigned s11 agent_alpha) (ontable a) (clear a) (handempty))
    :effect (and
      (not (ontable a))
      (holding a)
      (not (clear a))
      (not (at-step s11))
      (at-step s12)
      (not (handempty))
    )
  )

  ;; Step 12
  (:action step12-stack-A-J
    :precondition (and (at-step s12) (assigned s12 agent_beta) (holding a) (clear j))
    :effect (and
      (on a j)
      (not (holding a))
      (clear a)
      (not (clear j))
      (not (at-step s12))
      (at-step s13)
      (handempty)
    )
  )

  ;; Step 13
  (:action step13-pickup-H
    :precondition (and (at-step s13) (assigned s13 agent_alpha) (ontable h) (clear h) (handempty))
    :effect (and
      (not (ontable h))
      (holding h)
      (not (clear h))
      (not (at-step s13))
      (at-step s14)
      (not (handempty))
    )
  )

  ;; Step 14
  (:action step14-stack-H-F
    :precondition (and (at-step s14) (assigned s14 agent_beta) (holding h) (clear f))
    :effect (and
      (on h f)
      (not (holding h))
      (clear h)
      (not (clear f))
      (not (at-step s14))
      (at-step s15)
      (handempty)
    )
  )

  ;; Step 15
  (:action step15-unstack-I-D
    :precondition (and (at-step s15) (assigned s15 agent_alpha) (on i d) (clear i) (handempty))
    :effect (and
      (not (on i d))
      (holding i)
      (not (clear i))
      (clear d)
      (not (at-step s15))
      (at-step s16)
      (not (handempty))
    )
  )

  ;; Step 16
  (:action step16-putdown-I
    :precondition (and (at-step s16) (assigned s16 agent_beta) (holding i))
    :effect (and
      (ontable i)
      (not (holding i))
      (clear i)
      (not (at-step s16))
      (at-step s17)
      (handempty)
    )
  )

  ;; Step 17
  (:action step17-pickup-B
    :precondition (and (at-step s17) (assigned s17 agent_alpha) (ontable b) (clear b) (handempty))
    :effect (and
      (not (ontable b))
      (holding b)
      (not (clear b))
      (not (at-step s17))
      (at-step s18)
      (not (handempty))
    )
  )

  ;; Step 18
  (:action step18-stack-B-I
    :precondition (and (at-step s18) (assigned s18 agent_beta) (holding b) (clear i))
    :effect (and
      (on b i)
      (not (holding b))
      (clear b)
      (not (clear i))
      (not (at-step s18))
      (at-step s19)
      (handempty)
    )
  )

  ;; Step 19
  (:action step19-unstack-D-K
    :precondition (and (at-step s19) (assigned s19 agent_alpha) (on d k) (clear d) (handempty))
    :effect (and
      (not (on d k))
      (holding d)
      (not (clear d))
      (clear k)
      (not (at-step s19))
      (at-step s20)
      (not (handempty))
    )
  )

  ;; Step 20
  (:action step20-stack-D-B
    :precondition (and (at-step s20) (assigned s20 agent_beta) (holding d) (clear b))
    :effect (and
      (on d b)
      (not (holding d))
      (clear d)
      (not (clear b))
      (not (at-step s20))
      (at-step s21)
      (handempty)
    )
  )

  ;; Step 21
  (:action step21-unstack-A-J
    :precondition (and (at-step s21) (assigned s21 agent_alpha) (on a j) (clear a) (handempty))
    :effect (and
      (not (on a j))
      (holding a)
      (not (clear a))
      (clear j)
      (not (at-step s21))
      (at-step s22)
      (not (handempty))
    )
  )

  ;; Step 22
  (:action step22-stack-A-D
    :precondition (and (at-step s22) (assigned s22 agent_beta) (holding a) (clear d))
    :effect (and
      (on a d)
      (not (holding a))
      (clear a)
      (not (clear d))
      (not (at-step s22))
      (at-step s23)
      (handempty)
    )
  )

  ;; Step 23
  (:action step23-unstack-J-E
    :precondition (and (at-step s23) (assigned s23 agent_alpha) (on j e) (clear j) (handempty))
    :effect (and
      (not (on j e))
      (holding j)
      (not (clear j))
      (clear e)
      (not (at-step s23))
      (at-step s24)
      (not (handempty))
    )
  )

  ;; Step 24
  (:action step24-stack-J-K
    :precondition (and (at-step s24) (assigned s24 agent_beta) (holding j) (clear k))
    :effect (and
      (on j k)
      (not (holding j))
      (clear j)
      (not (clear k))
      (not (at-step s24))
      (at-step s25)
      (handempty)
    )
  )

  ;; Step 25
  (:action step25-unstack-A-D
    :precondition (and (at-step s25) (assigned s25 agent_alpha) (on a d) (clear a) (handempty))
    :effect (and
      (not (on a d))
      (holding a)
      (not (clear a))
      (clear d)
      (not (at-step s25))
      (at-step s26)
      (not (handempty))
    )
  )

  ;; Step 26
  (:action step26-stack-A-J
    :precondition (and (at-step s26) (assigned s26 agent_beta) (holding a) (clear j))
    :effect (and
      (on a j)
      (not (holding a))
      (clear a)
      (not (clear j))
      (not (at-step s26))
      (at-step s27)
      (handempty)
    )
  )

  ;; Step 27
  (:action step27-unstack-H-F
    :precondition (and (at-step s27) (assigned s27 agent_alpha) (on h f) (clear h) (handempty))
    :effect (and
      (not (on h f))
      (holding h)
      (not (clear h))
      (clear f)
      (not (at-step s27))
      (at-step s28)
      (not (handempty))
    )
  )

  ;; Step 28
  (:action step28-stack-H-F
    :precondition (and (at-step s28) (assigned s28 agent_beta) (holding h) (clear f))
    :effect (and
      (on h f)
      (not (holding h))
      (clear h)
      (not (clear f))
      (not (at-step s28))
      (at-step s29)
      (handempty)
    )
  )

  ;; Step 29
  (:action step29-unstack-D-B
    :precondition (and (at-step s29) (assigned s29 agent_alpha) (on d b) (clear d) (handempty))
    :effect (and
      (not (on d b))
      (holding d)
      (not (clear d))
      (clear b)
      (not (at-step s29))
      (at-step s30)
      (not (handempty))
    )
  )

  ;; Step 30
  (:action step30-stack-D-E
    :precondition (and (at-step s30) (assigned s30 agent_beta) (holding d) (clear e))
    :effect (and
      (on d e)
      (not (holding d))
      (clear d)
      (not (clear e))
      (not (at-step s30))
      (at-step s31)
      (handempty)
    )
  )

  ;; Step 31
  (:action step31-unstack-H-F
    :precondition (and (at-step s31) (assigned s31 agent_alpha) (on h f) (clear h) (handempty))
    :effect (and
      (not (on h f))
      (holding h)
      (not (clear h))
      (clear f)
      (not (at-step s31))
      (at-step s32)
      (not (handempty))
    )
  )

  ;; Step 32
  (:action step32-stack-H-D
    :precondition (and (at-step s32) (assigned s32 agent_beta) (holding h) (clear d))
    :effect (and
      (on h d)
      (not (holding h))
      (clear h)
      (not (clear d))
      (not (at-step s32))
      (at-step s33)
      (handempty)
    )
  )

  ;; Step 33
  (:action step33-unstack-B-I
    :precondition (and (at-step s33) (assigned s33 agent_alpha) (on b i) (clear b) (handempty))
    :effect (and
      (not (on b i))
      (holding b)
      (not (clear b))
      (clear i)
      (not (at-step s33))
      (at-step s34)
      (not (handempty))
    )
  )

  ;; Step 34
  (:action step34-stack-B-H
    :precondition (and (at-step s34) (assigned s34 agent_beta) (holding b) (clear h))
    :effect (and
      (on b h)
      (not (holding b))
      (clear b)
      (not (clear h))
      (not (at-step s34))
      (at-step s35)
      (handempty)
    )
  )

  ;; Step 35
  (:action step35-unstack-A-J
    :precondition (and (at-step s35) (assigned s35 agent_alpha) (on a j) (clear a) (handempty))
    :effect (and
      (not (on a j))
      (holding a)
      (not (clear a))
      (clear j)
      (not (at-step s35))
      (at-step s36)
      (not (handempty))
    )
  )

  ;; Step 36
  (:action step36-stack-A_I
    :precondition (and (at-step s36) (assigned s36 agent_beta) (holding a) (clear i))
    :effect (and
      (on a i)
      (not (holding a))
      (clear a)
      (not (clear i))
      (not (at-step s36))
      (at-step s37)
      (handempty)
    )
  )

  ;; Step 37
  (:action step37-unstack-B_H
    :precondition (and (at-step s37) (assigned s37 agent_alpha) (on b h) (clear b) (handempty))
    :effect (and
      (not (on b h))
      (holding b)
      (not (clear b))
      (clear h)
      (not (at-step s37))
      (at-step s38)
      (not (handempty))
    )
  )

  ;; Step 38
  (:action step38-stack-B_H
    :precondition (and (at-step s38) (assigned s38 agent_beta) (holding b) (clear h))
    :effect (and
      (on b h)
      (not (holding b))
      (clear b)
      (not (clear h))
      (not (at-step s38))
      (at-step s39)
      (handempty)
    )
  )

  ;; Step 39
  (:action step39-unstack-B_H
    :precondition (and (at-step s39) (assigned s39 agent_alpha) (on b h) (clear b) (handempty))
    :effect (and
      (not (on b h))
      (holding b)
      (not (clear b))
      (clear h)
      (not (at-step s39))
      (at-step s40)
      (not (handempty))
    )
  )

  ;; Step 40
  (:action step40-stack-B_A
    :precondition (and (at-step s40) (assigned s40 agent_beta) (holding b) (clear a))
    :effect (and
      (on b a)
      (not (holding b))
      (clear b)
      (not (clear a))
      (not (at-step s40))
      (at-step s41)
      (handempty)
    )
  )
)