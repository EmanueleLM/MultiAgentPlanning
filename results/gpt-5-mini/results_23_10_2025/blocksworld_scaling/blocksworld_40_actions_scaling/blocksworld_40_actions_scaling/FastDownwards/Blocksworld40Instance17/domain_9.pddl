(define (domain blocksworld_instance17)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent step)
  (:constants
    a b c d e f g h i j k l - block
    agent_alpha agent_beta - agent
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
    s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 - step
  )
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-step ?s - step)
    (assigned ?s - step ?a - agent)
  )

  (:action step1-unstack-b-a
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on b a) (clear b) (handempty))
    :effect (and (not (on b a)) (holding b) (not (clear b)) (clear a) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step2-stack-b-a
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding b) (clear a))
    :effect (and (on b a) (not (holding b)) (clear b) (not (clear a)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step3-unstack-f-h
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on f h) (clear f) (handempty))
    :effect (and (not (on f h)) (holding f) (not (clear f)) (clear h) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step4-stack-f-j
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding f) (clear j))
    :effect (and (on f j) (not (holding f)) (clear f) (not (clear j)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step5-unstack-b-a
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on b a) (clear b) (handempty))
    :effect (and (not (on b a)) (holding b) (not (clear b)) (clear a) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step6-putdown-b
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding b))
    :effect (and (ontable b) (not (holding b)) (clear b) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step7-unstack-i-l
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on i l) (clear i) (handempty))
    :effect (and (not (on i l)) (holding i) (not (clear i)) (clear l) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step8-stack-i-d
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding i) (clear d))
    :effect (and (on i d) (not (holding i)) (clear i) (not (clear d)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step9-unstack-f-j
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on f j) (clear f) (handempty))
    :effect (and (not (on f j)) (holding f) (not (clear f)) (clear j) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step10-stack-f-l
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding f) (clear l))
    :effect (and (on f l) (not (holding f)) (clear f) (not (clear l)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step11-pickup-a
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (ontable a) (clear a) (handempty))
    :effect (and (not (ontable a)) (holding a) (not (clear a)) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step12-stack-a-j
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding a) (clear j))
    :effect (and (on a j) (not (holding a)) (clear a) (not (clear j)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step13-pickup-h
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (ontable h) (clear h) (handempty))
    :effect (and (not (ontable h)) (holding h) (not (clear h)) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step14-stack-h-f
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding h) (clear f))
    :effect (and (on h f) (not (holding h)) (clear h) (not (clear f)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step15-unstack-i-d
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on i d) (clear i) (handempty))
    :effect (and (not (on i d)) (holding i) (not (clear i)) (clear d) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step16-putdown-i
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding i))
    :effect (and (ontable i) (not (holding i)) (clear i) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step17-pickup-b
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (ontable b) (clear b) (handempty))
    :effect (and (not (ontable b)) (holding b) (not (clear b)) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step18-stack-b-i
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding b) (clear i))
    :effect (and (on b i) (not (holding b)) (clear b) (not (clear i)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step19-unstack-d-k
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on d k) (clear d) (handempty))
    :effect (and (not (on d k)) (holding d) (not (clear d)) (clear k) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step20-stack-d-b
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding d) (clear b))
    :effect (and (on d b) (not (holding d)) (clear d) (not (clear b)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step21-unstack-a-j
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on a j) (clear a) (handempty))
    :effect (and (not (on a j)) (holding a) (not (clear a)) (clear j) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step22-stack-a-d
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding a) (clear d))
    :effect (and (on a d) (not (holding a)) (clear a) (not (clear d)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step23-unstack-j-e
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on j e) (clear j) (handempty))
    :effect (and (not (on j e)) (holding j) (not (clear j)) (clear e) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step24-stack-j-k
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding j) (clear k))
    :effect (and (on j k) (not (holding j)) (clear j) (not (clear k)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step25-unstack-a-d
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on a d) (clear a) (handempty))
    :effect (and (not (on a d)) (holding a) (not (clear a)) (clear d) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step26-stack-a-j
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding a) (clear j))
    :effect (and (on a j) (not (holding a)) (clear a) (not (clear j)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step27-unstack-h-f
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on h f) (clear h) (handempty))
    :effect (and (not (on h f)) (holding h) (not (clear h)) (clear f) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step28-stack-h-f
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding h) (clear f))
    :effect (and (on h f) (not (holding h)) (clear h) (not (clear f)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step29-unstack-d-b
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on d b) (clear d) (handempty))
    :effect (and (not (on d b)) (holding d) (not (clear d)) (clear b) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step30-stack-d-e
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding d) (clear e))
    :effect (and (on d e) (not (holding d)) (clear d) (not (clear e)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step31-unstack-h-f
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on h f) (clear h) (handempty))
    :effect (and (not (on h f)) (holding h) (not (clear h)) (clear f) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step32-stack-h-d
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding h) (clear d))
    :effect (and (on h d) (not (holding h)) (clear h) (not (clear d)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step33-unstack-b-i
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on b i) (clear b) (handempty))
    :effect (and (not (on b i)) (holding b) (not (clear b)) (clear i) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step34-stack-b-h
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding b) (clear h))
    :effect (and (on b h) (not (holding b)) (clear b) (not (clear h)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step35-unstack-a-j
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on a j) (clear a) (handempty))
    :effect (and (not (on a j)) (holding a) (not (clear a)) (clear j) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step36-stack-a-i
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding a) (clear i))
    :effect (and (on a i) (not (holding a)) (clear a) (not (clear i)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step37-unstack-b-h
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on b h) (clear b) (handempty))
    :effect (and (not (on b h)) (holding b) (not (clear b)) (clear h) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step38-stack-b-h
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding b) (clear h))
    :effect (and (on b h) (not (holding b)) (clear b) (not (clear h)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step39-unstack-b-h
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (on b h) (clear b) (handempty))
    :effect (and (not (on b h)) (holding b) (not (clear b)) (clear h) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step40-stack-b-a
    :parameters (?s - step ?snext - step ?ag - agent)
    :precondition (and (at-step ?s) (assigned ?s ?ag) (holding b) (clear a))
    :effect (and (on b a) (not (holding b)) (clear b) (not (clear a)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )
)