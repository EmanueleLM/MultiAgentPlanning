(define (problem Hanoi2Agents20DisksInstance2-problem)
  (:domain hanoi-2agents-20)
  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
  )

  (:init
    ;; initial stacking: top->bottom on left: A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T
    ;; Represented as on A B, on B C, ..., on S T, on T left
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

    ;; only the top disk a is clear initially
    (clear a)

    ;; peg emptiness: left has t directly on it, so not empty; middle and right are empty
    (empty middle)
    (empty right)

    ;; agent capabilities
    ;; agent_1 can move disks A-J
    (can-move agent_1 a) (can-move agent_1 b) (can-move agent_1 c) (can-move agent_1 d)
    (can-move agent_1 e) (can-move agent_1 f) (can-move agent_1 g) (can-move agent_1 h)
    (can-move agent_1 i) (can-move agent_1 j)

    ;; agent_2 can move disks K-T
    (can-move agent_2 k) (can-move agent_2 l) (can-move agent_2 m) (can-move agent_2 n)
    (can-move agent_2 o) (can-move agent_2 p) (can-move agent_2 q) (can-move agent_2 r)
    (can-move agent_2 s) (can-move agent_2 t)

    ;; size ordering: larger X Y means X is larger than Y (X deeper / lower)
    ;; A < B < C < ... < T. Provide all pairwise larger facts.
    (larger b a) (larger c a) (larger c b) (larger d a) (larger d b) (larger d c)
    (larger e a) (larger e b) (larger e c) (larger e d)
    (larger f a) (larger f b) (larger f c) (larger f d) (larger f e)
    (larger g a) (larger g b) (larger g c) (larger g d) (larger g e) (larger g f)
    (larger h a) (larger h b) (larger h c) (larger h d) (larger h e) (larger h f) (larger h g)
    (larger i a) (larger i b) (larger i c) (larger i d) (larger i e) (larger i f) (larger i g) (larger i h)
    (larger j a) (larger j b) (larger j c) (larger j d) (larger j e) (larger j f) (larger j g) (larger j h) (larger j i)
    (larger k a) (larger k b) (larger k c) (larger k d) (larger k e) (larger k f) (larger k g) (larger k h) (larger k i) (larger k j)
    (larger l a) (larger l b) (larger l c) (larger l d) (larger l e) (larger l f) (larger l g) (larger l h) (larger l i) (larger l j) (larger l k)
    (larger m a) (larger m b) (larger m c) (larger m d) (larger m e) (larger m f) (larger m g) (larger m h) (larger m i) (larger m j) (larger m k) (larger m l)
    (larger n a) (larger n b) (larger n c) (larger n d) (larger n e) (larger n f) (larger n g) (larger n h) (larger n i) (larger n j) (larger n k) (larger n l) (larger n m)
    (larger o a) (larger o b) (larger o c) (larger o d) (larger o e) (larger o f) (larger o g) (larger o h) (larger o i) (larger o j) (larger o k) (larger o l) (larger o m) (larger o n)
    (larger p a) (larger p b) (larger p c) (larger p d) (larger p e) (larger p f) (larger p g) (larger p h) (larger p i) (larger p j) (larger p k) (larger p l) (larger p m) (larger p n) (larger p o)
    (larger q a) (larger q b) (larger q c) (larger q d) (larger q e) (larger q f) (larger q g) (larger q h) (larger q i) (larger q j) (larger q k) (larger q l) (larger q m) (larger q n) (larger q o) (larger q p)
    (larger r a) (larger r b) (larger r c) (larger r d) (larger r e) (larger r f) (larger r g) (larger r h) (larger r i) (larger r j) (larger r k) (larger r l) (larger r m) (larger r n) (larger r o) (larger r p) (larger r q)
    (larger s a) (larger s b) (larger s c) (larger s d) (larger s e) (larger s f) (larger s g) (larger s h) (larger s i) (larger s j) (larger s k) (larger s l) (larger s m) (larger s n) (larger s o) (larger s p) (larger s q) (larger s r)
    (larger t a) (larger t b) (larger t c) (larger t d) (larger t e) (larger t f) (larger t g) (larger t h) (larger t i) (larger t j) (larger t k) (larger t l) (larger t m) (larger t n) (larger t o) (larger t p) (larger t q) (larger t r) (larger t s)
  )

  (:goal (and
    ;; left peg must have top->bottom: E F G H I J K L M N O P Q R S T
    (on e f) (on f g) (on g h) (on h i) (on i j) (on j k) (on k l) (on l m) (on m n)
    (on n o) (on o p) (on p q) (on q r) (on r s) (on s t) (on t left)

    ;; middle peg top->bottom: B C
    (on b c) (on c middle)

    ;; right peg top->bottom: A D
    (on a d) (on d right)
  ))
)