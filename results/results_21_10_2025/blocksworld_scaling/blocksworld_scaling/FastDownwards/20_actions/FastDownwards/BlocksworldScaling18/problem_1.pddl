(define (problem BlocksworldScaling18-instance)
  (:domain blocksworld-multiagent)
  (:objects
    k f a d i j b h g c e - block
    vowel_actor - vowel_agent
    consonant_actor - consonant_agent
  )

  (:init
    ;; Two initial stacks:
    ;; Stack1 bottom->top: K (on table), A on K, J on A, B on J, G on B
    (ontable k)
    (on a k)
    (on j a)
    (on b j)
    (on g b)

    ;; Stack2 bottom->top: F (on table), D on F, I on D, H on I, C on H, E on C
    (ontable f)
    (on d f)
    (on i d)
    (on h i)
    (on c h)
    (on e c)

    ;; clear (top blocks)
    (clear g)
    (clear e)

    ;; static classification
    (is-vowel a)
    (is-vowel e)
    (is-vowel i)

    (is-consonant k)
    (is-consonant f)
    (is-consonant d)
    (is-consonant j)
    (is-consonant b)
    (is-consonant h)
    (is-consonant g)
    (is-consonant c)
  )

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
    (on j k)
    (ontable k)
  ))
)