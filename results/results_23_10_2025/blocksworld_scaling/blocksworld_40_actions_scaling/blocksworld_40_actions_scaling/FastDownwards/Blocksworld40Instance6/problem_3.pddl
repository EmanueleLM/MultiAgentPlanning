(define (problem blocks-multiagent-verify-final)
  (:domain blocks-world-multiagent)
  (:objects A B C D E F G H I J K L - block)

  (:init
    ;; initial on/on-table relations (from the provided initial arrangement)
    (on B I)
    (on C B)
    (on D E)
    (on E F)
    (on G D)
    (on H G)
    (on J L)
    (on L K)
    (on-table A)
    (on-table F)
    (on-table I)
    (on-table K)

    ;; initial clear predicates (top blocks in initial state)
    (clear A)
    (clear C)
    (clear H)
    (clear J)

    ;; both agents start with empty hands
    (handempty1)
    (handempty2)
  )

  ;; Goal: do not explicitly list the final arrangement here.
  ;; Instead require the single verification predicate that is achievable only
  ;; when the world matches the deduced final arrangement (enforced by the
  ;; preconditions of verify-final-arrangement).
  (:goal (and (verified)))
)