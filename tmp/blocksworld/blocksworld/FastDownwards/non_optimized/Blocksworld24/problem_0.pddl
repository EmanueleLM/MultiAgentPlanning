(define (problem multi_agent_block_task)
  (:domain multi_agent_blocks)
  (:objects a b c d e f g h i j k l m n)
  (:init
    ;; Table bottoms / stacks (unified lowercase objects)
    ;; Stack1 bottom-to-top: b k f m l i
    (ontable b)
    (on k b)
    (on f k)
    (on m f)
    (on l m)
    (on i l)

    ;; Stack2 bottom-to-top: g n d a
    (ontable g)
    (on n g)
    (on d n)
    (on a d)

    ;; Stack3 bottom-to-top: e c h
    (ontable e)
    (on c e)
    (on h c)

    ;; Stack4: j (alone on table)
    (ontable j)

    ;; clear/top blocks (from the inputs)
    (clear i)
    (clear a)
    (clear h)
    (clear j)

    ;; Agent hand states (separate for vowel and consonant agents)
    (handempty-vowel)
    (handempty-consonant)

    ;; Vowel/consonant classifications (preserve each agent's markings)
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
    (consonant k)
    (consonant l)
    (consonant m)
    (consonant n)
  )

  ;; Global goal: final stacked configuration from top to bottom:
  ;; A B C D E F G H I J K L M N  (A on B, B on C, ..., M on N, N on table)
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
    (on k l)
    (on l m)
    (on m n)
    (ontable n)
  ))
)