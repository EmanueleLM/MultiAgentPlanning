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

  (:action step1-unstack-B-A
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on b a) (clear b) (handempty))
    :effect (and (not (on b a)) (holding b) (not (clear b)) (clear a) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step2-stack-B-A
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding b) (clear a))
    :effect (and (on b a) (not (holding b)) (clear b) (not (clear a)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step3-unstack-F-H
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on f h) (clear f) (handempty))
    :effect (and (not (on f h)) (holding f) (not (clear f)) (clear h) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step4-stack-F-J
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding f) (clear j))
    :effect (and (on f j) (not (holding f)) (clear f) (not (clear j)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step5-unstack-B-A
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on b a) (clear b) (handempty))
    :effect (and (not (on b a)) (holding b) (not (clear b)) (clear a) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step6-putdown-B
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding b))
    :effect (and (ontable b) (not (holding b)) (clear b) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step7-unstack-I-L
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on i l) (clear i) (handempty))
    :effect (and (not (on i l)) (holding i) (not (clear i)) (clear l) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step8-stack-I-D
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding i) (clear d))
    :effect (and (on i d) (not (holding i)) (clear i) (not (clear d)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step9-unstack-F-J
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on f j) (clear f) (handempty))
    :effect (and (not (on f j)) (holding f) (not (clear f)) (clear j) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step10-stack-F-L
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding f) (clear l))
    :effect (and (on f l) (not (holding f)) (clear f) (not (clear l)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step11-pickup-A
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (ontable a) (clear a) (handempty))
    :effect (and (not (ontable a)) (holding a) (not (clear a)) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step12-stack-A-J
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding a) (clear j))
    :effect (and (on a j) (not (holding a)) (clear a) (not (clear j)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step13-pickup-H
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (ontable h) (clear h) (handempty))
    :effect (and (not (ontable h)) (holding h) (not (clear h)) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step14-stack-H-F
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding h) (clear f))
    :effect (and (on h f) (not (holding h)) (clear h) (not (clear f)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step15-unstack-I-D
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on i d) (clear i) (handempty))
    :effect (and (not (on i d)) (holding i) (not (clear i)) (clear d) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step16-putdown-I
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding i))
    :effect (and (ontable i) (not (holding i)) (clear i) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step17-pickup-B
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (ontable b) (clear b) (handempty))
    :effect (and (not (ontable b)) (holding b) (not (clear b)) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step18-stack-B-I
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding b) (clear i))
    :effect (and (on b i) (not (holding b)) (clear b) (not (clear i)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step19-unstack-D-K
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on d k) (clear d) (handempty))
    :effect (and (not (on d k)) (holding d) (not (clear d)) (clear k) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step20-stack-D-B
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding d) (clear b))
    :effect (and (on d b) (not (holding d)) (clear d) (not (clear b)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step21-unstack-A-J
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on a j) (clear a) (handempty))
    :effect (and (not (on a j)) (holding a) (not (clear a)) (clear j) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step22-stack-A-D
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding a) (clear d))
    :effect (and (on a d) (not (holding a)) (clear a) (not (clear d)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step23-unstack-J-E
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on j e) (clear j) (handempty))
    :effect (and (not (on j e)) (holding j) (not (clear j)) (clear e) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step24-stack-J-K
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding j) (clear k))
    :effect (and (on j k) (not (holding j)) (clear j) (not (clear k)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step25-unstack-A-D
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on a d) (clear a) (handempty))
    :effect (and (not (on a d)) (holding a) (not (clear a)) (clear d) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step26-stack-A-J
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding a) (clear j))
    :effect (and (on a j) (not (holding a)) (clear a) (not (clear j)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step27-unstack-H-F
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on h f) (clear h) (handempty))
    :effect (and (not (on h f)) (holding h) (not (clear h)) (clear f) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step28-stack-H-F
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding h) (clear f))
    :effect (and (on h f) (not (holding h)) (clear h) (not (clear f)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step29-unstack-D-B
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on d b) (clear d) (handempty))
    :effect (and (not (on d b)) (holding d) (not (clear d)) (clear b) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step30-stack-D-E
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding d) (clear e))
    :effect (and (on d e) (not (holding d)) (clear d) (not (clear e)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step31-unstack-H-F
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on h f) (clear h) (handempty))
    :effect (and (not (on h f)) (holding h) (not (clear h)) (clear f) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step32-stack-H-D
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding h) (clear d))
    :effect (and (on h d) (not (holding h)) (clear h) (not (clear d)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step33-unstack-B-I
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on b i) (clear b) (handempty))
    :effect (and (not (on b i)) (holding b) (not (clear b)) (clear i) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step34-stack-B-H
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding b) (clear h))
    :effect (and (on b h) (not (holding b)) (clear b) (not (clear h)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step35-unstack-A-J
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on a j) (clear a) (handempty))
    :effect (and (not (on a j)) (holding a) (not (clear a)) (clear j) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step36-stack-A-I
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding a) (clear i))
    :effect (and (on a i) (not (holding a)) (clear a) (not (clear i)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step37-unstack-B-H
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on b h) (clear b) (handempty))
    :effect (and (not (on b h)) (holding b) (not (clear b)) (clear h) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step38-stack-B-H
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding b) (clear h))
    :effect (and (on b h) (not (holding b)) (clear b) (not (clear h)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )

  (:action step39-unstack-B-H
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_alpha) (on b h) (clear b) (handempty))
    :effect (and (not (on b h)) (holding b) (not (clear b)) (clear h) (not (at-step ?s)) (at-step ?snext) (not (handempty)))
  )

  (:action step40-stack-B-A
    :parameters (?s ?snext - step)
    :precondition (and (at-step ?s) (assigned ?s agent_beta) (holding b) (clear a))
    :effect (and (on b a) (not (holding b)) (clear b) (not (clear a)) (not (at-step ?s)) (at-step ?snext) (handempty))
  )
)