(define (domain blocksworld_sequence)
  (:requirements :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (curr ?s - step)
  )

  ;; Step 1: unstack(F, B)
  (:action step1-unstack-F-B
    :parameters ()
    :precondition (and (on F B) (clear F) (handempty) (curr s0))
    :effect (and
      (holding F)
      (not (on F B))
      (clear B)
      (not (clear F))
      (not (handempty))
      (not (curr s0))
      (curr s1)
    )
  )

  ;; Step 2: stack(F, D)
  (:action step2-stack-F-D
    :parameters ()
    :precondition (and (holding F) (clear D) (curr s1))
    :effect (and
      (on F D)
      (clear F)
      (not (clear D))
      (not (holding F))
      (handempty)
      (not (curr s1))
      (curr s2)
    )
  )

  ;; Step 3: unstack(B, C)
  (:action step3-unstack-B-C
    :parameters ()
    :precondition (and (on B C) (clear B) (handempty) (curr s2))
    :effect (and
      (holding B)
      (not (on B C))
      (clear C)
      (not (clear B))
      (not (handempty))
      (not (curr s2))
      (curr s3)
    )
  )

  ;; Step 4: stack(B, F)
  (:action step4-stack-B-F
    :parameters ()
    :precondition (and (holding B) (clear F) (curr s3))
    :effect (and
      (on B F)
      (clear B)
      (not (clear F))
      (not (holding B))
      (handempty)
      (not (curr s3))
      (curr s4)
    )
  )

  ;; Step 5: unstack(B, F)
  (:action step5-unstack-B-F
    :parameters ()
    :precondition (and (on B F) (clear B) (handempty) (curr s4))
    :effect (and
      (holding B)
      (not (on B F))
      (clear F)
      (not (clear B))
      (not (handempty))
      (not (curr s4))
      (curr s5)
    )
  )

  ;; Step 6: stack(B, C)
  (:action step6-stack-B-C
    :parameters ()
    :precondition (and (holding B) (clear C) (curr s5))
    :effect (and
      (on B C)
      (clear B)
      (not (clear C))
      (not (holding B))
      (handempty)
      (not (curr s5))
      (curr s6)
    )
  )

  ;; Step 7: unstack(F, D)
  (:action step7-unstack-F-D
    :parameters ()
    :precondition (and (on F D) (clear F) (handempty) (curr s6))
    :effect (and
      (holding F)
      (not (on F D))
      (clear D)
      (not (clear F))
      (not (handempty))
      (not (curr s6))
      (curr s7)
    )
  )

  ;; Step 8: putdown(F)
  (:action step8-putdown-F
    :parameters ()
    :precondition (and (holding F) (curr s7))
    :effect (and
      (ontable F)
      (clear F)
      (not (holding F))
      (handempty)
      (not (curr s7))
      (curr s8)
    )
  )

  ;; Step 9: unstack(D, E)
  (:action step9-unstack-D-E
    :parameters ()
    :precondition (and (on D E) (clear D) (handempty) (curr s8))
    :effect (and
      (holding D)
      (not (on D E))
      (clear E)
      (not (clear D))
      (not (handempty))
      (not (curr s8))
      (curr s9)
    )
  )

  ;; Step 10: stack(D, F)
  (:action step10-stack-D-F
    :parameters ()
    :precondition (and (holding D) (clear F) (curr s9))
    :effect (and
      (on D F)
      (clear D)
      (not (clear F))
      (not (holding D))
      (handempty)
      (not (curr s9))
      (curr s10)
    )
  )
)