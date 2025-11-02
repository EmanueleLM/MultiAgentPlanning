(define (problem Hanoi2Agents10DisksInstance21)
  (:domain hanoi-2agents-10)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 - agent
  )

  (:init
    ;; initial stack on left: top->bottom = a, b, c, d, e, f, g, h, i, j
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ;; clear disks (no disk on top): only top disk a initially
    (clear a)

    ;; peg emptiness
    (empty middle)
    (empty right)

    ;; can-place: any disk may be placed on any peg
    (can-place a left)   (can-place a middle)   (can-place a right)
    (can-place b left)   (can-place b middle)   (can-place b right)
    (can-place c left)   (can-place c middle)   (can-place c right)
    (can-place d left)   (can-place d middle)   (can-place d right)
    (can-place e left)   (can-place e middle)   (can-place e right)
    (can-place f left)   (can-place f middle)   (can-place f right)
    (can-place g left)   (can-place g middle)   (can-place g right)
    (can-place h left)   (can-place h middle)   (can-place h right)
    (can-place i left)   (can-place i middle)   (can-place i right)
    (can-place j left)   (can-place j middle)   (can-place j right)

    ;; can-place by disk size: smaller on larger (A smallest .. J largest)
    ;; a can be placed on b..j
    (can-place a b) (can-place a c) (can-place a d) (can-place a e) (can-place a f) (can-place a g) (can-place a h) (can-place a i) (can-place a j)
    ;; b on c..j
    (can-place b c) (can-place b d) (can-place b e) (can-place b f) (can-place b g) (can-place b h) (can-place b i) (can-place b j)
    ;; c on d..j
    (can-place c d) (can-place c e) (can-place c f) (can-place c g) (can-place c h) (can-place c i) (can-place c j)
    ;; d on e..j
    (can-place d e) (can-place d f) (can-place d g) (can-place d h) (can-place d i) (can-place d j)
    ;; e on f..j
    (can-place e f) (can-place e g) (can-place e h) (can-place e i) (can-place e j)
    ;; f on g..j
    (can-place f g) (can-place f h) (can-place f i) (can-place f j)
    ;; g on h..j
    (can-place g h) (can-place g i) (can-place g j)
    ;; h on i..j
    (can-place h i) (can-place h j)
    ;; i on j
    (can-place i j)

    ;; agent permissions
    (allowed agent_1 a) (allowed agent_1 b) (allowed agent_1 c) (allowed agent_1 d) (allowed agent_1 e)
    (allowed agent_2 f) (allowed agent_2 g) (allowed agent_2 h) (allowed agent_2 i) (allowed agent_2 j)
  )

  (:goal (and
    ;; desired left peg stack top->bottom = c, e, f, g, h, i, j
    (on c e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ;; middle peg top->bottom = a, b
    (on a b)
    (on b middle)

    ;; right peg top->bottom = d
    (on d right)

    ;; tops must be clear
    (clear c)
    (clear a)
    (clear d)
  ))
)