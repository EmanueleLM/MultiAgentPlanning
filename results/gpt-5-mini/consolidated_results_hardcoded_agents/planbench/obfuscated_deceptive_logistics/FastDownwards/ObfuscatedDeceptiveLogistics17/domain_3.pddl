(define (domain obfuscated-deceptive-logistics-17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    stage
    texture - obj
    spring - texture
    hand - obj
    cat - obj
    sneeze - obj
    stupendous - obj
  )

  (:predicates
    (vase ?h - hand ?c - cat)
    (next ?o - obj ?t - texture)
    (collect ?t - texture ?st - stupendous)
    (succ ?s - stage ?s2 - stage)
    (current_stage ?s - stage)
  )

  ;; Each action consumes the current stage and advances to its successor.
  ;; This enforces a strict ordered progression of steps and prevents
  ;; oscillating state changes because every operator moves the global
  ;; current_stage forward to the next stage.

  (:action paltry
    :parameters (?h - hand ?c - cat ?t - texture ?s - stage ?s2 - stage)
    :precondition (and
      (vase ?h ?c)
      (next ?c ?t)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action sip
    :parameters (?h - hand ?c - cat ?t - texture ?s - stage ?s2 - stage)
    :precondition (and
      (next ?h ?t)
      (next ?c ?t)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action clip
    :parameters (?h - hand ?sneeze - sneeze ?t - texture ?s - stage ?s2 - stage)
    :precondition (and
      (next ?sneeze ?t)
      (next ?h ?t)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sneeze)
      (not (next ?h ?t))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action wretched
    :parameters (?sneeze - sneeze ?t1 - texture ?t2 - texture ?st - stupendous ?stage - stage ?stage2 - stage)
    :precondition (and
      (next ?sneeze ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      (current_stage ?stage)
      (succ ?stage ?stage2)
    )
    :effect (and
      (next ?sneeze ?t2)
      (not (next ?sneeze ?t1))
      (not (current_stage ?stage))
      (current_stage ?stage2)
    )
  )

  (:action memory
    :parameters (?c - cat ?sp1 - spring ?sp2 - spring ?s - stage ?s2 - stage)
    :precondition (and
      (next ?c ?sp1)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )

  (:action tightfisted
    :parameters (?h - hand ?sneeze - sneeze ?t - texture ?s - stage ?s2 - stage)
    :precondition (and
      (next ?sneeze ?t)
      (vase ?h ?sneeze)
      (current_stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sneeze))
      (not (current_stage ?s))
      (current_stage ?s2)
    )
  )
)