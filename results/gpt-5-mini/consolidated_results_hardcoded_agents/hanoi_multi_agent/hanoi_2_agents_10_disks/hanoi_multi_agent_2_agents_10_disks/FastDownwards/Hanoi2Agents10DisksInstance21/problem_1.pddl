(define (problem Hanoi2Agents10DisksInstance21)
  (:domain hanoi-2agents-10)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 - agent
  )

  (:init
    ;; Initial direct-support relations (top->bottom: A,B,C,D,E,F,G,H,I,J on left)
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

    ;; Initially the only top disk on the left is a; middle and right are empty (clear)
    (clear a)
    (clear middle)
    (clear right)

    ;; can-place relations: any disk may be placed onto any peg
    (can-place a left)   (can-place b left)   (can-place c left)   (can-place d left)   (can-place e left)
    (can-place f left)   (can-place g left)   (can-place h left)   (can-place i left)   (can-place j left)
    (can-place a middle) (can-place b middle) (can-place c middle) (can-place d middle) (can-place e middle)
    (can-place f middle) (can-place g middle) (can-place h middle) (can-place i middle) (can-place j middle)
    (can-place a right)  (can-place b right)  (can-place c right)  (can-place d right)  (can-place e right)
    (can-place f right)  (can-place g right)  (can-place h right)  (can-place i right)  (can-place j right)

    ;; can-place between disks: smaller disk may be placed onto any larger disk
    ;; A < B < C < D < E < F < G < H < I < J
    (can-place a b) (can-place a c) (can-place a d) (can-place a e) (can-place a f) (can-place a g) (can-place a h) (can-place a i) (can-place a j)
    (can-place b c) (can-place b d) (can-place b e) (can-place b f) (can-place b g) (can-place b h) (can-place b i) (can-place b j)
    (can-place c d) (can-place c e) (can-place c f) (can-place c g) (can-place c h) (can-place c i) (can-place c j)
    (can-place d e) (can-place d f) (can-place d g) (can-place d h) (can-place d i) (can-place d j)
    (can-place e f) (can-place e g) (can-place e h) (can-place e i) (can-place e j)
    (can-place f g) (can-place f h) (can-place f i) (can-place f j)
    (can-place g h) (can-place g i) (can-place g j)
    (can-place h i) (can-place h j)
    (can-place i j)

    ;; Agent move permissions
    (allowed agent_1 a) (allowed agent_1 b) (allowed agent_1 c) (allowed agent_1 d) (allowed agent_1 e)
    (allowed agent_2 f) (allowed agent_2 g) (allowed agent_2 h) (allowed agent_2 i) (allowed agent_2 j)
  )

  ;; Goal: left peg top->bottom = C,E,F,G,H,I,J ; middle top->bottom = A,B ; right top->bottom = D
  ;; We encode direct-support relations matching that final configuration.
  (:goal (and
    ;; left stack: top c on left, e on c, f on e, g on f, h on g, i on h, j on i
    (on c left)
    (on e c)
    (on f e)
    (on g f)
    (on h g)
    (on i h)
    (on j i)

    ;; middle stack: top a on middle, b on a
    (on a middle)
    (on b a)

    ;; right stack: d on right
    (on d right)

    ;; ensure those top disks are clear (top of each peg)
    (clear c)   ;; top of left
    (clear a)   ;; top of middle
    (clear d)   ;; top of right
  ))
)