(define (problem stack-all-with-J-bottom-A-top)
  (:domain blocksworld-agents)

  ;;; Orchestrator assumptions and notes:
  ;;; - The public initial configuration and agents' private restrictions are used exactly as given.
  ;;; - There are 10 blocks: a b c d e f g h i j. Vowel agent may act only on (a e i).
  ;;;   Consonant agent may act only on (b c d f g h j).
  ;;; - Agents operate on a single shared hand (handempty / holding) so actions are strictly sequential.
  ;;; - The domain enforces that only top (clear) blocks may be moved and only one block at a time.
  ;;; - No additional blocks or stacks are assumed beyond the listed blocks; putting a block on the table
  ;;;   creates another ontable stack as necessary (standard blocksworld semantics).
  ;;; - The proposed action sequence (provided separately above) is consistent with this problem instance.
  ;;;

  (:objects
    a b c d e f g h i j - block
  )

  (:init
    ;; initial stacking (three stacks as described):
    (ontable e)
    (on a e)
    (on b a)

    (ontable h)
    (on c h)

    (ontable g)
    (on d g)
    (on i d)
    (on f i)
    (on j f)

    ;; top/clear predicates for top blocks initially: b, c, j are top of their stacks
    (clear b)
    (clear c)
    (clear j)

    ;; all other blocks that have something on them are not clear (omitted since default is false)
    ;; exactly one free hand
    (handempty)

    ;; agent permissions by labeling blocks
    (vowel a)
    (vowel e)
    (vowel i)

    (consonant b)
    (consonant c)
    (consonant d)
    (consonant f)
    (consonant g)
    (consonant h)
    (consonant j)
  )

  (:goal (and
    ;; final tower: A on B on C on D on E on F on G on H on I on J, with J on the table.
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (ontable j)

    ;; require top is clear and hand empty at the end
    (clear a)
    (handempty)
  ))
)