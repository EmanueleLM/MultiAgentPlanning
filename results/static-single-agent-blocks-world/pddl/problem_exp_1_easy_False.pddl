(define (problem blocks-problem)
  (:domain blocks)

  (:objects
      E A C B D - block
  )

  (:init
      ;;  -- the initial arrangement ------------------------------------
      (ontable E)               ; E is on the table
      (on A E)                  ; A is on top of E
      (on C A)                  ; C is on top of A
      (clear C)                 ; C has nothing on top
      (ontable D)               ; D is on the table
      (on B D)                  ; B is on top of D
      (clear B)                 ; B has nothing on top

      ;;  -- automatically true for other blocks (they are not clear/ontable) --
      ;;    (clear E), (ontable A), (ontable C), (clear D), (ontable B)
      ;;    are *not* in the initial state because they are occupied.
  )

  (:goal
      (and
          (ontable E)
          (on C E)
          (clear C)

          (ontable B)
          (on D B)
          (clear D)

          (ontable A)
          (clear A)
      )
  )
)