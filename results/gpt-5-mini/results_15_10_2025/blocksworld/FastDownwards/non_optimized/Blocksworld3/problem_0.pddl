(define (problem multi_agent_block_task)
  (:domain multi_agent_blocks)
  (:objects A B C D E - block)

  (:init
    ;; static classifications: which agent may manipulate which blocks
    (vowel A)
    (vowel E)
    (consonant B)
    (consonant C)
    (consonant D)

    ;; initial placement (public)
    (ontable A)
    (on B C)
    (on C D)
    (on D E)
    (ontable E)

    ;; clear/top facts
    (clear A)
    (clear B)
    ;; C, D, E are not clear initially because they have blocks on them (B on C, C on D, D on E)

    ;; vowel agent state
    (handempty-vowel)
  )

  (:goal
    (and
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (ontable E)
    )
  )
)