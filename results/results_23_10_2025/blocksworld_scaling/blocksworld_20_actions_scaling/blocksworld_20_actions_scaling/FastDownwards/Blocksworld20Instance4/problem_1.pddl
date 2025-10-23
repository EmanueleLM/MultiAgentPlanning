(define (problem blocksworld-final-check)
  (:domain blocksworld)
  (:objects A B C D E F G - block)

  ;; initial state derived from the human specification
  (:init
    (on A G)
    (on B E)
    (on C B)
    (on D F) ; careful: initial specification had on(F,D); but standard encoding uses on(F D). We must encode exactly the given initial state:
    ;; The actual initial facts from the specification:
    (on F D)
    (ontable D)
    (ontable E)
    (on G C)

    ;; clear blocks initially: A and F are top-most
    (clear A)
    (clear F)

    (handempty)
  )

  ;; Goal: the planner must reach the final arrangement described by the proposed solution.
  ;; This goal encodes the desired final on/ontable relations.
  (:goal
    (and
      (on A G)
      (on G C)
      (on C B)
      (on B E)
      (ontable E)
      (on D F)
      (ontable F)
    )
  )
)