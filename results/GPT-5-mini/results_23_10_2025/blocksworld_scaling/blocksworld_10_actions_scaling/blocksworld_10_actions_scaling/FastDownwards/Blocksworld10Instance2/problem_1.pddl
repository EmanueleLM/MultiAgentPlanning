(define (problem Blocksworld10Instance2-problem)
  (:domain blocksworld)
  (:objects A B C D E F - block)

  (:init
    ;; initial on relationships: E on B on C on A on F
    (on E B)
    (on B C)
    (on C A)
    (on A F)
    ;; table bases
    (ontable F)
    (ontable D)
    ;; clear: tops of stacks
    (clear E)
    (clear D)
    ;; hand state
    (handempty)
  )

  ;; Goal encodes the final arrangement deduced from the action sequence.
  (:goal (and
    (on D B)
    (on B C)
    (on C A)
    (on A F)
    (ontable F)
    (ontable E)
  ))
)