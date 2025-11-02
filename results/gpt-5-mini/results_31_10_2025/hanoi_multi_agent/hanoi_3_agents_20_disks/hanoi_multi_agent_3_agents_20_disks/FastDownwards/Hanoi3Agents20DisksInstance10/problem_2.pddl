(define (problem hanoi3agents20disksinstance10)
  (:domain hanoi-3agents-20disks)

  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
    agent_1 agent_2 agent_3 orchestrator - agent
  )

  (:init
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

    (can-move agent_1 a) (can-move agent_1 b) (can-move agent_1 c)
    (can-move agent_1 d) (can-move agent_1 e) (can-move agent_1 f) (can-move agent_1 g)
    (can-move agent_2 h) (can-move agent_2 i) (can-move agent_2 j)
    (can-move agent_2 k) (can-move agent_2 l) (can-move agent_2 m) (can-move agent_2 n)
    (can-move agent_3 o) (can-move agent_3 p) (can-move agent_3 q)
    (can-move agent_3 r) (can-move agent_3 s) (can-move agent_3 t)

    (bigger left a) (bigger left b) (bigger left c) (bigger left d) (bigger left e) (bigger left f)
    (bigger left g) (bigger left h) (bigger left i) (bigger left j) (bigger left k) (bigger left l)
    (bigger left m) (bigger left n) (bigger left o) (bigger left p) (bigger left q) (bigger left r)
    (bigger left s) (bigger left t)
    (bigger middle a) (bigger middle b) (bigger middle c) (bigger middle d) (bigger middle e) (bigger middle f)
    (bigger middle g) (bigger middle h) (bigger middle i) (bigger middle j) (bigger middle k) (bigger middle l)
    (bigger middle m) (bigger middle n) (bigger middle o) (bigger middle p) (bigger middle q) (bigger middle r)
    (bigger middle s) (bigger middle t)
    (bigger right a) (bigger right b) (bigger right c) (bigger right d) (bigger right e) (bigger right f)
    (bigger right g) (bigger right h) (bigger right i) (bigger right j) (bigger right k) (bigger right l)
    (bigger right m) (bigger right n) (bigger right o) (bigger right p) (bigger right q) (bigger right r)
    (bigger right s) (bigger right t)

    (bigger t a) (bigger t b) (bigger t c) (bigger t d) (bigger t e) (bigger t f)
    (bigger t g) (bigger t h) (bigger t i) (bigger t j) (bigger t k) (bigger t l)
    (bigger t m) (bigger t n) (bigger t o) (bigger t p) (bigger t q) (bigger t r)
    (bigger t s)

    (bigger s a) (bigger s b) (bigger s c) (bigger s d) (bigger s e) (bigger s f)
    (bigger s g) (bigger s h) (bigger s i) (bigger s j) (bigger s k) (bigger s l)
    (bigger s m) (bigger s n) (bigger s o) (bigger s p) (bigger s q) (bigger s r)

    (bigger r a) (bigger r b) (bigger r c) (bigger r d) (bigger r e) (bigger r f)
    (bigger r g) (bigger r h) (bigger r i) (bigger r j) (bigger r k) (bigger r l)
    (bigger r m) (bigger r n) (bigger r o) (bigger r p) (bigger r q)

    (bigger q a) (bigger q b) (bigger q c) (bigger q d) (bigger q e) (bigger q f)
    (bigger q g) (bigger q h) (bigger q i) (bigger q j) (bigger q k) (bigger q l)
    (bigger q m) (bigger q n) (bigger q o) (bigger q p)

    (bigger p a) (bigger p b) (bigger p c) (bigger p d) (bigger p e) (bigger p f)
    (bigger p g) (bigger p h) (bigger p i) (bigger p j) (bigger p k) (bigger p l)
    (bigger p m) (bigger p n) (bigger p o)

    (bigger o a) (bigger o b) (bigger o c) (bigger o d) (bigger o e) (bigger o f)
    (bigger o g) (bigger o h) (bigger o i) (bigger o j) (bigger o k) (bigger o l)
    (bigger o m) (bigger o n)

    (bigger n a) (bigger n b) (bigger n c) (bigger n d) (bigger n e) (bigger n f)
    (bigger n g) (bigger n h) (bigger n i) (bigger n j) (bigger n k) (bigger n l)
    (bigger n m)

    (bigger m a) (bigger m b) (bigger m c) (bigger m d) (bigger m e) (bigger m f)
    (bigger m g) (bigger m h) (bigger m i) (bigger m j) (bigger m k) (bigger m l)

    (bigger l a) (bigger l b) (bigger l c) (bigger l d) (bigger l e) (bigger l f)
    (bigger l g) (bigger l h) (bigger l i) (bigger l j) (bigger l k)

    (bigger k a) (bigger k b) (bigger k c) (bigger k d) (bigger k e) (bigger k f)
    (bigger k g) (bigger k h) (bigger k i) (bigger k j)

    (bigger j a) (bigger j b) (bigger j c) (bigger j d) (bigger j e) (bigger j f)
    (bigger j g) (bigger j h) (bigger j i)

    (bigger i a) (bigger i b) (bigger i c) (bigger i d) (bigger i e) (bigger i f)
    (bigger i g) (bigger i h)

    (bigger h a) (bigger h b) (bigger h c) (bigger h d) (bigger h e) (bigger h f) (bigger h g)

    (bigger g a) (bigger g b) (bigger g c) (bigger g d) (bigger g e) (bigger g f)

    (bigger f a) (bigger f b) (bigger f c) (bigger f d) (bigger f e)

    (bigger e a) (bigger e b) (bigger e c) (bigger e d)

    (bigger d a) (bigger d b) (bigger d c)

    (bigger c a) (bigger c b)

    (bigger b a)
  )

  (:goal
    (and
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
      (on o p)
      (on p q)
      (on q r)
      (on r s)
      (on s t)
      (on t left)

      (on a c)
      (on c middle)
    )
  )
)