(define (domain blocksworld_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:constants
    a b c d e f - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - step
  )

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (curr ?s - step)
  )

  ;; Step 1: unstack(f, b)
  (:action step1-unstack-f-b
    :parameters ()
    :precondition (and (on f b) (clear f) (handempty) (curr s0))
    :effect (and
      (holding f)
      (not (on f b))
      (clear b)
      (not (clear f))
      (not (handempty))
      (not (curr s0))
      (curr s1)
    )
  )

  ;; Step 2: stack(f, d)
  (:action step2-stack-f-d
    :parameters ()
    :precondition (and (holding f) (clear d) (curr s1))
    :effect (and
      (on f d)
      (clear f)
      (not (clear d))
      (not (holding f))
      (handempty)
      (not (curr s1))
      (curr s2)
    )
  )

  ;; Step 3: unstack(b, c)
  (:action step3-unstack-b-c
    :parameters ()
    :precondition (and (on b c) (clear b) (handempty) (curr s2))
    :effect (and
      (holding b)
      (not (on b c))
      (clear c)
      (not (clear b))
      (not (handempty))
      (not (curr s2))
      (curr s3)
    )
  )

  ;; Step 4: stack(b, f)
  (:action step4-stack-b-f
    :parameters ()
    :precondition (and (holding b) (clear f) (curr s3))
    :effect (and
      (on b f)
      (clear b)
      (not (clear f))
      (not (holding b))
      (handempty)
      (not (curr s3))
      (curr s4)
    )
  )

  ;; Step 5: unstack(b, f)
  (:action step5-unstack-b-f
    :parameters ()
    :precondition (and (on b f) (clear b) (handempty) (curr s4))
    :effect (and
      (holding b)
      (not (on b f))
      (clear f)
      (not (clear b))
      (not (handempty))
      (not (curr s4))
      (curr s5)
    )
  )

  ;; Step 6: stack(b, c)
  (:action step6-stack-b-c
    :parameters ()
    :precondition (and (holding b) (clear c) (curr s5))
    :effect (and
      (on b c)
      (clear b)
      (not (clear c))
      (not (holding b))
      (handempty)
      (not (curr s5))
      (curr s6)
    )
  )

  ;; Step 7: unstack(f, d)
  (:action step7-unstack-f-d
    :parameters ()
    :precondition (and (on f d) (clear f) (handempty) (curr s6))
    :effect (and
      (holding f)
      (not (on f d))
      (clear d)
      (not (clear f))
      (not (handempty))
      (not (curr s6))
      (curr s7)
    )
  )

  ;; Step 8: putdown(f)
  (:action step8-putdown-f
    :parameters ()
    :precondition (and (holding f) (curr s7))
    :effect (and
      (ontable f)
      (clear f)
      (not (holding f))
      (handempty)
      (not (curr s7))
      (curr s8)
    )
  )

  ;; Step 9: unstack(d, e)
  (:action step9-unstack-d-e
    :parameters ()
    :precondition (and (on d e) (clear d) (handempty) (curr s8))
    :effect (and
      (holding d)
      (not (on d e))
      (clear e)
      (not (clear d))
      (not (handempty))
      (not (curr s8))
      (curr s9)
    )
  )

  ;; Step 10: stack(d, f)
  (:action step10-stack-d-f
    :parameters ()
    :precondition (and (holding d) (clear f) (curr s9))
    :effect (and
      (on d f)
      (clear d)
      (not (clear f))
      (not (holding d))
      (handempty)
      (not (curr s9))
      (curr s10)
    )
  )
)