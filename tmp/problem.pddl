(define (problem dual-agent-block-world-task)
  (:domain dual-agent-block-world)

  (:objects
    I Q W E A R - block
  )

  (:init
    (on-table I) (clear I) (vowel I)
    (on-table Q) (clear Q) (consonant Q)
    (on-table W) (clear W) (consonant W)
    (on-table E) (clear E) (vowel E)
    (on-table A) (clear A) (vowel A)
    (on-table R) (clear R) (consonant R)
    (hand-empty-a)
    (hand-empty-b)
  )

  (:goal (and
            (on-table R)
            (clear R)
            (on-table I)
            (on E I)
            (clear E)
            (on-table W)
            (on W Q)
            (clear Q)
            (on-table A)
            (clear A)
  ))
)