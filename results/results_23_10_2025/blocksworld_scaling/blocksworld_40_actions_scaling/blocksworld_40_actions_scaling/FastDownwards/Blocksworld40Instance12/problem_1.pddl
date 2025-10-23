(define (problem blocks-final-instance)
  (:domain blocks-world)
  (:objects A B C D E F G H I J K L - block)

  ;; Initial state: as given in the specification
  (:init
    ;; stacks:
    (ontable A)
    (on F A)
    (on D F)

    (ontable I)
    (on C I)
    (on J C)

    (ontable K)
    (on H K)
    (on G H)
    (on E G)

    (ontable L)
    (on B L)

    ;; clear (tops of stacks initially)
    (clear D)
    (clear J)
    (clear E)
    (clear B)

    ;; agent's hand is empty at start
    (handempty)
  )

  ;; Goal encodes the final arrangement derived from executing the 40-step sequence.
  ;; Note: the stated sequence was simulated strictly and produced the configuration below.
  ;; No agent reports conflicted; this problem assumes the action sequence is executed
  ;; in the given order and verifies reachability of this final arrangement.
  (:goal (and
    ;; final "on" relations
    (on F A)
    (on D E)
    (on E G)
    (on G H)
    (on H K)
    (on I J)

    ;; final "ontable" relations
    (ontable A)
    (ontable K)
    (ontable C)
    (ontable B)
    (ontable J)
    (ontable L)
  ))
)