(define (problem Blocksworld50Instance1) 
  (:domain blocksworld)
  (:objects a b c d e f g h i j k - block)
  (:init
    ;; Initial "on" relations (top on lower)
    (on a j)
    (on j e)
    (on e g)
    (on g i)
    (on k b)
    (on c f)
    (on d h)

    ;; Blocks that are directly on the table initially
    (ontable b)
    (ontable f)
    (ontable h)
    (ontable i)

    ;; Initially clear (tops of stacks)
    (clear a)
    (clear k)
    (clear c)
    (clear d)

    ;; No block held at start
    (handempty)
  )

  ;; Goal: final arrangement derived from executing the 50 actions
  (:goal (and
    ;; Stack 1: K on H on E on G on I (I on table)
    (on k h)
    (on h e)
    (on e g)
    (on g i)
    (ontable i)

    ;; Stack 2: B on C on F (F on table)
    (on b c)
    (on c f)
    (ontable f)

    ;; Stack 3: J on A on D (D on table)
    (on j a)
    (on a d)
    (ontable d)

    ;; Ensure no block is being held at the end
    (handempty)
  ))
)