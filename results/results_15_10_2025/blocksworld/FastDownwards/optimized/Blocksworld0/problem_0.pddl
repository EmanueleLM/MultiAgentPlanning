(define (problem multiblocks-instance)
  (:domain multi_agent_blocks)
  (:objects
    a b c d e f g h i j - block
  )

  ;; Initial state: stacks:
  ;; Stack1: A on table
  ;; Stack2: B on table
  ;; Stack3: C on D on E on F on G on H on I on J with J on table
  (:init
    ;; classification by agent capability (hard constraints)
    (vowel a) (vowel e) (vowel i)
    (consonant b) (consonant c) (consonant d) (consonant f) (consonant g) (consonant h) (consonant j)

    ;; stack3 links (top to bottom): c on d on e on f on g on h on i on j ontable
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (ontable j)

    ;; other stacks
    (ontable a)
    (ontable b)

    ;; clear(top) facts: only top blocks are clear initially
    (clear a)
    (clear b)
    (clear c)

    ;; hands empty for both agents initially (each agent can hold at most one block)
    (handempty-vowel)
    (handempty-consonant)
  )

  ;; Global goal: A on B on C on D on E on F on G on H on I on J on table.
  (:goal (and
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
  ))
)