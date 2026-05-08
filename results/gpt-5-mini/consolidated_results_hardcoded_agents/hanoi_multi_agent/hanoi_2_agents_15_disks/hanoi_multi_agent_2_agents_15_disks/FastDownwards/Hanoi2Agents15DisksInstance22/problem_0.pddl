(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s_done - step
  )

  (:init
    ;; Initial tower on left from top to bottom: a, b, c, d, e, f, g, h, i, j, k, l, m, n, o
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
    (on n o)
    (on o left)

    ;; Pegs middle and right are empty -> clear true for them; left initially not clear.
    (clear middle)
    (clear right)

    ;; Only the top disk is clear
    (clear a)

    ;; Agent movement capabilities (hard constraints)
    (can-move-agent1 a) (can-move-agent1 b) (can-move-agent1 c) (can-move-agent1 d)
    (can-move-agent1 e) (can-move-agent1 f) (can-move-agent1 g) (can-move-agent1 h)

    (can-move-agent2 i) (can-move-agent2 j) (can-move-agent2 k) (can-move-agent2 l)
    (can-move-agent2 m) (can-move-agent2 n) (can-move-agent2 o)

    ;; Size order: smaller relations (a is smallest, o is largest).
    ;; a < b..o
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g)
    (smaller a h) (smaller a i) (smaller a j) (smaller a k) (smaller a l) (smaller a m)
    (smaller a n) (smaller a o)
    ;; b < c..o
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h)
    (smaller b i) (smaller b j) (smaller b k) (smaller b l) (smaller b m) (smaller b n)
    (smaller b o)
    ;; c < d..o
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i)
    (smaller c j) (smaller c k) (smaller c l) (smaller c m) (smaller c n) (smaller c o)
    ;; d < e..o
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller d k) (smaller d l) (smaller d m) (smaller d n) (smaller d o)
    ;; e < f..o
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j) (smaller e k)
    (smaller e l) (smaller e m) (smaller e n) (smaller e o)
    ;; f < g..o
    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k) (smaller f l)
    (smaller f m) (smaller f n) (smaller f o)
    ;; g < h..o
    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l) (smaller g m)
    (smaller g n) (smaller g o)
    ;; h < i..o
    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m) (smaller h n)
    (smaller h o)
    ;; i < j..o
    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n) (smaller i o)
    ;; j < k..o
    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o)
    ;; k < l..o
    (smaller k l) (smaller k m) (smaller k n) (smaller k o)
    ;; l < m..o
    (smaller l m) (smaller l n) (smaller l o)
    ;; m < n,o
    (smaller m n) (smaller m o)
    ;; n < o
    (smaller n o)

    ;; Required ordered moves provided by agent_1 (must be executed in sequence).
    ;; These correspond exactly to the agent_1 move list supplied:
    ;; 1: move disk a from left to right
    ;; 2: move disk b from left to middle
    ;; 3: move disk a from right to middle
    ;; 4: move disk c from left to right
    ;; 5: move disk a from middle to right
    ;; 6: move disk b from middle to left
    ;; 7: move disk a from right to left
    (required-order s1 a left right)
    (required-order s2 b left middle)
    (required-order s3 a right middle)
    (required-order s4 c left right)
    (required-order s5 a middle right)
    (required-order s6 b middle left)
    (required-order s7 a right left)

    ;; step sequencing relation
    (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s_done)

    ;; start at the first step
    (current-step s1)
  )

  (:goal (and
    ;; Goal tower configuration:
    ;; left peg from top to bottom: a, b, d, e, f, g, h, i, j, k, l, m, n, o
    (on a b)
    (on b d)
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
    (on n o)
    (on o left)

    ;; right peg has disk c alone on top
    (on c right)

    ;; The required move sequence must have been completed (enforced by reaching final step).
    (current-step s_done)
  ))
)