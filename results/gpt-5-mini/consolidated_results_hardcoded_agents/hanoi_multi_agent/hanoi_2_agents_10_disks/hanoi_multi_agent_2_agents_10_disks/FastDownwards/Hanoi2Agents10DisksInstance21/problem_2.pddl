(define (problem Hanoi2Agents10DisksInstance21)
  (:domain hanoi-2agents-10)
  (:objects
    a b c d e f g h i j
    left middle right
    agent_1 agent_2
  )

  (:init
    (on a left)
    (on b a)
    (on c b)
    (on d c)
    (on e d)
    (on f e)
    (on g f)
    (on h g)
    (on i h)
    (on j i)

    (clear a)
    (clear middle)
    (clear right)

    (can-place a left)   (can-place b left)   (can-place c left)   (can-place d left)   (can-place e left)
    (can-place f left)   (can-place g left)   (can-place h left)   (can-place i left)   (can-place j left)
    (can-place a middle) (can-place b middle) (can-place c middle) (can-place d middle) (can-place e middle)
    (can-place f middle) (can-place g middle) (can-place h middle) (can-place i middle) (can-place j middle)
    (can-place a right)  (can-place b right)  (can-place c right)  (can-place d right)  (can-place e right)
    (can-place f right)  (can-place g right)  (can-place h right)  (can-place i right)  (can-place j right)

    (can-place a b) (can-place a c) (can-place a d) (can-place a e) (can-place a f) (can-place a g) (can-place a h) (can-place a i) (can-place a j)
    (can-place b c) (can-place b d) (can-place b e) (can-place b f) (can-place b g) (can-place b h) (can-place b i) (can-place b j)
    (can-place c d) (can-place c e) (can-place c f) (can-place c g) (can-place c h) (can-place c i) (can-place c j)
    (can-place d e) (can-place d f) (can-place d g) (can-place d h) (can-place d i) (can-place d j)
    (can-place e f) (can-place e g) (can-place e h) (can-place e i) (can-place e j)
    (can-place f g) (can-place f h) (can-place f i) (can-place f j)
    (can-place g h) (can-place g i) (can-place g j)
    (can-place h i) (can-place h j)
    (can-place i j)

    (allowed agent_1 a) (allowed agent_1 b) (allowed agent_1 c) (allowed agent_1 d) (allowed agent_1 e)
    (allowed agent_2 f) (allowed agent_2 g) (allowed agent_2 h) (allowed agent_2 i) (allowed agent_2 j)
  )

  (:goal (and
    (on c left)
    (on e c)
    (on f e)
    (on g f)
    (on h g)
    (on i h)
    (on j i)

    (on a middle)
    (on b a)

    (on d right)

    (clear c)
    (clear a)
    (clear d)
  ))
)