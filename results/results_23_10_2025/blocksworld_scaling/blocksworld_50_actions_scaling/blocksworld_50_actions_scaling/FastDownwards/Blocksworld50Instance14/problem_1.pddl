(define (problem blocksworld-instance-Blocksworld50Instance14)
  (:domain blocks-world)
  (:objects
    A B C D E F G H I J K L M N - block
  )
  (:init
    ;; initial stacks (bottom -> top)
    (ontable E)
    (on G E)
    (on D G)
    (on J D)
    (on B J)
    (on A B)

    (ontable F)
    (on M F)

    (ontable L)
    (on H L)
    (on K H)

    (ontable N)
    (on I N)
    (on C I)

    ;; clear: top blocks of each initial stack
    (clear A)
    (clear M)
    (clear K)
    (clear C)

    ;; robot hand initially empty
    (handempty)
  )

  ;; Goal corresponds to the final arrangement derived from the action trace
  (:goal (and
    ;; Stack: K -> J -> M -> I -> B
    (ontable K)
    (on J K)
    (on M J)
    (on I M)
    (on B I)

    ;; Stack: L -> H -> A -> C
    (ontable L)
    (on H L)
    (on A H)
    (on C A)

    ;; Stack: E -> G -> D -> F -> N
    (ontable E)
    (on G E)
    (on D G)
    (on F D)
    (on N F)
  ))
)