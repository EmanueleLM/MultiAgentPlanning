(define (problem hanoi3agents20disksinstance11)
  (:domain hanoi-3agents-20)
  (:objects
    left middle right - peg
    a b c d e f g h i j k l m n o p q r s t - disk
  )

  (:init
    ; initial direct-support relations (top->bottom chain on left)
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

    ; clear facts: only top disk a is clear and empty pegs middle/right are clear
    (clear a)
    (clear middle)
    (clear right)

    ; agent movement permissions (private capabilities made public for planner)
    (can_move_agent1 a) (can_move_agent1 b) (can_move_agent1 c) (can_move_agent1 d)
    (can_move_agent1 e) (can_move_agent1 f) (can_move_agent1 g)

    (can_move_agent2 h) (can_move_agent2 i) (can_move_agent2 j) (can_move_agent2 k)
    (can_move_agent2 l) (can_move_agent2 m) (can_move_agent2 n)

    (can_move_agent3 o) (can_move_agent3 p) (can_move_agent3 q) (can_move_agent3 r)
    (can_move_agent3 s) (can_move_agent3 t)

    ; Legal stacking onto pegs (any disk may be placed onto any peg)
    (can_stack a left) (can_stack a middle) (can_stack a right)
    (can_stack b left) (can_stack b middle) (can_stack b right)
    (can_stack c left) (can_stack c middle) (can_stack c right)
    (can_stack d left) (can_stack d middle) (can_stack d right)
    (can_stack e left) (can_stack e middle) (can_stack e right)
    (can_stack f left) (can_stack f middle) (can_stack f right)
    (can_stack g left) (can_stack g middle) (can_stack g right)
    (can_stack h left) (can_stack h middle) (can_stack h right)
    (can_stack i left) (can_stack i middle) (can_stack i right)
    (can_stack j left) (can_stack j middle) (can_stack j right)
    (can_stack k left) (can_stack k middle) (can_stack k right)
    (can_stack l left) (can_stack l middle) (can_stack l right)
    (can_stack m left) (can_stack m middle) (can_stack m right)
    (can_stack n left) (can_stack n middle) (can_stack n right)
    (can_stack o left) (can_stack o middle) (can_stack o right)
    (can_stack p left) (can_stack p middle) (can_stack p right)
    (can_stack q left) (can_stack q middle) (can_stack q right)
    (can_stack r left) (can_stack r middle) (can_stack r right)
    (can_stack s left) (can_stack s middle) (can_stack s right)
    (can_stack t left) (can_stack t middle) (can_stack t right)

    ; Legal stacking disk-on-disk where smaller disk may be placed on any larger disk
    ; a can be placed on any of b..t
    (can_stack a b) (can_stack a c) (can_stack a d) (can_stack a e) (can_stack a f)
    (can_stack a g) (can_stack a h) (can_stack a i) (can_stack a j) (can_stack a k)
    (can_stack a l) (can_stack a m) (can_stack a n) (can_stack a o) (can_stack a p)
    (can_stack a q) (can_stack a r) (can_stack a s) (can_stack a t)

    ; b can be placed on c..t
    (can_stack b c) (can_stack b d) (can_stack b e) (can_stack b f)
    (can_stack b g) (can_stack b h) (can_stack b i) (can_stack b j) (can_stack b k)
    (can_stack b l) (can_stack b m) (can_stack b n) (can_stack b o) (can_stack b p)
    (can_stack b q) (can_stack b r) (can_stack b s) (can_stack b t)

    ; c on d..t
    (can_stack c d) (can_stack c e) (can_stack c f) (can_stack c g)
    (can_stack c h) (can_stack c i) (can_stack c j) (can_stack c k) (can_stack c l)
    (can_stack c m) (can_stack c n) (can_stack c o) (can_stack c p) (can_stack c q)
    (can_stack c r) (can_stack c s) (can_stack c t)

    ; d on e..t
    (can_stack d e) (can_stack d f) (can_stack d g) (can_stack d h)
    (can_stack d i) (can_stack d j) (can_stack d k) (can_stack d l) (can_stack d m)
    (can_stack d n) (can_stack d o) (can_stack d p) (can_stack d q) (can_stack d r)
    (can_stack d s) (can_stack d t)

    ; e on f..t
    (can_stack e f) (can_stack e g) (can_stack e h) (can_stack e i)
    (can_stack e j) (can_stack e k) (can_stack e l) (can_stack e m) (can_stack e n)
    (can_stack e o) (can_stack e p) (can_stack e q) (can_stack e r) (can_stack e s)
    (can_stack e t)

    ; f on g..t
    (can_stack f g) (can_stack f h) (can_stack f i) (can_stack f j)
    (can_stack f k) (can_stack f l) (can_stack f m) (can_stack f n) (can_stack f o)
    (can_stack f p) (can_stack f q) (can_stack f r) (can_stack f s) (can_stack f t)

    ; g on h..t
    (can_stack g h) (can_stack g i) (can_stack g j) (can_stack g k)
    (can_stack g l) (can_stack g m) (can_stack g n) (can_stack g o) (can_stack g p)
    (can_stack g q) (can_stack g r) (can_stack g s) (can_stack g t)

    ; h on i..t
    (can_stack h i) (can_stack h j) (can_stack h k) (can_stack h l)
    (can_stack h m) (can_stack h n) (can_stack h o) (can_stack h p) (can_stack h q)
    (can_stack h r) (can_stack h s) (can_stack h t)

    ; i on j..t
    (can_stack i j) (can_stack i k) (can_stack i l) (can_stack i m)
    (can_stack i n) (can_stack i o) (can_stack i p) (can_stack i q) (can_stack i r)
    (can_stack i s) (can_stack i t)

    ; j on k..t
    (can_stack j k) (can_stack j l) (can_stack j m) (can_stack j n)
    (can_stack j o) (can_stack j p) (can_stack j q) (can_stack j r) (can_stack j s)
    (can_stack j t)

    ; k on l..t
    (can_stack k l) (can_stack k m) (can_stack k n) (can_stack k o)
    (can_stack k p) (can_stack k q) (can_stack k r) (can_stack k s) (can_stack k t)

    ; l on m..t
    (can_stack l m) (can_stack l n) (can_stack l o) (can_stack l p)
    (can_stack l q) (can_stack l r) (can_stack l s) (can_stack l t)

    ; m on n..t
    (can_stack m n) (can_stack m o) (can_stack m p) (can_stack m q)
    (can_stack m r) (can_stack m s) (can_stack m t)

    ; n on o..t
    (can_stack n o) (can_stack n p) (can_stack n q) (can_stack n r)
    (can_stack n s) (can_stack n t)

    ; o on p..t
    (can_stack o p) (can_stack o q) (can_stack o r) (can_stack o s)
    (can_stack o t)

    ; p on q..t
    (can_stack p q) (can_stack p r) (can_stack p s) (can_stack p t)

    ; q on r..t
    (can_stack q r) (can_stack q s) (can_stack q t)

    ; r on s..t
    (can_stack r s) (can_stack r t)

    ; s on t
    (can_stack s t)
  )

  (:goal (and
    ;; Left peg must have (top->bottom) a, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t
    (on a d)
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

    ;; Middle peg holds disk c (top->bottom c)
    (on c middle)

    ;; Right peg holds disk b (top->bottom b)
    (on b right)
  ))
)