(define (problem hanoi_agents_problem)
  (:domain hanoi_agents)

  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
  )

  (:init
    ;; initial tower on left: top-to-bottom a b c d e f g h i j
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

    ;; clears: only the top disk a and empty pegs middle and right are clear
    (clear a)
    (clear middle)
    (clear right)

    ;; Agent capability facts (strict constraints)
    (can-move-agent1 a)
    (can-move-agent1 b)
    (can-move-agent1 c)
    (can-move-agent1 d)

    (can-move-agent2 e)
    (can-move-agent2 f)
    (can-move-agent2 g)

    (can-move-agent3 h)
    (can-move-agent3 i)
    (can-move-agent3 j)

    ;; can-place facts: a disk may be placed on any peg
    (can-place a left)  (can-place a middle)  (can-place a right)
    (can-place b left)  (can-place b middle)  (can-place b right)
    (can-place c left)  (can-place c middle)  (can-place c right)
    (can-place d left)  (can-place d middle)  (can-place d right)
    (can-place e left)  (can-place e middle)  (can-place e right)
    (can-place f left)  (can-place f middle)  (can-place f right)
    (can-place g left)  (can-place g middle)  (can-place g right)
    (can-place h left)  (can-place h middle)  (can-place h right)
    (can-place i left)  (can-place i middle)  (can-place i right)
    (can-place j left)  (can-place j middle)  (can-place j right)

    ;; can-place facts: disks may be placed on any strictly larger disk
    ;; a is smaller than b..j
    (can-place a b) (can-place a c) (can-place a d) (can-place a e) (can-place a f)
    (can-place a g) (can-place a h) (can-place a i) (can-place a j)
    ;; b is smaller than c..j
    (can-place b c) (can-place b d) (can-place b e) (can-place b f)
    (can-place b g) (can-place b h) (can-place b i) (can-place b j)
    ;; c < d..j
    (can-place c d) (can-place c e) (can-place c f) (can-place c g)
    (can-place c h) (can-place c i) (can-place c j)
    ;; d < e..j
    (can-place d e) (can-place d f) (can-place d g) (can-place d h)
    (can-place d i) (can-place d j)
    ;; e < f..j
    (can-place e f) (can-place e g) (can-place e h) (can-place e i) (can-place e j)
    ;; f < g..j
    (can-place f g) (can-place f h) (can-place f i) (can-place f j)
    ;; g < h..j
    (can-place g h) (can-place g i) (can-place g j)
    ;; h < i j
    (can-place h i) (can-place h j)
    ;; i < j
    (can-place i j)
  )

  (:goal (and
    ;; left peg: top-to-bottom a c e f g h i j
    (on a c)
    (on c e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ;; middle peg: top-to-bottom b d
    (on b d)
    (on d middle)

    ;; right peg empty is implied by absence of on ? right in goal;
    ;; no explicit predicate necessary
  ))
)