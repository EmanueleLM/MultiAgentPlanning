(define (problem hanoi2agents20disksinstance12)
  (:domain hanoi20-agents)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    a b c d e f g h i j k l m n o p q r s t - disk
  )
  (:init
    ; agent-specific permissions
    (can-move agent_1 a)
    (can-move agent_1 b)
    (can-move agent_1 c)
    (can-move agent_1 d)
    (can-move agent_1 e)
    (can-move agent_1 f)
    (can-move agent_1 g)
    (can-move agent_1 h)
    (can-move agent_1 i)
    (can-move agent_1 j)

    (can-move agent_2 k)
    (can-move agent_2 l)
    (can-move agent_2 m)
    (can-move agent_2 n)
    (can-move agent_2 o)
    (can-move agent_2 p)
    (can-move agent_2 q)
    (can-move agent_2 r)
    (can-move agent_2 s)
    (can-move agent_2 t)

    ; legal stacking relations (disk on peg or larger disk)
    (can-stack a left) (can-stack a middle) (can-stack a right)
    (can-stack a b) (can-stack a c) (can-stack a d) (can-stack a e) (can-stack a f)
    (can-stack a g) (can-stack a h) (can-stack a i) (can-stack a j) (can-stack a k)
    (can-stack a l) (can-stack a m) (can-stack a n) (can-stack a o) (can-stack a p)
    (can-stack a q) (can-stack a r) (can-stack a s) (can-stack a t)

    (can-stack b left) (can-stack b middle) (can-stack b right)
    (can-stack b c) (can-stack b d) (can-stack b e) (can-stack b f)
    (can-stack b g) (can-stack b h) (can-stack b i) (can-stack b j) (can-stack b k)
    (can-stack b l) (can-stack b m) (can-stack b n) (can-stack b o) (can-stack b p)
    (can-stack b q) (can-stack b r) (can-stack b s) (can-stack b t)

    (can-stack c left) (can-stack c middle) (can-stack c right)
    (can-stack c d) (can-stack c e) (can-stack c f) (can-stack c g) (can-stack c h)
    (can-stack c i) (can-stack c j) (can-stack c k) (can-stack c l) (can-stack c m)
    (can-stack c n) (can-stack c o) (can-stack c p) (can-stack c q) (can-stack c r)
    (can-stack c s) (can-stack c t)

    (can-stack d left) (can-stack d middle) (can-stack d right)
    (can-stack d e) (can-stack d f) (can-stack d g) (can-stack d h) (can-stack d i)
    (can-stack d j) (can-stack d k) (can-stack d l) (can-stack d m) (can-stack d n)
    (can-stack d o) (can-stack d p) (can-stack d q) (can-stack d r) (can-stack d s)
    (can-stack d t)

    (can-stack e left) (can-stack e middle) (can-stack e right)
    (can-stack e f) (can-stack e g) (can-stack e h) (can-stack e i) (can-stack e j)
    (can-stack e k) (can-stack e l) (can-stack e m) (can-stack e n) (can-stack e o)
    (can-stack e p) (can-stack e q) (can-stack e r) (can-stack e s) (can-stack e t)

    (can-stack f left) (can-stack f middle) (can-stack f right)
    (can-stack f g) (can-stack f h) (can-stack f i) (can-stack f j) (can-stack f k)
    (can-stack f l) (can-stack f m) (can-stack f n) (can-stack f o) (can-stack f p)
    (can-stack f q) (can-stack f r) (can-stack f s) (can-stack f t)

    (can-stack g left) (can-stack g middle) (can-stack g right)
    (can-stack g h) (can-stack g i) (can-stack g j) (can-stack g k) (can-stack g l)
    (can-stack g m) (can-stack g n) (can-stack g o) (can-stack g p) (can-stack g q)
    (can-stack g r) (can-stack g s) (can-stack g t)

    (can-stack h left) (can-stack h middle) (can-stack h right)
    (can-stack h i) (can-stack h j) (can-stack h k) (can-stack h l) (can-stack h m)
    (can-stack h n) (can-stack h o) (can-stack h p) (can-stack h q) (can-stack h r)
    (can-stack h s) (can-stack h t)

    (can-stack i left) (can-stack i middle) (can-stack i right)
    (can-stack i j) (can-stack i k) (can-stack i l) (can-stack i m) (can-stack i n)
    (can-stack i o) (can-stack i p) (can-stack i q) (can-stack i r) (can-stack i s)
    (can-stack i t)

    (can-stack j left) (can-stack j middle) (can-stack j right)
    (can-stack j k) (can-stack j l) (can-stack j m) (can-stack j n) (can-stack j o)
    (can-stack j p) (can-stack j q) (can-stack j r) (can-stack j s) (can-stack j t)

    (can-stack k left) (can-stack k middle) (can-stack k right)
    (can-stack k l) (can-stack k m) (can-stack k n) (can-stack k o) (can-stack k p)
    (can-stack k q) (can-stack k r) (can-stack k s) (can-stack k t)

    (can-stack l left) (can-stack l middle) (can-stack l right)
    (can-stack l m) (can-stack l n) (can-stack l o) (can-stack l p) (can-stack l q)
    (can-stack l r) (can-stack l s) (can-stack l t)

    (can-stack m left) (can-stack m middle) (can-stack m right)
    (can-stack m n) (can-stack m o) (can-stack m p) (can-stack m q) (can-stack m r)
    (can-stack m s) (can-stack m t)

    (can-stack n left) (can-stack n middle) (can-stack n right)
    (can-stack n o) (can-stack n p) (can-stack n q) (can-stack n r) (can-stack n s)
    (can-stack n t)

    (can-stack o left) (can-stack o middle) (can-stack o right)
    (can-stack o p) (can-stack o q) (can-stack o r) (can-stack o s) (can-stack o t)

    (can-stack p left) (can-stack p middle) (can-stack p right)
    (can-stack p q) (can-stack p r) (can-stack p s) (can-stack p t)

    (can-stack q left) (can-stack q middle) (can-stack q right)
    (can-stack q r) (can-stack q s) (can-stack q t)

    (can-stack r left) (can-stack r middle) (can-stack r right)
    (can-stack r s) (can-stack r t)

    (can-stack s left) (can-stack s middle) (can-stack s right)
    (can-stack s t)

    (can-stack t left) (can-stack t middle) (can-stack t right)

    ; initial tower: A (top) ... T (bottom) on left
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
    (on o p)
    (on p q)
    (on q r)
    (on r s)
    (on s t)
    (on t left)

    (clear a)
    (clear middle)
    (clear right)
  )

  (:goal
    (and
      ; left peg has D..T stacked with T on left
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
      (on o p)
      (on p q)
      (on q r)
      (on r s)
      (on s t)
      (on t left)

      ; middle peg has B only
      (on b middle)
      (clear b)

      ; right peg has A on C (A on top)
      (on c right)
      (on a c)
      (clear a)
    )
  )
)