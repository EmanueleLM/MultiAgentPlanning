(define (domain blocks-multiagent-ordered-sequence)
  (:requirements :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)

    (step0_done)
    (step1_done) (step2_done) (step3_done) (step4_done) (step5_done)
    (step6_done) (step7_done) (step8_done) (step9_done) (step10_done)
    (step11_done) (step12_done) (step13_done) (step14_done) (step15_done)
    (step16_done) (step17_done) (step18_done) (step19_done) (step20_done)
    (step21_done) (step22_done) (step23_done) (step24_done) (step25_done)
    (step26_done) (step27_done) (step28_done) (step29_done) (step30_done)
    (step31_done) (step32_done) (step33_done) (step34_done) (step35_done)
    (step36_done) (step37_done) (step38_done) (step39_done) (step40_done)
  )

  (:action step1-unstack-f-b
    :parameters (?a - agent)
    :precondition (and (step0_done) (on f b) (clear f) (handempty ?a))
    :effect (and
      (holding ?a f)
      (clear b)
      (not (on f b))
      (not (clear f))
      (not (handempty ?a))
      (step1_done)
    )
  )

  (:action step2-putdown-f
    :parameters (?a - agent)
    :precondition (and (step1_done) (holding ?a f))
    :effect (and
      (ontable f)
      (clear f)
      (handempty ?a)
      (not (holding ?a f))
      (step2_done)
    )
  )

  (:action step3-unstack-g-e
    :parameters (?a - agent)
    :precondition (and (step2_done) (on g e) (clear g) (handempty ?a))
    :effect (and
      (holding ?a g)
      (clear e)
      (not (on g e))
      (not (clear g))
      (not (handempty ?a))
      (step3_done)
    )
  )

  (:action step4-stack-g-f
    :parameters (?a - agent)
    :precondition (and (step3_done) (holding ?a g) (clear f))
    :effect (and
      (on g f)
      (not (clear f))
      (clear g)
      (handempty ?a)
      (not (holding ?a g))
      (step4_done)
    )
  )

  (:action step5-pickup-e
    :parameters (?a - agent)
    :precondition (and (step4_done) (ontable e) (clear e) (handempty ?a))
    :effect (and
      (holding ?a e)
      (not (ontable e))
      (not (clear e))
      (not (handempty ?a))
      (step5_done)
    )
  )

  (:action step6-stack-e-d
    :parameters (?a - agent)
    :precondition (and (step5_done) (holding ?a e) (clear d))
    :effect (and
      (on e d)
      (not (clear d))
      (clear e)
      (handempty ?a)
      (not (holding ?a e))
      (step6_done)
    )
  )

  (:action step7-unstack-g-f
    :parameters (?a - agent)
    :precondition (and (step6_done) (on g f) (clear g) (handempty ?a))
    :effect (and
      (holding ?a g)
      (clear f)
      (not (on g f))
      (not (clear g))
      (not (handempty ?a))
      (step7_done)
    )
  )

  (:action step8-putdown-g
    :parameters (?a - agent)
    :precondition (and (step7_done) (holding ?a g))
    :effect (and
      (ontable g)
      (clear g)
      (handempty ?a)
      (not (holding ?a g))
      (step8_done)
    )
  )

  (:action step9-pickup-g
    :parameters (?a - agent)
    :precondition (and (step8_done) (ontable g) (clear g) (handempty ?a))
    :effect (and
      (holding ?a g)
      (not (ontable g))
      (not (clear g))
      (not (handempty ?a))
      (step9_done)
    )
  )

  (:action step10-putdown-g
    :parameters (?a - agent)
    :precondition (and (step9_done) (holding ?a g))
    :effect (and
      (ontable g)
      (clear g)
      (handempty ?a)
      (not (holding ?a g))
      (step10_done)
    )
  )

  (:action step11-unstack-b-j
    :parameters (?a - agent)
    :precondition (and (step10_done) (on b j) (clear b) (handempty ?a))
    :effect (and
      (holding ?a b)
      (clear j)
      (not (on b j))
      (not (clear b))
      (not (handempty ?a))
      (step11_done)
    )
  )

  (:action step12-stack-b-e
    :parameters (?a - agent)
    :precondition (and (step11_done) (holding ?a b) (clear e))
    :effect (and
      (on b e)
      (not (clear e))
      (clear b)
      (handempty ?a)
      (not (holding ?a b))
      (step12_done)
    )
  )

  (:action step13-pickup-f
    :parameters (?a - agent)
    :precondition (and (step12_done) (ontable f) (clear f) (handempty ?a))
    :effect (and
      (holding ?a f)
      (not (ontable f))
      (not (clear f))
      (not (handempty ?a))
      (step13_done)
    )
  )

  (:action step14-stack-f-b
    :parameters (?a - agent)
    :precondition (and (step13_done) (holding ?a f) (clear b))
    :effect (and
      (on f b)
      (not (clear b))
      (clear f)
      (handempty ?a)
      (not (holding ?a f))
      (step14_done)
    )
  )

  (:action step15-unstack-f-b
    :parameters (?a - agent)
    :precondition (and (step14_done) (on f b) (clear f) (handempty ?a))
    :effect (and
      (holding ?a f)
      (clear b)
      (not (on f b))
      (not (clear f))
      (not (handempty ?a))
      (step15_done)
    )
  )

  (:action step16-stack-f-g
    :parameters (?a - agent)
    :precondition (and (step15_done) (holding ?a f) (clear g))
    :effect (and
      (on f g)
      (not (clear g))
      (clear f)
      (handempty ?a)
      (not (holding ?a f))
      (step16_done)
    )
  )

  (:action step17-unstack-f-g
    :parameters (?a - agent)
    :precondition (and (step16_done) (on f g) (clear f) (handempty ?a))
    :effect (and
      (holding ?a f)
      (clear g)
      (not (on f g))
      (not (clear f))
      (not (handempty ?a))
      (step17_done)
    )
  )

  (:action step18-putdown-f
    :parameters (?a - agent)
    :precondition (and (step17_done) (holding ?a f))
    :effect (and
      (ontable f)
      (clear f)
      (handempty ?a)
      (not (holding ?a f))
      (step18_done)
    )
  )

  (:action step19-unstack-j-c
    :parameters (?a - agent)
    :precondition (and (step18_done) (on j c) (clear j) (handempty ?a))
    :effect (and
      (holding ?a j)
      (clear c)
      (not (on j c))
      (not (clear j))
      (not (handempty ?a))
      (step19_done)
    )
  )

  (:action step20-putdown-j
    :parameters (?a - agent)
    :precondition (and (step19_done) (holding ?a j))
    :effect (and
      (ontable j)
      (clear j)
      (handempty ?a)
      (not (holding ?a j))
      (step20_done)
    )
  )

  (:action step21-unstack-b-e
    :parameters (?a - agent)
    :precondition (and (step20_done) (on b e) (clear b) (handempty ?a))
    :effect (and
      (holding ?a b)
      (clear e)
      (not (on b e))
      (not (clear b))
      (not (handempty ?a))
      (step21_done)
    )
  )

  (:action step22-stack-b-f
    :parameters (?a - agent)
    :precondition (and (step21_done) (holding ?a b) (clear f))
    :effect (and
      (on b f)
      (not (clear f))
      (clear b)
      (handempty ?a)
      (not (holding ?a b))
      (step22_done)
    )
  )

  (:action step23-unstack-e-d
    :parameters (?a - agent)
    :precondition (and (step22_done) (on e d) (clear e) (handempty ?a))
    :effect (and
      (holding ?a e)
      (clear d)
      (not (on e d))
      (not (clear e))
      (not (handempty ?a))
      (step23_done)
    )
  )

  (:action step24-putdown-e
    :parameters (?a - agent)
    :precondition (and (step23_done) (holding ?a e))
    :effect (and
      (ontable e)
      (clear e)
      (handempty ?a)
      (not (holding ?a e))
      (step24_done)
    )
  )

  (:action step25-unstack-b-f
    :parameters (?a - agent)
    :precondition (and (step24_done) (on b f) (clear b) (handempty ?a))
    :effect (and
      (holding ?a b)
      (clear f)
      (not (on b f))
      (not (clear b))
      (not (handempty ?a))
      (step25_done)
    )
  )

  (:action step26-stack-b-d
    :parameters (?a - agent)
    :precondition (and (step25_done) (holding ?a b) (clear d))
    :effect (and
      (on b d)
      (not (clear d))
      (clear b)
      (handempty ?a)
      (not (holding ?a b))
      (step26_done)
    )
  )

  (:action step27-pickup-c
    :parameters (?a - agent)
    :precondition (and (step26_done) (ontable c) (clear c) (handempty ?a))
    :effect (and
      (holding ?a c)
      (not (ontable c))
      (not (clear c))
      (not (handempty ?a))
      (step27_done)
    )
  )

  (:action step28-stack-c-f
    :parameters (?a - agent)
    :precondition (and (step27_done) (holding ?a c) (clear f))
    :effect (and
      (on c f)
      (not (clear f))
      (clear c)
      (handempty ?a)
      (not (holding ?a c))
      (step28_done)
    )
  )

  (:action step29-pickup-e
    :parameters (?a - agent)
    :precondition (and (step28_done) (ontable e) (clear e) (handempty ?a))
    :effect (and
      (holding ?a e)
      (not (ontable e))
      (not (clear e))
      (not (handempty ?a))
      (step29_done)
    )
  )

  (:action step30-putdown-e
    :parameters (?a - agent)
    :precondition (and (step29_done) (holding ?a e))
    :effect (and
      (ontable e)
      (clear e)
      (handempty ?a)
      (not (holding ?a e))
      (step30_done)
    )
  )

  (:action step31-unstack-b-d
    :parameters (?a - agent)
    :precondition (and (step30_done) (on b d) (clear b) (handempty ?a))
    :effect (and
      (holding ?a b)
      (clear d)
      (not (on b d))
      (not (clear b))
      (not (handempty ?a))
      (step31_done)
    )
  )

  (:action step32-stack-b-d
    :parameters (?a - agent)
    :precondition (and (step31_done) (holding ?a b) (clear d))
    :effect (and
      (on b d)
      (not (clear d))
      (clear b)
      (handempty ?a)
      (not (holding ?a b))
      (step32_done)
    )
  )

  (:action step33-pickup-e
    :parameters (?a - agent)
    :precondition (and (step32_done) (ontable e) (clear e) (handempty ?a))
    :effect (and
      (holding ?a e)
      (not (ontable e))
      (not (clear e))
      (not (handempty ?a))
      (step33_done)
    )
  )

  (:action step34-stack-e-j
    :parameters (?a - agent)
    :precondition (and (step33_done) (holding ?a e) (clear j))
    :effect (and
      (on e j)
      (not (clear j))
      (clear e)
      (handempty ?a)
      (not (holding ?a e))
      (step34_done)
    )
  )

  (:action step35-unstack-e-j
    :parameters (?a - agent)
    :precondition (and (step34_done) (on e j) (clear e) (handempty ?a))
    :effect (and
      (holding ?a e)
      (clear j)
      (not (on e j))
      (not (clear e))
      (not (handempty ?a))
      (step35_done)
    )
  )

  (:action step36-stack-e-b
    :parameters (?a - agent)
    :precondition (and (step35_done) (holding ?a e) (clear b))
    :effect (and
      (on e b)
      (not (clear b))
      (clear e)
      (handempty ?a)
      (not (holding ?a e))
      (step36_done)
    )
  )

  (:action step37-unstack-e-b
    :parameters (?a - agent)
    :precondition (and (step36_done) (on e b) (clear e) (handempty ?a))
    :effect (and
      (holding ?a e)
      (clear b)
      (not (on e b))
      (not (clear e))
      (not (handempty ?a))
      (step37_done)
    )
  )

  (:action step38-stack-e-g
    :parameters (?a - agent)
    :precondition (and (step37_done) (holding ?a e) (clear g))
    :effect (and
      (on e g)
      (not (clear g))
      (clear e)
      (handempty ?a)
      (not (holding ?a e))
      (step38_done)
    )
  )

  (:action step39-unstack-c-f
    :parameters (?a - agent)
    :precondition (and (step38_done) (on c f) (clear c) (handempty ?a))
    :effect (and
      (holding ?a c)
      (clear f)
      (not (on c f))
      (not (clear c))
      (not (handempty ?a))
      (step39_done)
    )
  )

  (:action step40-putdown-c
    :parameters (?a - agent)
    :precondition (and (step39_done) (holding ?a c))
    :effect (and
      (ontable c)
      (clear c)
      (handempty ?a)
      (not (holding ?a c))
      (step40_done)
    )
  )
)