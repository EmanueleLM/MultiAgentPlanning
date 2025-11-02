(define (domain blocks-world-order-constrained)
  (:requirements :strips :typing)
  (:types block step)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (step-done ?s - step)
    (next ?s - step ?snext - step)
    (allowed-unstack ?s - step ?x - block ?y - block)
    (allowed-stack ?s - step ?x - block ?y - block)
    (allowed-pickup ?s - step ?x - block)
    (allowed-putdown ?s - step ?x - block)
  )

  ;; Unstack a block ?x from block ?y at a particular step (advances to next step)
  (:action unstack
    :parameters (?x - block ?y - block ?s - step ?snext - step)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (step-done ?s)
      (next ?s ?snext)
      (allowed-unstack ?s ?x ?y)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (holding ?x)
      (not (handempty))
      (not (clear ?x))
      (step-done ?snext)
    )
  )

  ;; Stack a held block ?x onto block ?y at a particular step
  (:action stack
    :parameters (?x - block ?y - block ?s - step ?snext - step)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (step-done ?s)
      (next ?s ?snext)
      (allowed-stack ?s ?x ?y)
    )
    :effect (and
      (not (holding ?x))
      (not (clear ?y))
      (clear ?x)
      (on ?x ?y)
      (handempty)
      (step-done ?snext)
    )
  )

  ;; Pickup a clear block ?x from the table at a particular step
  (:action pickup
    :parameters (?x - block ?s - step ?snext - step)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (step-done ?s)
      (next ?s ?snext)
      (allowed-pickup ?s ?x)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (holding ?x)
      (not (handempty))
      (step-done ?snext)
    )
  )

  ;; Put down a held block ?x onto the table at a particular step
  (:action putdown
    :parameters (?x - block ?s - step ?snext - step)
    :precondition (and
      (holding ?x)
      (step-done ?s)
      (next ?s ?snext)
      (allowed-putdown ?s ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding ?x))
      (handempty)
      (step-done ?snext)
    )
  )
)