(define (problem Blocksworld10Instance15-final)
  (:domain blocks-world-multiagent)
  (:objects A B C D E F G H - block)

  (:init
    ;; Initial arrangement
    (ontable A)
    (on B A)

    (on C H)
    (on H G)
    (on G F)
    (ontable F)

    (on D E)
    (ontable E)

    ;; Clear blocks (top of their stacks)
    (clear B)
    (clear C)
    (clear D)

    ;; Hand status
    (handempty)
  )

  (:goal (and
    ;; Final arrangement after applying the given action sequence
    (ontable A)
    (on B A)
    (on D B)
    (on C D)
    (ontable E)
    (ontable F)
    (on G F)
    (on H G)
  ))
)