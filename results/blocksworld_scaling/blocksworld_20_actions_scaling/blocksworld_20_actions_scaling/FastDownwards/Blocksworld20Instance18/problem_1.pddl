(define (problem Blocksworld20Instance18) 
  (:domain blocksworld)
  (:objects
    A B C D E F G H - block
    h1 h2 - hand
  )
  (:init
    ;; initial stacks bottom-to-top: [E, A, G], [H, B, C], [F, D]
    (ontable E)
    (on A E)
    (on G A)
    (clear G)

    (ontable H)
    (on B H)
    (on C B)
    (clear C)

    (ontable F)
    (on D F)
    (clear D)

    ;; two available hands
    (handfree h1)
    (handfree h2)
  )
  (:goal (and
    ;; final stacks bottom-to-top: [E, A, G, B, C] and [H, D, F]
    (ontable E)
    (on A E)
    (on G A)
    (on B G)
    (on C B)
    (clear C)

    (ontable H)
    (on D H)
    (on F D)
    (clear F)
  ))
)